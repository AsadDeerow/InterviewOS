"use client";

import { useCallback, useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { clearStoredToken, getStoredToken } from "@/lib/auth";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type BillingPlan = "basic" | "pro";
type BillingInterval = "monthly" | "yearly";

type BillingStatusResponse = {
  subscriptionStatus: string;
  subscriptionPlan: string | null;
  subscriptionInterval: string | null;
};

type ApiResponse = {
  message?: string;
  url?: string;
};

// Keep display pricing local until Stripe price amounts are surfaced by the backend.
const pricingCatalog: Record<
  BillingPlan,
  {
    subtitle: string;
    eyebrow: string;
    prices: Record<BillingInterval, { amount: string; cadence: string; note: string }>;
    features: string[];
    recommended: boolean;
    cardClass: string;
    priceClass: string;
  }
> = {
  basic: {
    eyebrow: "Core plan",
    subtitle: "Straightforward paid access for steady interview prep.",
    prices: {
      monthly: { amount: "£9", cadence: "/ month", note: "Billed monthly" },
      yearly: { amount: "£108", cadence: "/ year", note: "Billed yearly" },
    },
    features: [
      "Unlimited interview starts beyond the free-tier cap",
      "Stored session history and replayable feedback",
      "Current AI evaluation flow with written feedback",
      "Monthly or yearly billing through Stripe Checkout",
    ],
    recommended: false,
    cardClass: "border-slate-200 bg-white dark:border-white/10 dark:bg-slate-950/70",
    priceClass: "bg-slate-950 text-white dark:bg-slate-900",
  },
  pro: {
    eyebrow: "Recommended",
    subtitle: "The premium tier positioned for heavier prep cycles.",
    prices: {
      monthly: { amount: "£15", cadence: "/ month", note: "Billed monthly" },
      yearly: { amount: "£180", cadence: "/ year", note: "Billed yearly" },
    },
    features: [
      "Everything in Basic with the premium subscription tier",
      "Premium plan state saved directly on your account",
      "Best fit for higher-frequency practice cycles",
      "Priority for richer reporting rollouts as they ship",
    ],
    recommended: true,
    cardClass:
      "border-[color:var(--brand-primary)]/35 bg-[linear-gradient(180deg,rgba(255,255,255,0.98)_0%,rgba(239,246,255,0.96)_100%)] shadow-[0_30px_60px_-40px_rgba(37,99,235,0.7)] dark:border-[color:var(--brand-primary)]/60 dark:bg-[linear-gradient(180deg,rgba(15,23,42,0.95)_0%,rgba(30,41,59,0.98)_100%)]",
    priceClass: "bg-[linear-gradient(135deg,#111827_0%,#1d4ed8_100%)] text-white dark:bg-[linear-gradient(135deg,#0f172a_0%,#1e40af_100%)]",
  },
};

const billingIntervalLabels: Record<BillingInterval, string> = {
  monthly: "Monthly",
  yearly: "Yearly",
};

const billingPlanLabels: Record<BillingPlan, string> = {
  basic: "Basic",
  pro: "Pro",
};

function normalizeBillingPlan(plan: string | null | undefined): BillingPlan | null {
  if (!plan) {
    return null;
  }

  const normalizedPlan = plan.trim().toLowerCase();
  if (normalizedPlan === "basic" || normalizedPlan === "pro") {
    return normalizedPlan;
  }

  return null;
}

function normalizeBillingInterval(interval: string | null | undefined): BillingInterval | null {
  if (!interval) {
    return null;
  }

  const normalizedInterval = interval.trim().toLowerCase();
  if (normalizedInterval === "monthly" || normalizedInterval === "month") {
    return "monthly";
  }
  if (normalizedInterval === "yearly" || normalizedInterval === "year") {
    return "yearly";
  }

  return null;
}

function formatBillingStatus(status: string | null | undefined) {
  if (!status) {
    return "FREE";
  }

  return status.replaceAll("_", " ").toUpperCase();
}

export function PricingSurface() {
  const router = useRouter();

  const [loading, setLoading] = useState(true);
  const [billingReturn, setBillingReturn] = useState<string | null>(null);
  const [billingStatus, setBillingStatus] = useState<BillingStatusResponse | null>(null);
  const [selectedPlan, setSelectedPlan] = useState<BillingPlan>("pro");
  const [selectedInterval, setSelectedInterval] = useState<BillingInterval>("monthly");
  const [error, setError] = useState("");
  const [startingCheckoutPlan, setStartingCheckoutPlan] = useState<BillingPlan | null>(null);

  const clearAuthAndRedirect = useCallback(() => {
    clearStoredToken();
    router.push("/login");
  }, [router]);

  const loadBillingStatus = useCallback(async () => {
    const token = getStoredToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    setLoading(true);

    try {
      const res = await fetch(`${API_BASE}/api/billing/status`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      if (!res.ok) {
        setError("Could not load billing status.");
        return;
      }

      const data = (await res.json()) as BillingStatusResponse;
      setBillingStatus(data);

      const currentPlan = normalizeBillingPlan(data.subscriptionPlan);
      const currentInterval = normalizeBillingInterval(data.subscriptionInterval);
      if (currentPlan) {
        setSelectedPlan(currentPlan);
      }
      if (currentInterval) {
        setSelectedInterval(currentInterval);
      }
    } catch {
      setError("Could not load billing status.");
    } finally {
      setLoading(false);
    }
  }, [clearAuthAndRedirect]);

  useEffect(() => {
    if (typeof window === "undefined") {
      return;
    }

    setBillingReturn(new URLSearchParams(window.location.search).get("billing"));
  }, []);

  useEffect(() => {
    void loadBillingStatus();
  }, [loadBillingStatus]);

  const currentPlan = normalizeBillingPlan(billingStatus?.subscriptionPlan);
  const currentInterval = normalizeBillingInterval(billingStatus?.subscriptionInterval);
  const hasActiveSubscription =
    billingStatus?.subscriptionStatus === "ACTIVE" && currentPlan !== null && currentInterval !== null;

  async function handleCheckout(plan: BillingPlan) {
    const token = getStoredToken();
    const isCurrentSelection =
      hasActiveSubscription && currentPlan === plan && currentInterval === selectedInterval;

    setSelectedPlan(plan);

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    if (isCurrentSelection) {
      return;
    }

    setStartingCheckoutPlan(plan);
    setError("");

    try {
      const res = await fetch(`${API_BASE}/api/billing/create-checkout-session`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          plan,
          interval: selectedInterval,
        }),
      });

      let data: ApiResponse = {};
      try {
        data = (await res.json()) as ApiResponse;
      } catch {
        data = {};
      }

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      if (!res.ok || !data.url) {
        setError(data.message || "Could not start checkout.");
        return;
      }

      window.location.assign(data.url);
    } catch {
      setError("Could not start checkout.");
    } finally {
      setStartingCheckoutPlan(null);
    }
  }

  let statusSummary = "Free plan";
  if (hasActiveSubscription && currentPlan && currentInterval) {
    statusSummary = `${billingPlanLabels[currentPlan]} ${billingIntervalLabels[currentInterval]}`;
  } else if (billingStatus?.subscriptionStatus === "PAST_DUE" && currentPlan && currentInterval) {
    statusSummary = `${billingPlanLabels[currentPlan]} ${billingIntervalLabels[currentInterval]} past due`;
  } else if (billingStatus?.subscriptionStatus === "CANCELLED" && currentPlan && currentInterval) {
    statusSummary = `${billingPlanLabels[currentPlan]} ${billingIntervalLabels[currentInterval]} cancelled`;
  }

  return (
    <div className="overflow-hidden rounded-[36px] border border-slate-200 bg-[linear-gradient(180deg,rgba(255,255,255,0.98)_0%,rgba(248,250,252,0.98)_100%)] p-6 shadow-[0_28px_70px_-42px_rgba(15,23,42,0.45)] dark:border-white/10 dark:bg-[linear-gradient(180deg,rgba(15,23,42,0.98)_0%,rgba(15,23,42,0.92)_100%)] md:p-8 xl:p-10">
      <div className="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.22em] text-slate-500 dark:text-slate-400">
            Pricing
          </p>
          <h1 className="mt-3 text-4xl font-semibold tracking-tight text-[var(--heading)] dark:text-white md:text-5xl">
            Choose your plan
          </h1>
        </div>

        <div className="inline-flex items-center gap-3 rounded-full border border-slate-200 bg-white px-4 py-2 text-sm font-medium text-slate-600 shadow-sm dark:border-white/10 dark:bg-slate-950 dark:text-slate-200">
          <span className="inline-flex h-2.5 w-2.5 rounded-full bg-[var(--brand-primary)]" />
          <span>{statusSummary}</span>
          <span className="rounded-full bg-slate-100 px-3 py-1 text-xs font-semibold uppercase tracking-[0.1em] text-slate-700 dark:bg-slate-800 dark:text-slate-200">
            {formatBillingStatus(billingStatus?.subscriptionStatus)}
          </span>
        </div>
      </div>

      <div className="mt-6 inline-flex rounded-full border border-slate-200 bg-white p-1 shadow-sm dark:border-white/10 dark:bg-slate-950">
        {(Object.entries(billingIntervalLabels) as Array<[BillingInterval, string]>).map(([interval, label]) => (
          <button
            key={interval}
            type="button"
            onClick={() => setSelectedInterval(interval)}
            className={cn(
              "rounded-full px-5 py-2.5 text-sm font-semibold transition-all",
              selectedInterval === interval
                ? "bg-[var(--brand-primary)] text-white shadow-[0_12px_25px_-18px_rgba(37,99,235,0.85)]"
                : "text-slate-500 hover:text-[var(--heading)] dark:text-slate-300 dark:hover:text-white",
            )}
          >
            {label}
          </button>
        ))}
      </div>

      <div className="mt-6 space-y-3">
        {billingReturn === "success" && (
          <Alert variant="success">Checkout completed. Your subscription status will refresh here as Stripe events finish.</Alert>
        )}
        {billingReturn === "cancel" && <Alert>Checkout cancelled. You can choose a different plan or interval below.</Alert>}
        {error && <Alert variant="destructive">{error}</Alert>}
        {!error && billingStatus?.subscriptionStatus === "PAST_DUE" && (
          <Alert variant="destructive">Your last payment did not clear. Choose a plan to resume paid access.</Alert>
        )}
      </div>

      <div className="mt-8 grid gap-6 xl:grid-cols-2">
        {(Object.entries(pricingCatalog) as Array<
          [BillingPlan, (typeof pricingCatalog)[BillingPlan]]
        >).map(([plan, details]) => {
          const planPrice = details.prices[selectedInterval];
          const isSelected = selectedPlan === plan;
          const isCurrentPlan = hasActiveSubscription && currentPlan === plan;
          const isCurrentSelection = isCurrentPlan && currentInterval === selectedInterval;
          const isSwitchingFromCurrent = isCurrentPlan && currentInterval !== selectedInterval;

          let ctaLabel = plan === "pro" ? "Upgrade to Pro" : "Choose Basic";
          if (isCurrentSelection) {
            ctaLabel = "Current Plan";
          } else if (isSwitchingFromCurrent) {
            ctaLabel = `Switch to ${billingIntervalLabels[selectedInterval]}`;
          } else if (hasActiveSubscription && currentPlan === "pro" && plan === "basic") {
            ctaLabel = "Switch to Basic";
          } else if (!hasActiveSubscription && plan === "pro") {
            ctaLabel = "Choose Pro";
          }

          return (
            <article
              key={plan}
              className={cn(
                "relative flex min-h-[560px] flex-col rounded-[32px] border p-6 transition-all dark:shadow-none",
                details.cardClass,
                details.recommended && "shadow-[0_35px_80px_-42px_rgba(37,99,235,0.75)]",
                isSelected && "translate-y-[-4px] border-[var(--brand-primary)] shadow-[0_30px_70px_-45px_rgba(37,99,235,0.9)]",
                isCurrentSelection && "ring-2 ring-emerald-400/80",
              )}
              onClick={() => setSelectedPlan(plan)}
            >
              {details.recommended && (
                <div className="absolute left-6 top-0 -translate-y-1/2 rounded-full bg-[var(--brand-primary)] px-4 py-2 text-xs font-semibold uppercase tracking-[0.16em] text-white shadow-[0_16px_40px_-24px_rgba(37,99,235,0.8)]">
                  Recommended
                </div>
              )}

              <div className="flex items-start justify-between gap-4">
                <div>
                  <p className="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500 dark:text-slate-400">
                    {details.eyebrow}
                  </p>
                  <h2 className="mt-4 text-3xl font-semibold text-[var(--heading)] dark:text-white">
                    {billingPlanLabels[plan]}
                  </h2>
                  <p className="mt-3 max-w-sm text-sm text-slate-500 dark:text-slate-300">{details.subtitle}</p>
                </div>

                <div className="flex flex-col items-end gap-2">
                  {isCurrentPlan && (
                    <span className="rounded-full bg-emerald-100 px-3 py-1 text-xs font-semibold uppercase tracking-[0.12em] text-emerald-700 dark:bg-emerald-950/60 dark:text-emerald-200">
                      Current
                    </span>
                  )}
                  {isSelected && !isCurrentSelection && (
                    <span className="rounded-full bg-slate-900 px-3 py-1 text-xs font-semibold uppercase tracking-[0.12em] text-white dark:bg-white dark:text-slate-950">
                      Selected
                    </span>
                  )}
                </div>
              </div>

              <div className={cn("mt-6 rounded-[26px] p-5 shadow-[inset_0_1px_0_rgba(255,255,255,0.16)]", details.priceClass)}>
                <p className="text-xs font-semibold uppercase tracking-[0.18em] text-white/70">
                  {billingIntervalLabels[selectedInterval]}
                </p>
                <div className="mt-4 flex items-end gap-3">
                  <span className="text-5xl font-semibold tracking-tight">{planPrice.amount}</span>
                  <span className="pb-2 text-sm font-medium text-white/75">{planPrice.cadence}</span>
                </div>
                <p className="mt-3 text-sm text-white/75">{planPrice.note}</p>
              </div>

              <ul className="mt-6 space-y-3 text-sm text-slate-700 dark:text-slate-200">
                {details.features.map((feature) => (
                  <li key={feature} className="flex items-start gap-3">
                    <span className="mt-1 inline-flex h-2.5 w-2.5 flex-none rounded-full bg-[var(--brand-primary)]" />
                    <span>{feature}</span>
                  </li>
                ))}
              </ul>

              <div className="mt-auto pt-8">
                {isCurrentPlan && currentInterval && (
                  <p className="mb-4 text-sm text-slate-500 dark:text-slate-300">
                    {isCurrentSelection
                      ? `${billingPlanLabels[plan]} ${billingIntervalLabels[currentInterval].toLowerCase()} is active.`
                      : `Currently billed ${billingIntervalLabels[currentInterval].toLowerCase()}.`}
                  </p>
                )}

                <Button
                  onClick={(event) => {
                    event.stopPropagation();
                    void handleCheckout(plan);
                  }}
                  disabled={loading || startingCheckoutPlan !== null || isCurrentSelection}
                  variant={plan === "pro" || isSelected ? "default" : "outline"}
                  className={cn(
                    "h-12 w-full rounded-[16px] text-sm font-semibold",
                    plan === "pro" && !isCurrentSelection && "shadow-[0_18px_35px_-22px_rgba(37,99,235,0.7)]",
                  )}
                >
                  {startingCheckoutPlan === plan ? "Redirecting..." : ctaLabel}
                </Button>
              </div>
            </article>
          );
        })}
      </div>
    </div>
  );
}
