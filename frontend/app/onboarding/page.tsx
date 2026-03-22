"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Loader2, Server, BarChart3, Briefcase } from "lucide-react";
import { getStoredToken, clearStoredToken } from "@/lib/auth";
import { cn } from "@/lib/utils";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type RoleOption = {
  key: string;
  label: string;
  description: string;
  icon: React.ElementType;
};

const roles: RoleOption[] = [
  {
    key: "BACKEND_ENGINEER",
    label: "Backend Engineer",
    description: "APIs, databases, system design, concurrency, and security.",
    icon: Server,
  },
  {
    key: "DATA_SCIENTIST",
    label: "Data Scientist",
    description: "Statistics, machine learning, model evaluation, and data cleaning.",
    icon: BarChart3,
  },
  {
    key: "PRODUCT_MANAGER",
    label: "Product Manager",
    description: "Product sense, metrics, roadmap prioritization, and stakeholder management.",
    icon: Briefcase,
  },
];

export default function OnboardingPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [selected, setSelected] = useState<string | null>(null);
  const [error, setError] = useState("");

  useEffect(() => {
    async function check() {
      const token = getStoredToken();
      if (!token) {
        router.replace("/login");
        return;
      }
      try {
        const res = await fetch(`${API_BASE}/api/user/profile`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        if (res.status === 401) {
          clearStoredToken();
          router.replace("/login");
          return;
        }
        if (res.ok) {
          const data = await res.json();
          if (data.role) {
            router.replace("/dashboard");
            return;
          }
        }
        // If not ok but not 401, just show the onboarding form
      } catch {
        // Network error — still show onboarding
      }
      setLoading(false);
    }
    void check();
  }, [router]);

  async function handleContinue() {
    if (!selected) return;
    const token = getStoredToken();
    if (!token) {
      router.replace("/login");
      return;
    }
    setSaving(true);
    setError("");
    try {
      const res = await fetch(`${API_BASE}/api/user/role`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ role: selected }),
      });
      if (!res.ok) {
        const data = await res.json().catch(() => ({}));
        setError(data.message || "Could not save role. Please try again.");
        return;
      }
      router.replace("/dashboard");
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setSaving(false);
    }
  }

  if (loading) {
    return (
      <section className="mx-auto flex max-w-xl items-center justify-center py-20">
        <Loader2 className="h-6 w-6 animate-spin text-slate-400" />
      </section>
    );
  }

  return (
    <section className="mx-auto max-w-xl">
      <div className="space-y-6">
        <div className="space-y-2">
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-slate-400 dark:text-slate-500">
            One more step
          </p>
          <h1 className="text-2xl font-bold tracking-tight text-slate-900 dark:text-white">
            What role are you preparing for?
          </h1>
          <p className="text-sm text-slate-500 dark:text-slate-400">
            This determines which topics you&apos;ll practice. You can change it later in settings.
          </p>
        </div>

        <div className="grid gap-3">
          {roles.map((role) => {
            const Icon = role.icon;
            const isSelected = selected === role.key;
            return (
              <button
                key={role.key}
                type="button"
                onClick={() => setSelected(role.key)}
                className={cn(
                  "flex items-start gap-4 rounded-xl border p-5 text-left transition-all",
                  isSelected
                    ? "border-slate-900 bg-slate-900 text-white dark:border-white dark:bg-white dark:text-slate-900"
                    : "border-slate-200 bg-white hover:border-slate-300 dark:border-white/10 dark:bg-slate-900/60 dark:hover:border-white/20",
                )}
              >
                <div
                  className={cn(
                    "flex h-10 w-10 flex-none items-center justify-center rounded-lg",
                    isSelected
                      ? "bg-white/15 dark:bg-slate-900/20"
                      : "bg-slate-100 dark:bg-slate-800",
                  )}
                >
                  <Icon
                    className={cn(
                      "h-5 w-5",
                      isSelected ? "text-white dark:text-slate-900" : "text-slate-500",
                    )}
                  />
                </div>
                <div>
                  <p className="text-sm font-semibold">{role.label}</p>
                  <p
                    className={cn(
                      "mt-0.5 text-xs",
                      isSelected
                        ? "text-white/70 dark:text-slate-500"
                        : "text-slate-500 dark:text-slate-400",
                    )}
                  >
                    {role.description}
                  </p>
                </div>
              </button>
            );
          })}
        </div>

        {error && (
          <p className="rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700 dark:border-red-800 dark:bg-red-950/30 dark:text-red-300">
            {error}
          </p>
        )}

        <button
          type="button"
          onClick={handleContinue}
          disabled={!selected || saving}
          className="flex w-full items-center justify-center gap-2 rounded-xl bg-slate-900 px-5 py-3 text-sm font-semibold text-white transition hover:bg-slate-800 disabled:opacity-40 dark:bg-white dark:text-slate-900 dark:hover:bg-slate-100"
        >
          {saving && <Loader2 className="h-4 w-4 animate-spin" />}
          {saving ? "Saving..." : "Continue to Dashboard"}
        </button>
      </div>
    </section>
  );
}
