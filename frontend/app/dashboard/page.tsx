"use client";

import Link from "next/link";
import { useCallback, useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { DashboardShell, type DashboardTabKey } from "@/components/dashboard-shell";
import { clearStoredToken, getStoredToken } from "@/lib/auth";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type InterviewRole = "BACKEND_ENGINEER" | "DATA_SCIENTIST" | "PRODUCT_MANAGER";
type DashboardTab = DashboardTabKey;
type BillingPlan = "basic" | "pro";
type BillingInterval = "monthly" | "yearly";

type InterviewQuestion = { questionId: number; text: string };
type InterviewSessionResponse = { sessionId: number; role: InterviewRole; questions: InterviewQuestion[] };
type ApiResponse = { error?: string; message?: string };
type Evaluation = {
  questionId: number;
  score: number;
  strengths: string[];
  weaknesses: string[];
  feedback: string;
  modelAnswer: string;
};
type SubmitAnswersResponse = { overallScore: number; evaluations: Evaluation[] };
type SessionHistoryItem = { id: number; role: string; createdAt: string; status: string };
type SessionDetailEvaluation = {
  questionId: number;
  question: string;
  answer: string;
  score: number | null;
  feedback: string | null;
  strengths: string[];
  weaknesses: string[];
  modelAnswer: string | null;
};
type SessionDetailResponse = {
  id: number;
  role: string;
  createdAt: string;
  status: string;
  evaluations: SessionDetailEvaluation[];
};
type BillingStatusResponse = {
  subscriptionStatus: string;
  subscriptionPlan: string | null;
  subscriptionInterval: string | null;
};

const roleLabels: Record<InterviewRole, string> = {
  BACKEND_ENGINEER: "Backend Engineer",
  DATA_SCIENTIST: "Data Scientist",
  PRODUCT_MANAGER: "Product Manager",
};

const billingPlanLabels: Record<BillingPlan, string> = {
  basic: "Basic",
  pro: "Pro",
};

const billingIntervalLabels: Record<BillingInterval, string> = {
  monthly: "Monthly",
  yearly: "Yearly",
};

const tabTitles: Record<DashboardTab, string> = {
  workspace: "Workspace",
  interview: "Interview",
  history: "History",
  settings: "Settings",
};

const tabDescriptions: Record<DashboardTab, string> = {
  workspace: "Quick actions, plan status, and your next practice step.",
  interview: "Start a new interview and work through the active session.",
  history: "Review completed sessions and stored feedback.",
  settings: "Account and product preferences without billing clutter.",
};

function formatSessionDate(createdAt: string) {
  return new Intl.DateTimeFormat(undefined, {
    dateStyle: "long",
    timeStyle: "short",
  }).format(new Date(createdAt));
}

function isInCurrentMonth(createdAt: string) {
  const sessionDate = new Date(createdAt);
  const now = new Date();
  return sessionDate.getFullYear() === now.getFullYear() && sessionDate.getMonth() === now.getMonth();
}

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

function tabFromHash(hash: string): DashboardTab {
  const normalizedHash = hash.replace("#", "").trim().toLowerCase();
  if (normalizedHash === "interview" || normalizedHash === "history" || normalizedHash === "settings") {
    return normalizedHash;
  }

  return "workspace";
}

export default function DashboardPage() {
  const router = useRouter();

  const [loading, setLoading] = useState(true);
  const [billingReturn, setBillingReturn] = useState<string | null>(null);
  const [error, setError] = useState("");
  const [upgradeMessage, setUpgradeMessage] = useState("");
  const [activeTab, setActiveTab] = useState<DashboardTab>("workspace");
  const [selectedRole, setSelectedRole] = useState<InterviewRole>("BACKEND_ENGINEER");
  const [billingStatus, setBillingStatus] = useState<BillingStatusResponse | null>(null);
  const [startingInterview, setStartingInterview] = useState(false);
  const [submittingAnswers, setSubmittingAnswers] = useState(false);
  const [activeSession, setActiveSession] = useState<InterviewSessionResponse | null>(null);
  const [draftAnswers, setDraftAnswers] = useState<Record<number, string>>({});
  const [result, setResult] = useState<SubmitAnswersResponse | null>(null);
  const [sessions, setSessions] = useState<SessionHistoryItem[]>([]);
  const [historyLoading, setHistoryLoading] = useState(false);
  const [historyLoaded, setHistoryLoaded] = useState(false);
  const [historyError, setHistoryError] = useState("");
  const [selectedSessionId, setSelectedSessionId] = useState<number | null>(null);
  const [selectedSessionDetail, setSelectedSessionDetail] = useState<SessionDetailResponse | null>(null);
  const [sessionDetailLoadingId, setSessionDetailLoadingId] = useState<number | null>(null);
  const [sessionDetailError, setSessionDetailError] = useState("");

  const clearAuthAndRedirect = useCallback(() => {
    clearStoredToken();
    router.push("/login");
  }, [router]);

  const selectTab = useCallback((tab: DashboardTab) => {
    setActiveTab(tab);

    if (typeof window === "undefined") {
      return;
    }

    const url = new URL(window.location.href);
    url.hash = tab === "workspace" ? "" : tab;
    window.history.replaceState(null, "", `${url.pathname}${url.search}${url.hash}`);
  }, []);

  const loadBillingStatus = useCallback(
    async (token: string) => {
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
          return;
        }

        const data = (await res.json()) as BillingStatusResponse;
        setBillingStatus(data);
      } catch {
        // Workspace still renders if billing status cannot be loaded.
      }
    },
    [clearAuthAndRedirect],
  );

  const fetchHistory = useCallback(async () => {
    const token = getStoredToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    setHistoryLoading(true);
    setHistoryError("");

    try {
      const res = await fetch(`${API_BASE}/api/interviews/sessions`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      let data: ApiResponse | SessionHistoryItem[] = { message: "Could not load session history." };
      try {
        data = (await res.json()) as ApiResponse | SessionHistoryItem[];
      } catch {
        data = { message: "Could not load session history." };
      }

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      if (!res.ok) {
        setHistoryError((!Array.isArray(data) && data.message) || "Could not load session history.");
        return;
      }

      setSessions(Array.isArray(data) ? data : []);
      setHistoryLoaded(true);
    } catch {
      setHistoryError("Could not load session history.");
    } finally {
      setHistoryLoading(false);
    }
  }, [clearAuthAndRedirect]);

  async function handleStartInterview() {
    const token = getStoredToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    setStartingInterview(true);
    setError("");
    setUpgradeMessage("");
    setActiveSession(null);
    setResult(null);

    try {
      const res = await fetch(`${API_BASE}/api/interviews/start`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ role: selectedRole }),
      });

      let data: ApiResponse | InterviewSessionResponse = { message: "Could not start interview." };
      try {
        data = (await res.json()) as ApiResponse | InterviewSessionResponse;
      } catch {
        data = { message: "Could not start interview." };
      }

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      const apiErrorCode = !Array.isArray(data) && "error" in data ? data.error : undefined;
      const apiErrorMessage = !Array.isArray(data) && "message" in data ? data.message : undefined;

      if (res.status === 403 && apiErrorCode === "FREE_TIER_LIMIT_REACHED") {
        setUpgradeMessage(apiErrorMessage || "You have used your 2 free sessions this month. Upgrade to continue practicing.");
        return;
      }

      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not start interview.");
        return;
      }

      const session = data as InterviewSessionResponse;
      setActiveSession(session);
      setDraftAnswers(
        Object.fromEntries(session.questions.map((question) => [question.questionId, ""])) as Record<number, string>,
      );
      setSessions((current) => [
        {
          id: session.sessionId,
          role: roleLabels[session.role],
          createdAt: new Date().toISOString(),
          status: "IN_PROGRESS",
        },
        ...current.filter((item) => item.id !== session.sessionId),
      ]);
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setStartingInterview(false);
    }
  }

  async function handleViewFeedback(sessionId: number) {
    const token = getStoredToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    setSelectedSessionId(sessionId);
    setSessionDetailLoadingId(sessionId);
    setSessionDetailError("");
    setSelectedSessionDetail((current) => (current?.id === sessionId ? current : null));

    try {
      const res = await fetch(`${API_BASE}/api/interviews/sessions/${sessionId}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      let data: ApiResponse | SessionDetailResponse = { message: "Could not load session feedback." };
      try {
        data = (await res.json()) as ApiResponse | SessionDetailResponse;
      } catch {
        data = { message: "Could not load session feedback." };
      }

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      if (!res.ok) {
        const message = !Array.isArray(data) && "message" in data ? data.message : undefined;
        setSessionDetailError(message || "Could not load session feedback.");
        setSelectedSessionDetail(null);
        return;
      }

      setSessionDetailError("");
      setSelectedSessionDetail(data as SessionDetailResponse);
    } catch {
      setSessionDetailError("Could not load session feedback.");
      setSelectedSessionDetail(null);
    } finally {
      setSessionDetailLoadingId(null);
    }
  }

  function handleCloseFeedback() {
    setSelectedSessionId(null);
    setSelectedSessionDetail(null);
    setSessionDetailError("");
    setSessionDetailLoadingId(null);
  }

  function handleAnswerChange(questionId: number, value: string) {
    setDraftAnswers((current) => ({
      ...current,
      [questionId]: value,
    }));
  }

  async function handleSubmitAnswers() {
    if (!activeSession) {
      return;
    }

    const token = getStoredToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    const missingAnswer = activeSession.questions.find((question) => !(draftAnswers[question.questionId] || "").trim());
    if (missingAnswer) {
      setError("Answer every question before submitting.");
      return;
    }

    setSubmittingAnswers(true);
    setError("");

    try {
      const res = await fetch(`${API_BASE}/api/interviews/${activeSession.sessionId}/submit`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          answers: activeSession.questions.map((question) => ({
            questionId: question.questionId,
            answerText: draftAnswers[question.questionId] || "",
          })),
        }),
      });

      let data: ApiResponse | SubmitAnswersResponse = { message: "Could not submit answers." };
      try {
        data = (await res.json()) as ApiResponse | SubmitAnswersResponse;
      } catch {
        data = { message: "Could not submit answers." };
      }

      if (res.status === 401) {
        clearAuthAndRedirect();
        return;
      }

      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not submit answers.");
        return;
      }

      const response = data as SubmitAnswersResponse;
      setResult(response);
      setSessions((current) =>
        current.map((session) =>
          session.id === activeSession.sessionId
            ? {
                ...session,
                status: "COMPLETED",
              }
            : session,
        ),
      );
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setSubmittingAnswers(false);
    }
  }

  function renderFeedbackList(items: string[], emptyMessage: string) {
    if (items.length === 0) {
      return <li>{emptyMessage}</li>;
    }

    return items.map((item) => <li key={item}>- {item}</li>);
  }

  const evaluationsByQuestionId = new Map(result?.evaluations.map((evaluation) => [evaluation.questionId, evaluation]) ?? []);
  const sessionsThisMonth = sessions.filter((session) => isInCurrentMonth(session.createdAt)).length;
  const remainingFreeSessions = Math.max(0, 2 - sessionsThisMonth);
  const selectedSessionHasFeedback = Boolean(
    selectedSessionDetail?.evaluations.some(
      (evaluation) => Boolean(evaluation.answer.trim()) || evaluation.score !== null || Boolean(evaluation.feedback),
    ),
  );

  const currentPlan = normalizeBillingPlan(billingStatus?.subscriptionPlan);
  const currentInterval = normalizeBillingInterval(billingStatus?.subscriptionInterval);
  const hasActiveSubscription =
    billingStatus?.subscriptionStatus === "ACTIVE" && currentPlan !== null && currentInterval !== null;

  useEffect(() => {
    if (typeof window === "undefined") {
      return;
    }

    setBillingReturn(new URLSearchParams(window.location.search).get("billing"));
  }, []);

  useEffect(() => {
    if (billingReturn === "success" || billingReturn === "cancel") {
      router.replace(`/dashboard/pricing?billing=${billingReturn}`);
    }
  }, [billingReturn, router]);

  useEffect(() => {
    if (typeof window === "undefined") {
      return;
    }

    const syncTabFromHash = () => {
      setActiveTab(tabFromHash(window.location.hash));
    };

    syncTabFromHash();
    window.addEventListener("hashchange", syncTabFromHash);

    return () => {
      window.removeEventListener("hashchange", syncTabFromHash);
    };
  }, []);

  useEffect(() => {
    async function loadDashboard() {
      if (billingReturn === "success" || billingReturn === "cancel") {
        return;
      }

      const token = getStoredToken();

      if (!token) {
        clearAuthAndRedirect();
        return;
      }

      try {
        const res = await fetch(`${API_BASE}/api/health`, {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (res.status === 401) {
          clearAuthAndRedirect();
          return;
        }

        if (!res.ok) {
          setError("Something went wrong. Please try again.");
          return;
        }

        await loadBillingStatus(token);
      } catch {
        setError("Something went wrong. Please try again.");
      } finally {
        setLoading(false);
      }
    }

    void loadDashboard();
  }, [billingReturn, clearAuthAndRedirect, loadBillingStatus]);

  useEffect(() => {
    if (loading || historyLoading || activeTab !== "history" || historyLoaded || Boolean(historyError)) {
      return;
    }

    void fetchHistory();
  }, [activeTab, fetchHistory, historyError, historyLoaded, historyLoading, loading]);

  if (loading) {
    return (
      <section className="mx-auto max-w-5xl">
        <Card className="border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
          <CardHeader>
            <CardTitle className="text-[var(--heading)] dark:text-[#f8fafc]">Workspace</CardTitle>
            <CardDescription className="text-[var(--muted-foreground)] dark:text-[#9ca3af]">Loading your dashboard...</CardDescription>
          </CardHeader>
        </Card>
      </section>
    );
  }

  return (
    <DashboardShell activeItem={activeTab} onTabSelect={selectTab}>
      <Card className="min-w-0 border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <CardHeader>
          <div>
            <CardTitle className="text-[var(--heading)] dark:text-[#f8fafc]">{tabTitles[activeTab]}</CardTitle>
            <CardDescription className="text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              {tabDescriptions[activeTab]}
            </CardDescription>
          </div>
        </CardHeader>

        <CardContent className="space-y-4">
          {error && <Alert variant="destructive">{error}</Alert>}

          {activeTab === "workspace" && (
            <div className="space-y-4">
              <div className="grid gap-4 xl:grid-cols-[1.3fr,0.9fr]">
                <div className="rounded-[28px] border border-slate-200 bg-[linear-gradient(180deg,rgba(248,250,252,0.95)_0%,rgba(255,255,255,0.98)_100%)] p-6 shadow-[0_24px_50px_-38px_rgba(15,23,42,0.55)] dark:border-white/10 dark:bg-[linear-gradient(180deg,rgba(15,23,42,0.92)_0%,rgba(15,23,42,0.98)_100%)]">
                  <p className="text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Interview practice
                  </p>
                  <h2 className="mt-3 text-3xl font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                    Start your next session
                  </h2>
                  <p className="mt-3 max-w-xl text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Pick a role, answer the questions, and review the feedback report when you submit.
                  </p>

                  <div className="mt-6 flex flex-wrap gap-3">
                    <Button onClick={() => selectTab("interview")}>Open Interview</Button>
                    <Button variant="outline" onClick={() => selectTab("history")}>
                      Open History
                    </Button>
                  </div>
                </div>

                <div className="grid gap-4">
                  <div className="rounded-[24px] border border-slate-200 bg-slate-50/80 p-5 dark:border-white/10 dark:bg-slate-900/40">
                    <div className="flex items-center justify-between gap-3">
                      <div>
                        <p className="text-xs font-semibold uppercase tracking-[0.16em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                          Plan
                        </p>
                        <p className="mt-2 text-2xl font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                          {currentPlan ? billingPlanLabels[currentPlan] : "Free"}
                        </p>
                        <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                          {hasActiveSubscription && currentInterval
                            ? `${billingIntervalLabels[currentInterval]} billing is active.`
                            : "No paid subscription is active."}
                        </p>
                      </div>
                      <span className="rounded-full bg-slate-900 px-3 py-1 text-xs font-semibold uppercase tracking-[0.1em] text-white dark:bg-white dark:text-slate-900">
                        {formatBillingStatus(billingStatus?.subscriptionStatus)}
                      </span>
                    </div>

                    <Button asChild variant="outline" className="mt-5 w-full">
                      <Link href="/dashboard/pricing">View Pricing</Link>
                    </Button>
                  </div>

                  <div className="rounded-[24px] border border-slate-200 bg-slate-50/80 p-5 dark:border-white/10 dark:bg-slate-900/40">
                    <p className="text-xs font-semibold uppercase tracking-[0.16em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                      Free-tier usage
                    </p>
                    <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                      {historyLoaded
                        ? `${remainingFreeSessions} of 2 free interview starts remain this month before the paywall kicks in.`
                        : "Open History to review stored sessions and monthly usage."}
                    </p>
                  </div>
                </div>
              </div>

              {activeSession && !result && (
                <div className="flex flex-col gap-4 rounded-[24px] border border-slate-200 bg-white p-5 shadow-sm dark:border-white/10 dark:bg-slate-900/40 lg:flex-row lg:items-center lg:justify-between">
                  <div>
                    <p className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                      Interview in progress
                    </p>
                    <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                      {roleLabels[activeSession.role]} session ready with {activeSession.questions.length} questions.
                    </p>
                  </div>
                  <Button onClick={() => selectTab("interview")}>Resume Interview</Button>
                </div>
              )}
            </div>
          )}

          {activeTab === "interview" && (
            <div className="space-y-4">
              {upgradeMessage && (
                <div className="space-y-3">
                  <Alert>{upgradeMessage}</Alert>
                  <Button asChild variant="outline">
                    <Link href="/dashboard/pricing">View Pricing</Link>
                  </Button>
                </div>
              )}

              <div className="grid gap-3 rounded-2xl border border-slate-200 bg-slate-50/70 p-4 dark:border-white/10 dark:bg-slate-900/40">
                <div className="space-y-2">
                  <label htmlFor="role" className="text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">
                    Interview role
                  </label>
                  <select
                    id="role"
                    value={selectedRole}
                    onChange={(e) => setSelectedRole(e.target.value as InterviewRole)}
                    className="h-11 w-full rounded-[10px] border border-slate-300 bg-white px-3 text-sm text-[var(--foreground)] focus:border-[var(--brand-primary)] focus:outline-none focus:ring-2 focus:ring-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151] dark:text-white"
                  >
                    {Object.entries(roleLabels).map(([value, label]) => (
                      <option key={value} value={value}>
                        {label}
                      </option>
                    ))}
                  </select>
                </div>

                <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                  <p className="text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Free users can start up to 2 interview sessions each month.
                  </p>
                  <Button onClick={handleStartInterview} disabled={startingInterview}>
                    {startingInterview ? "Starting interview..." : "Start Interview"}
                  </Button>
                </div>
              </div>

              {activeSession && (
                <div className="space-y-4">
                  {result && (
                    <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 dark:border-white/10 dark:bg-slate-900/40">
                      <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                        Interview score
                      </p>
                      <div className="mt-2 flex items-end gap-3">
                        <span className="text-4xl font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                          {result.overallScore}
                        </span>
                        <span className="pb-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">out of 10</span>
                      </div>
                    </div>
                  )}

                  <div className="grid gap-3">
                    {activeSession.questions.map((question, index) => (
                      <article
                        key={question.questionId}
                        className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm dark:border-white/10 dark:bg-slate-900/60"
                      >
                        <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                          Question {index + 1}
                        </p>
                        <p className="mt-2 text-base text-[var(--heading)] dark:text-[#f8fafc]">{question.text}</p>
                        <div className="mt-4 space-y-3">
                          <label
                            htmlFor={`answer-${question.questionId}`}
                            className="text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]"
                          >
                            Your answer
                          </label>
                          <textarea
                            id={`answer-${question.questionId}`}
                            value={draftAnswers[question.questionId] || ""}
                            onChange={(event) => handleAnswerChange(question.questionId, event.target.value)}
                            disabled={Boolean(result)}
                            rows={5}
                            placeholder="Write your answer here..."
                            className="w-full rounded-[14px] border border-slate-300 bg-white px-3 py-3 text-sm text-[var(--foreground)] outline-none transition focus:border-[var(--brand-primary)] focus:ring-2 focus:ring-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151] dark:text-white"
                          />
                        </div>

                        {evaluationsByQuestionId.has(question.questionId) && (
                          <div className="mt-4 rounded-[18px] border border-slate-200 bg-slate-50/85 p-4 dark:border-white/10 dark:bg-slate-950/50">
                            <div className="flex items-center justify-between gap-3">
                              <p className="text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Evaluation</p>
                              <span className="rounded-full bg-[var(--brand-primary)]/10 px-3 py-1 text-xs font-semibold text-[var(--brand-primary)]">
                                Score {evaluationsByQuestionId.get(question.questionId)?.score}/10
                              </span>
                            </div>
                            <p className="mt-3 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                              {evaluationsByQuestionId.get(question.questionId)?.feedback}
                            </p>

                            <div className="mt-4 grid gap-3 md:grid-cols-2">
                              <div>
                                <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                  Strengths
                                </p>
                                <ul className="mt-2 space-y-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                  {renderFeedbackList(
                                    evaluationsByQuestionId.get(question.questionId)?.strengths || [],
                                    "No clear strengths identified.",
                                  )}
                                </ul>
                              </div>
                              <div>
                                <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                  Weaknesses
                                </p>
                                <ul className="mt-2 space-y-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                  {renderFeedbackList(
                                    evaluationsByQuestionId.get(question.questionId)?.weaknesses || [],
                                    "No significant weaknesses identified.",
                                  )}
                                </ul>
                              </div>
                            </div>

                            <div className="mt-4 rounded-[16px] border border-slate-200 bg-white/80 p-4 dark:border-white/10 dark:bg-slate-900/70">
                              <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                Model answer
                              </p>
                              <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                {evaluationsByQuestionId.get(question.questionId)?.modelAnswer}
                              </p>
                            </div>
                          </div>
                        )}
                      </article>
                    ))}
                  </div>

                  <Button onClick={handleSubmitAnswers} disabled={submittingAnswers || Boolean(result)}>
                    {result ? "Interview submitted" : submittingAnswers ? "Evaluating answers..." : "Submit Answers"}
                  </Button>
                </div>
              )}
            </div>
          )}

          {activeTab === "history" && (
            <div className="space-y-4">
              <div className="grid gap-3 md:grid-cols-2">
                <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 dark:border-white/10 dark:bg-slate-900/40">
                  <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Sessions this month
                  </p>
                  <p className="mt-2 text-3xl font-semibold text-[var(--heading)] dark:text-[#f8fafc]">{sessionsThisMonth}</p>
                </div>

                <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 dark:border-white/10 dark:bg-slate-900/40">
                  <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Monthly starter limit
                  </p>
                  <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                    {sessionsThisMonth >= 2
                      ? "Free users have reached the 2-session limit for this month."
                      : `${remainingFreeSessions} of 2 free sessions remain before the monthly block kicks in.`}
                  </p>
                </div>
              </div>

              {sessionDetailError && <Alert variant="destructive">{sessionDetailError}</Alert>}

              {sessionDetailLoadingId !== null && selectedSessionDetail === null && (
                <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 text-sm text-[var(--muted-foreground)] dark:border-white/10 dark:bg-slate-900/40 dark:text-[#9ca3af]">
                  Loading session feedback...
                </div>
              )}

              {selectedSessionDetail && (
                <div className="rounded-2xl border border-slate-200 bg-slate-50/85 p-4 dark:border-white/10 dark:bg-slate-900/40">
                  <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                    <div>
                      <p className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                        {selectedSessionDetail.role}
                      </p>
                      <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                        {formatSessionDate(selectedSessionDetail.createdAt)} | {selectedSessionDetail.status.replaceAll("_", " ")}
                      </p>
                    </div>
                    <Button variant="ghost" size="sm" onClick={handleCloseFeedback}>
                      Close
                    </Button>
                  </div>

                  {!selectedSessionHasFeedback ? (
                    <div className="mt-4 rounded-[16px] border border-dashed border-slate-300 bg-white/80 p-4 text-sm text-[var(--muted-foreground)] dark:border-white/15 dark:bg-slate-950/40 dark:text-[#9ca3af]">
                      Feedback is not available for this session yet.
                    </div>
                  ) : (
                    <div className="mt-4 grid gap-3">
                      {selectedSessionDetail.evaluations.map((evaluation, index) => (
                        <article
                          key={evaluation.questionId}
                          className="rounded-[18px] border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-slate-950/40"
                        >
                          <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                            <div>
                              <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                Question {index + 1}
                              </p>
                              <p className="mt-2 text-base text-[var(--heading)] dark:text-[#f8fafc]">{evaluation.question}</p>
                            </div>
                            {evaluation.score !== null && (
                              <span className="inline-flex rounded-full bg-[var(--brand-primary)]/10 px-3 py-1 text-xs font-semibold text-[var(--brand-primary)]">
                                Score {evaluation.score}/10
                              </span>
                            )}
                          </div>

                          <div className="mt-4 space-y-4">
                            <div>
                              <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                Your answer
                              </p>
                              <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                {evaluation.answer || "No answer was stored for this question."}
                              </p>
                            </div>

                            {evaluation.feedback && (
                              <div>
                                <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                  Feedback
                                </p>
                                <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                  {evaluation.feedback}
                                </p>
                              </div>
                            )}

                            {(evaluation.strengths.length > 0 || evaluation.weaknesses.length > 0) && (
                              <div className="grid gap-3 md:grid-cols-2">
                                <div>
                                  <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                    Strengths
                                  </p>
                                  <ul className="mt-2 space-y-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                    {renderFeedbackList(evaluation.strengths, "No clear strengths identified.")}
                                  </ul>
                                </div>
                                <div>
                                  <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                    Weaknesses
                                  </p>
                                  <ul className="mt-2 space-y-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                    {renderFeedbackList(evaluation.weaknesses, "No significant weaknesses identified.")}
                                  </ul>
                                </div>
                              </div>
                            )}

                            {evaluation.modelAnswer && (
                              <div className="rounded-[16px] border border-slate-200 bg-slate-50/80 p-4 dark:border-white/10 dark:bg-slate-900/60">
                                <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                                  Model answer
                                </p>
                                <p className="mt-2 text-sm text-[var(--foreground)] dark:text-[#dbe4ef]">
                                  {evaluation.modelAnswer}
                                </p>
                              </div>
                            )}
                          </div>
                        </article>
                      ))}
                    </div>
                  )}
                </div>
              )}

              {historyError ? (
                <div className="space-y-3">
                  <Alert variant="destructive">{historyError}</Alert>
                  <Button variant="outline" onClick={() => void fetchHistory()} disabled={historyLoading}>
                    {historyLoading ? "Retrying..." : "Retry"}
                  </Button>
                </div>
              ) : historyLoading || !historyLoaded ? (
                <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 text-sm text-[var(--muted-foreground)] dark:border-white/10 dark:bg-slate-900/40 dark:text-[#9ca3af]">
                  Loading session history...
                </div>
              ) : sessions.length === 0 ? (
                <div className="rounded-2xl border border-dashed border-slate-300 bg-slate-50/60 p-6 text-center dark:border-white/15 dark:bg-slate-900/30">
                  <p className="text-base font-medium text-[var(--heading)] dark:text-[#f8fafc]">No interview sessions yet.</p>
                  <p className="mt-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Complete your first session to start building history.
                  </p>
                </div>
              ) : (
                <div className="grid gap-3">
                  {sessions.map((session) => (
                    <article
                      key={session.id}
                      className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm dark:border-white/10 dark:bg-slate-900/60"
                    >
                      <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                        <div>
                          <p className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">{session.role}</p>
                          <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                            {formatSessionDate(session.createdAt)}
                          </p>
                        </div>
                        <div className="flex flex-col items-start gap-2 sm:items-end">
                          <span className="inline-flex rounded-full bg-slate-100 px-3 py-1 text-xs font-semibold uppercase tracking-[0.08em] text-slate-700 dark:bg-slate-800 dark:text-slate-200">
                            {session.status.replaceAll("_", " ")}
                          </span>
                          <Button
                            variant={selectedSessionId === session.id ? "default" : "outline"}
                            size="sm"
                            onClick={() => void handleViewFeedback(session.id)}
                            disabled={sessionDetailLoadingId === session.id}
                          >
                            {sessionDetailLoadingId === session.id
                              ? "Loading..."
                              : selectedSessionId === session.id && selectedSessionDetail?.id === session.id
                                ? "Viewing"
                                : "View Feedback"}
                          </Button>
                        </div>
                      </div>
                    </article>
                  ))}
                </div>
              )}
            </div>
          )}

          {activeTab === "settings" && (
            <div className="grid gap-4 md:grid-cols-2">
              <div className="rounded-[24px] border border-slate-200 bg-slate-50/80 p-5 dark:border-white/10 dark:bg-slate-900/40">
                <p className="text-xs font-semibold uppercase tracking-[0.16em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                  Account
                </p>
                <p className="mt-3 text-lg font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                  Profile controls live here
                </p>
                <p className="mt-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                  Keep authentication, profile, and account preferences here without mixing billing into settings.
                </p>
              </div>

              <div className="rounded-[24px] border border-slate-200 bg-slate-50/80 p-5 dark:border-white/10 dark:bg-slate-900/40">
                <p className="text-xs font-semibold uppercase tracking-[0.16em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                  Product preferences
                </p>
                <p className="mt-3 text-lg font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                  Defaults can move here next
                </p>
                <p className="mt-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                  Theme, interview defaults, and notification settings can land here later.
                </p>
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    </DashboardShell>
  );
}
