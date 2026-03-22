"use client";

import Link from "next/link";
import { useCallback, useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { DashboardShell, type DashboardTabKey } from "@/components/dashboard-shell";
import { ThemeToggle } from "@/components/theme-toggle";
import { clearStoredToken, getStoredToken, isExplicitAuthFailure } from "@/lib/auth";
import { cn } from "@/lib/utils";
import {
  Play,
  Clock,
  ArrowRight,
  ArrowUpRight,
  ArrowDownRight,
  CheckCircle2,
  XCircle,
  Target,
  Lightbulb,
  BookOpen,
  Send,
  Server,
  BarChart3,
  Briefcase,
  Palette,
  LogOut,
  User,
  X,
  Loader2,
  Flame,
  AlertTriangle,
  TrendingUp,
  Zap,
  Timer,
  Shuffle,
  ChevronDown,
} from "lucide-react";

// ─── API ────────────────────────────────────────────────────────────────────────

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

// ─── Types ──────────────────────────────────────────────────────────────────────

type InterviewRole = "BACKEND_ENGINEER" | "DATA_SCIENTIST" | "PRODUCT_MANAGER";
type DashboardTab = DashboardTabKey;
type BillingPlan = "basic" | "pro";
type BillingInterval = "monthly" | "yearly";

type UserProfile = {
  email: string;
  role: InterviewRole | null;
  subscriptionStatus: string;
  subscriptionPlan: string | null;
  subscriptionInterval: string | null;
};
type TopicInfo = { topic: string; questionCount: number };

type InterviewQuestion = { questionId: number; text: string; difficulty: string | null };
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
  topic: string | null;
  difficulty: string | null;
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

type RolePerformance = { role: string; avgScore: number; count: number };
type TopicPerformance = { topic: string; avgScore: number; count: number };
type SessionScore = { sessionId: number; role: string; avgScore: number; date: string };
type DashboardMetrics = {
  readiness: number | null;
  trend: number | null;
  streak: number;
  rolePerformance: RolePerformance[];
  weakestRole: RolePerformance | null;
  strongestRole: RolePerformance | null;
  topicPerformance: TopicPerformance[];
  weakestTopics: TopicPerformance[];
  scoreHistory: SessionScore[];
  lastSession: {
    role: string;
    avgScore: number;
    topWeakness: string | null;
    topFeedback: string | null;
  } | null;
  totalEvaluated: number;
};

// ─── Constants ──────────────────────────────────────────────────────────────────

const roleConfig: Record<InterviewRole, { label: string; short: string; icon: React.ElementType }> = {
  BACKEND_ENGINEER: { label: "Backend Engineer", short: "Backend", icon: Server },
  DATA_SCIENTIST: { label: "Data Scientist", short: "Data Sci", icon: BarChart3 },
  PRODUCT_MANAGER: { label: "Product Manager", short: "PM", icon: Briefcase },
};

const billingPlanLabels: Record<BillingPlan, string> = { basic: "Basic", pro: "Pro" };
const billingIntervalLabels: Record<BillingInterval, string> = { monthly: "Monthly", yearly: "Yearly" };

function formatTopicLabel(topic: string): string {
  return topic
    .split("_")
    .map((w) => w.charAt(0) + w.slice(1).toLowerCase())
    .join(" ");
}

// ─── Helpers ────────────────────────────────────────────────────────────────────

function formatSessionDate(createdAt: string) {
  return new Intl.DateTimeFormat(undefined, { dateStyle: "long", timeStyle: "short" }).format(new Date(createdAt));
}

function formatDateShort(createdAt: string) {
  return new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric" }).format(new Date(createdAt));
}

function isInCurrentMonth(createdAt: string) {
  const d = new Date(createdAt);
  const now = new Date();
  return d.getFullYear() === now.getFullYear() && d.getMonth() === now.getMonth();
}

function normalizeBillingPlan(plan: string | null | undefined): BillingPlan | null {
  if (!plan) return null;
  const n = plan.trim().toLowerCase();
  return n === "basic" || n === "pro" ? n : null;
}

function normalizeBillingInterval(interval: string | null | undefined): BillingInterval | null {
  if (!interval) return null;
  const n = interval.trim().toLowerCase();
  if (n === "monthly" || n === "month") return "monthly";
  if (n === "yearly" || n === "year") return "yearly";
  return null;
}

function tabFromHash(hash: string): DashboardTab {
  const h = hash.replace("#", "").trim().toLowerCase();
  if (h === "interview" || h === "history" || h === "settings") return h;
  return "workspace";
}

function scoreColor(score: number) {
  if (score >= 7) return "text-emerald-600 dark:text-emerald-400";
  if (score >= 4) return "text-amber-600 dark:text-amber-400";
  return "text-red-500 dark:text-red-400";
}

function scoreBg(score: number) {
  if (score >= 7) return "bg-emerald-50 border-emerald-200 dark:bg-emerald-950/40 dark:border-emerald-800/50";
  if (score >= 4) return "bg-amber-50 border-amber-200 dark:bg-amber-950/40 dark:border-amber-800/50";
  return "bg-red-50 border-red-200 dark:bg-red-950/40 dark:border-red-800/50";
}

function readinessMessage(score: number): string {
  if (score >= 8) return "You're sharp. Maintain your edge.";
  if (score >= 7) return "Solid. Push for consistency.";
  if (score >= 5) return "Getting there. Keep drilling.";
  if (score >= 3) return "Not ready. You need more reps.";
  return "You're not passing interviews at this level. Fix it now.";
}

function statusBadge(status: string) {
  const n = status.toUpperCase().replaceAll("_", " ");
  if (n === "COMPLETED" || n === "EVALUATED") {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-emerald-50 px-2 py-0.5 text-[11px] font-semibold text-emerald-700 dark:bg-emerald-950/50 dark:text-emerald-300">
        <CheckCircle2 className="h-3 w-3" />
        Done
      </span>
    );
  }
  if (n === "IN PROGRESS") {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-blue-50 px-2 py-0.5 text-[11px] font-semibold text-blue-700 dark:bg-blue-950/50 dark:text-blue-300">
        <Loader2 className="h-3 w-3" />
        Active
      </span>
    );
  }
  return (
    <span className="inline-flex rounded-full bg-slate-100 px-2 py-0.5 text-[11px] font-semibold text-slate-600 dark:bg-slate-800 dark:text-slate-300">
      {n}
    </span>
  );
}

function difficultyBadge(difficulty: string | null | undefined) {
  if (!difficulty) return null;
  const d = difficulty.toUpperCase();
  if (d === "EASY") {
    return (
      <span className="rounded-full bg-emerald-50 px-2 py-0.5 text-[10px] font-semibold uppercase text-emerald-700 dark:bg-emerald-950/50 dark:text-emerald-400">
        Easy
      </span>
    );
  }
  if (d === "HARD") {
    return (
      <span className="rounded-full bg-red-50 px-2 py-0.5 text-[10px] font-semibold uppercase text-red-700 dark:bg-red-950/50 dark:text-red-400">
        Hard
      </span>
    );
  }
  return (
    <span className="rounded-full bg-amber-50 px-2 py-0.5 text-[10px] font-semibold uppercase text-amber-700 dark:bg-amber-950/50 dark:text-amber-400">
      Medium
    </span>
  );
}

function formatElapsed(seconds: number) {
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return `${m}:${s.toString().padStart(2, "0")}`;
}

// ─── Metrics computation ────────────────────────────────────────────────────────

function calculateStreak(sessions: SessionHistoryItem[]): number {
  if (sessions.length === 0) return 0;

  const DAY_MS = 86400000;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const todayMs = today.getTime();

  const uniqueDays = [
    ...new Set(
      sessions.map((s) => {
        const d = new Date(s.createdAt);
        d.setHours(0, 0, 0, 0);
        return d.getTime();
      }),
    ),
  ].sort((a, b) => b - a);

  let streak = 0;
  let expected = todayMs;

  if (uniqueDays[0] !== todayMs) {
    if (uniqueDays[0] === todayMs - DAY_MS) {
      expected = todayMs - DAY_MS;
    } else {
      return 0;
    }
  }

  for (const day of uniqueDays) {
    if (day === expected) {
      streak++;
      expected -= DAY_MS;
    } else if (day < expected) {
      break;
    }
  }

  return streak;
}

function computeMetrics(
  sessions: SessionHistoryItem[],
  detailsMap: Map<number, SessionDetailResponse>,
): DashboardMetrics {
  const evaluated: Array<{ sessionId: number; date: string; role: string; scores: number[]; weaknesses: string[]; feedback: string | null }> = [];

  const sortedSessions = [...sessions].sort(
    (a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime(),
  );

  for (const session of sortedSessions) {
    const detail = detailsMap.get(session.id);
    if (!detail) continue;

    const scores = detail.evaluations
      .map((e) => e.score)
      .filter((s): s is number => s !== null);
    if (scores.length === 0) continue;

    const allWeaknesses = detail.evaluations.flatMap((e) => e.weaknesses);
    const firstFeedback = detail.evaluations.find((e) => e.feedback)?.feedback ?? null;

    evaluated.push({
      sessionId: session.id,
      date: session.createdAt,
      role: detail.role,
      scores,
      weaknesses: allWeaknesses,
      feedback: firstFeedback,
    });
  }

  if (evaluated.length === 0) {
    return {
      readiness: null,
      trend: null,
      streak: calculateStreak(sessions),
      rolePerformance: [],
      weakestRole: null,
      strongestRole: null,
      topicPerformance: [],
      weakestTopics: [],
      scoreHistory: [],
      lastSession: null,
      totalEvaluated: 0,
    };
  }

  const allScores = evaluated.flatMap((e) => e.scores);
  const readiness = Math.round((allScores.reduce((a, b) => a + b, 0) / allScores.length) * 10) / 10;

  let trend: number | null = null;
  if (evaluated.length >= 4) {
    const mid = Math.floor(evaluated.length / 2);
    const recentScores = evaluated.slice(0, mid).flatMap((e) => e.scores);
    const olderScores = evaluated.slice(mid).flatMap((e) => e.scores);
    const recentAvg = recentScores.reduce((a, b) => a + b, 0) / recentScores.length;
    const olderAvg = olderScores.reduce((a, b) => a + b, 0) / olderScores.length;
    trend = Math.round((recentAvg - olderAvg) * 10) / 10;
  }

  const byRole = new Map<string, number[]>();
  for (const e of evaluated) {
    const existing = byRole.get(e.role) ?? [];
    existing.push(...e.scores);
    byRole.set(e.role, existing);
  }
  const rolePerformance: RolePerformance[] = [...byRole.entries()].map(([role, scores]) => ({
    role,
    avgScore: Math.round((scores.reduce((a, b) => a + b, 0) / scores.length) * 10) / 10,
    count: scores.length,
  }));
  rolePerformance.sort((a, b) => a.avgScore - b.avgScore);

  const weakestRole = rolePerformance.length > 0 ? rolePerformance[0] : null;
  const strongestRole = rolePerformance.length > 0 ? rolePerformance[rolePerformance.length - 1] : null;

  // Topic performance — aggregate scores per topic from evaluation details
  const byTopic = new Map<string, number[]>();
  for (const session of sortedSessions) {
    const detail = detailsMap.get(session.id);
    if (!detail) continue;
    for (const ev of detail.evaluations) {
      if (ev.topic && ev.score !== null) {
        const existing = byTopic.get(ev.topic) ?? [];
        existing.push(ev.score);
        byTopic.set(ev.topic, existing);
      }
    }
  }
  const topicPerformance: TopicPerformance[] = [...byTopic.entries()].map(([topic, scores]) => ({
    topic,
    avgScore: Math.round((scores.reduce((a, b) => a + b, 0) / scores.length) * 10) / 10,
    count: scores.length,
  }));
  topicPerformance.sort((a, b) => a.avgScore - b.avgScore);
  const weakestTopics = topicPerformance.filter((t) => t.avgScore < 7).slice(0, 3);

  const scoreHistory: SessionScore[] = [...evaluated]
    .reverse()
    .map((e) => ({
      sessionId: e.sessionId,
      role: e.role,
      avgScore: Math.round((e.scores.reduce((a, b) => a + b, 0) / e.scores.length) * 10) / 10,
      date: e.date,
    }));

  const last = evaluated[0];
  const lastAvg = Math.round((last.scores.reduce((a, b) => a + b, 0) / last.scores.length) * 10) / 10;

  return {
    readiness,
    trend,
    streak: calculateStreak(sessions),
    rolePerformance,
    weakestRole,
    strongestRole,
    topicPerformance,
    weakestTopics,
    scoreHistory,
    lastSession: {
      role: last.role,
      avgScore: lastAvg,
      topWeakness: last.weaknesses[0] ?? null,
      topFeedback: last.feedback,
    },
    totalEvaluated: evaluated.length,
  };
}

// ─── Component ──────────────────────────────────────────────────────────────────

export default function DashboardPage() {
  const router = useRouter();

  // Core state
  const [loading, setLoading] = useState(true);
  const [billingReturn, setBillingReturn] = useState<string | null>(null);
  const [error, setError] = useState("");
  const [upgradeMessage, setUpgradeMessage] = useState("");
  const [activeTab, setActiveTab] = useState<DashboardTab>("workspace");
  const [billingStatus, setBillingStatus] = useState<BillingStatusResponse | null>(null);

  // User profile + topics
  const [userProfile, setUserProfile] = useState<UserProfile | null>(null);
  const [topics, setTopics] = useState<TopicInfo[]>([]);
  const [selectedTopic, setSelectedTopic] = useState<string | null>(null);

  // Interview state
  const [startingInterview, setStartingInterview] = useState(false);
  const [submittingAnswers, setSubmittingAnswers] = useState(false);
  const [activeSession, setActiveSession] = useState<InterviewSessionResponse | null>(null);
  const [draftAnswers, setDraftAnswers] = useState<Record<number, string>>({});
  const [result, setResult] = useState<SubmitAnswersResponse | null>(null);
  const [interviewStartTime, setInterviewStartTime] = useState<number | null>(null);
  const [elapsed, setElapsed] = useState(0);

  // History state
  const [sessions, setSessions] = useState<SessionHistoryItem[]>([]);
  const [historyLoading, setHistoryLoading] = useState(false);
  const [historyLoaded, setHistoryLoaded] = useState(false);
  const [historyError, setHistoryError] = useState("");
  const [selectedSessionId, setSelectedSessionId] = useState<number | null>(null);
  const [selectedSessionDetail, setSelectedSessionDetail] = useState<SessionDetailResponse | null>(null);
  const [sessionDetailLoadingId, setSessionDetailLoadingId] = useState<number | null>(null);
  const [sessionDetailError, setSessionDetailError] = useState("");

  // Settings: role change
  const [changingRole, setChangingRole] = useState(false);
  const [roleDropdownOpen, setRoleDropdownOpen] = useState(false);

  // Metrics state
  const [metricsLoading, setMetricsLoading] = useState(true);
  const [sessionDetailsCache] = useState(() => new Map<number, SessionDetailResponse>());
  const [metrics, setMetrics] = useState<DashboardMetrics>({
    readiness: null,
    trend: null,
    streak: 0,
    rolePerformance: [],
    weakestRole: null,
    strongestRole: null,
    topicPerformance: [],
    weakestTopics: [],
    scoreHistory: [],
    lastSession: null,
    totalEvaluated: 0,
  });

  const metricsComputedRef = useRef(false);

  // ─── Auth ───────────────────────────────────────────────────────────────────

  const clearAuthAndRedirect = useCallback(() => {
    clearStoredToken();
    router.push("/login");
  }, [router]);

  // ─── Tab navigation ─────────────────────────────────────────────────────────

  const selectTab = useCallback((tab: DashboardTab) => {
    setActiveTab(tab);
    if (typeof window === "undefined") return;
    const url = new URL(window.location.href);
    url.hash = tab === "workspace" ? "" : tab;
    window.history.replaceState(null, "", `${url.pathname}${url.search}${url.hash}`);
  }, []);

  // ─── Data fetching ──────────────────────────────────────────────────────────

  const fetchProfile = useCallback(async (token: string): Promise<UserProfile | null> => {
    try {
      const res = await fetch(`${API_BASE}/api/user/profile`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      if (isExplicitAuthFailure(res.status)) { clearAuthAndRedirect(); return null; }
      if (!res.ok) return null;
      return (await res.json()) as UserProfile;
    } catch { return null; }
  }, [clearAuthAndRedirect]);

  const fetchTopics = useCallback(async (token: string) => {
    try {
      const res = await fetch(`${API_BASE}/api/interviews/topics`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      if (!res.ok) return;
      const data = await res.json();
      if (Array.isArray(data)) setTopics(data as TopicInfo[]);
    } catch { /* non-blocking */ }
  }, []);

  const loadBillingStatus = useCallback(
    async (token: string) => {
      try {
        const res = await fetch(`${API_BASE}/api/billing/status`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        let data: BillingStatusResponse | ApiResponse = {};
        try { data = (await res.json()) as BillingStatusResponse | ApiResponse; } catch { data = {}; }
        if (isExplicitAuthFailure(res.status, Array.isArray(data) ? undefined : data)) {
          clearAuthAndRedirect(); return;
        }
        if (res.ok) setBillingStatus(data as BillingStatusResponse);
      } catch { /* workspace still renders */ }
    },
    [clearAuthAndRedirect],
  );

  const fetchSessions = useCallback(async (): Promise<SessionHistoryItem[]> => {
    const token = getStoredToken();
    if (!token) { clearAuthAndRedirect(); return []; }
    try {
      const res = await fetch(`${API_BASE}/api/interviews/sessions`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      let data: ApiResponse | SessionHistoryItem[] = { message: "Could not load sessions." };
      try { data = (await res.json()) as ApiResponse | SessionHistoryItem[]; } catch { data = { message: "Could not load sessions." }; }
      if (isExplicitAuthFailure(res.status, !Array.isArray(data) ? data : undefined)) {
        clearAuthAndRedirect(); return [];
      }
      if (!res.ok) return [];
      const items = Array.isArray(data) ? data : [];
      setSessions(items);
      setHistoryLoaded(true);
      return items;
    } catch { return []; }
  }, [clearAuthAndRedirect]);

  const fetchSessionDetail = useCallback(async (sessionId: number): Promise<SessionDetailResponse | null> => {
    const token = getStoredToken();
    if (!token) return null;
    try {
      const res = await fetch(`${API_BASE}/api/interviews/sessions/${sessionId}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      let data: ApiResponse | SessionDetailResponse = {};
      try { data = (await res.json()) as ApiResponse | SessionDetailResponse; } catch { data = {}; }
      if (!res.ok) return null;
      return data as SessionDetailResponse;
    } catch { return null; }
  }, []);

  const loadMetrics = useCallback(async (sessionList: SessionHistoryItem[]) => {
    const completed = sessionList
      .filter((s) => {
        const status = s.status.toUpperCase().replaceAll("_", " ");
        return status === "COMPLETED" || status === "EVALUATED";
      })
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
      .slice(0, 8);

    if (completed.length > 0) {
      const details = await Promise.all(completed.map((s) => fetchSessionDetail(s.id)));
      for (const d of details) {
        if (d) sessionDetailsCache.set(d.id, d);
      }
    }

    setMetrics(computeMetrics(sessionList, sessionDetailsCache));
    setMetricsLoading(false);
  }, [fetchSessionDetail, sessionDetailsCache]);

  // ─── Interview handlers ─────────────────────────────────────────────────────

  async function handleStartInterview(topicOverride?: string | null) {
    const topic = topicOverride !== undefined ? topicOverride : selectedTopic;
    const token = getStoredToken();
    if (!token) { clearAuthAndRedirect(); return; }
    setStartingInterview(true);
    setError("");
    setUpgradeMessage("");
    setActiveSession(null);
    setResult(null);
    setInterviewStartTime(null);
    setElapsed(0);
    try {
      const body: Record<string, string> = {};
      if (topic) body.topic = topic;
      const res = await fetch(`${API_BASE}/api/interviews/start`, {
        method: "POST",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
        body: JSON.stringify(body),
      });
      let data: ApiResponse | InterviewSessionResponse = { message: "Could not start interview." };
      try { data = (await res.json()) as ApiResponse | InterviewSessionResponse; } catch { data = { message: "Could not start interview." }; }
      if (isExplicitAuthFailure(res.status, !Array.isArray(data) ? data : undefined)) {
        clearAuthAndRedirect(); return;
      }
      const apiErrorCode = !Array.isArray(data) && "error" in data ? data.error : undefined;
      const apiErrorMessage = !Array.isArray(data) && "message" in data ? data.message : undefined;
      if (res.status === 403 && (apiErrorCode === "FREE_TIER_LIMIT_REACHED" || apiErrorCode === "BASIC_TIER_LIMIT_REACHED")) {
        setUpgradeMessage(apiErrorMessage || "You've reached your session limit this month. Upgrade to keep practicing.");
        return;
      }
      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not start interview.");
        return;
      }
      const session = data as InterviewSessionResponse;
      setActiveSession(session);
      setInterviewStartTime(Date.now());
      setDraftAnswers(
        Object.fromEntries(session.questions.map((q) => [q.questionId, ""])) as Record<number, string>,
      );
      const roleLabel = roleConfig[session.role]?.label ?? session.role;
      setSessions((cur) => [
        { id: session.sessionId, role: roleLabel, createdAt: new Date().toISOString(), status: "IN_PROGRESS" },
        ...cur.filter((s) => s.id !== session.sessionId),
      ]);
      selectTab("interview");
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setStartingInterview(false);
    }
  }

  async function handleSubmitAnswers() {
    if (!activeSession) return;
    const token = getStoredToken();
    if (!token) { clearAuthAndRedirect(); return; }
    const missing = activeSession.questions.find((q) => !(draftAnswers[q.questionId] || "").trim());
    if (missing) { setError("Answer every question before submitting."); return; }
    setSubmittingAnswers(true);
    setError("");
    try {
      const res = await fetch(`${API_BASE}/api/interviews/${activeSession.sessionId}/submit`, {
        method: "POST",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
        body: JSON.stringify({
          answers: activeSession.questions.map((q) => ({
            questionId: q.questionId,
            answerText: draftAnswers[q.questionId] || "",
          })),
        }),
      });
      let data: ApiResponse | SubmitAnswersResponse = { message: "Could not submit answers." };
      try { data = (await res.json()) as ApiResponse | SubmitAnswersResponse; } catch { data = { message: "Could not submit answers." }; }
      if (isExplicitAuthFailure(res.status, !Array.isArray(data) ? data : undefined)) {
        clearAuthAndRedirect(); return;
      }
      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not submit answers.");
        return;
      }
      setResult(data as SubmitAnswersResponse);
      setInterviewStartTime(null);
      setSessions((cur) =>
        cur.map((s) => (s.id === activeSession.sessionId ? { ...s, status: "COMPLETED" } : s)),
      );
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setSubmittingAnswers(false);
    }
  }

  async function handleViewFeedback(sessionId: number) {
    const token = getStoredToken();
    if (!token) { clearAuthAndRedirect(); return; }
    setSelectedSessionId(sessionId);
    setSessionDetailLoadingId(sessionId);
    setSessionDetailError("");
    setSelectedSessionDetail((cur) => (cur?.id === sessionId ? cur : null));
    try {
      const res = await fetch(`${API_BASE}/api/interviews/sessions/${sessionId}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      let data: ApiResponse | SessionDetailResponse = { message: "Could not load session feedback." };
      try { data = (await res.json()) as ApiResponse | SessionDetailResponse; } catch { data = { message: "Could not load session feedback." }; }
      if (isExplicitAuthFailure(res.status, !Array.isArray(data) ? data : undefined)) {
        clearAuthAndRedirect(); return;
      }
      if (!res.ok) {
        const msg = !Array.isArray(data) && "message" in data ? data.message : undefined;
        setSessionDetailError(msg || "Could not load session feedback.");
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

  function handleLogout() {
    clearStoredToken();
    router.push("/login");
    router.refresh();
  }

  async function handleChangeRole(newRole: InterviewRole) {
    const token = getStoredToken();
    if (!token) { clearAuthAndRedirect(); return; }
    setChangingRole(true);
    try {
      const res = await fetch(`${API_BASE}/api/user/role`, {
        method: "PUT",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}` },
        body: JSON.stringify({ role: newRole }),
      });
      if (res.ok) {
        const profile = (await res.json()) as UserProfile;
        setUserProfile(profile);
        setRoleDropdownOpen(false);
        // Refresh topics for new role
        void fetchTopics(token);
      }
    } catch { /* silent */ } finally {
      setChangingRole(false);
    }
  }

  // ─── Derived state ──────────────────────────────────────────────────────────

  const evaluationsByQuestionId = new Map(result?.evaluations.map((e) => [e.questionId, e]) ?? []);
  const sessionsThisMonth = sessions.filter((s) => isInCurrentMonth(s.createdAt)).length;
  const remainingFreeSessions = Math.max(0, 2 - sessionsThisMonth);
  const selectedSessionHasFeedback = Boolean(
    selectedSessionDetail?.evaluations.some((e) => Boolean(e.answer.trim()) || e.score !== null || Boolean(e.feedback)),
  );
  const currentPlan = normalizeBillingPlan(billingStatus?.subscriptionPlan);
  const currentInterval = normalizeBillingInterval(billingStatus?.subscriptionInterval);
  const hasActiveSubscription =
    billingStatus?.subscriptionStatus === "ACTIVE" && currentPlan !== null && currentInterval !== null;

  const userRoleLabel = userProfile?.role ? (roleConfig[userProfile.role]?.label ?? userProfile.role) : null;

  // ─── Effects ────────────────────────────────────────────────────────────────

  // Interview timer
  useEffect(() => {
    if (!interviewStartTime || result) return;
    const id = setInterval(() => setElapsed(Math.floor((Date.now() - interviewStartTime) / 1000)), 1000);
    return () => clearInterval(id);
  }, [interviewStartTime, result]);

  // Billing return redirect
  useEffect(() => {
    if (typeof window === "undefined") return;
    setBillingReturn(new URLSearchParams(window.location.search).get("billing"));
  }, []);

  useEffect(() => {
    if (billingReturn === "success" || billingReturn === "cancel") {
      router.replace(`/dashboard/pricing?billing=${billingReturn}`);
    }
  }, [billingReturn, router]);

  // Hash-based tab routing
  useEffect(() => {
    if (typeof window === "undefined") return;
    const sync = () => setActiveTab(tabFromHash(window.location.hash));
    sync();
    window.addEventListener("hashchange", sync);
    return () => window.removeEventListener("hashchange", sync);
  }, []);

  // Initial load: health check → profile → billing + sessions → metrics
  useEffect(() => {
    async function boot() {
      if (billingReturn === "success" || billingReturn === "cancel") return;
      const token = getStoredToken();
      if (!token) { clearAuthAndRedirect(); return; }
      try {
        const res = await fetch(`${API_BASE}/api/health`, {
          method: "GET",
          headers: { Authorization: `Bearer ${token}` },
        });
        let data: ApiResponse = {};
        try { data = (await res.json()) as ApiResponse; } catch { data = {}; }
        if (isExplicitAuthFailure(res.status, data)) { clearAuthAndRedirect(); return; }
        if (!res.ok) { setError("Something went wrong. Please try again."); return; }

        // Fetch profile first — redirect to onboarding if no role
        const profile = await fetchProfile(token);
        if (!profile) { setError("Could not load profile."); setLoading(false); return; }
        if (!profile.role) { router.replace("/onboarding"); return; }
        setUserProfile(profile);

        // Load billing + sessions + topics in parallel
        const [, sessionList] = await Promise.all([
          loadBillingStatus(token),
          fetchSessions(),
          fetchTopics(token),
        ]);
        setLoading(false);

        // Compute metrics from session details
        if (!metricsComputedRef.current) {
          metricsComputedRef.current = true;
          await loadMetrics(sessionList);
        }
      } catch {
        setError("Something went wrong. Please try again.");
      } finally {
        setLoading(false);
        setMetricsLoading(false);
      }
    }
    void boot();
  }, [billingReturn, clearAuthAndRedirect, loadBillingStatus, fetchSessions, loadMetrics, fetchProfile, fetchTopics, router]);

  // Lazy history fetch when tab opens (if not already loaded)
  useEffect(() => {
    if (loading || historyLoading || activeTab !== "history" || historyLoaded || Boolean(historyError)) return;
    setHistoryLoading(true);
    void fetchSessions().finally(() => setHistoryLoading(false));
  }, [activeTab, fetchSessions, historyError, historyLoaded, historyLoading, loading]);

  // ─── Loading screen ────────────────────────────────────────────────────────

  if (loading) {
    return (
      <section className="mx-auto max-w-5xl">
        <div className="flex items-center justify-center rounded-2xl border border-slate-200 bg-white p-16 dark:border-white/10 dark:bg-slate-900/80">
          <div className="flex flex-col items-center gap-3">
            <Loader2 className="h-8 w-8 animate-spin text-slate-400" />
            <p className="text-sm text-slate-500 dark:text-slate-400">Loading your dashboard...</p>
          </div>
        </div>
      </section>
    );
  }

  // ─── Render ─────────────────────────────────────────────────────────────────

  return (
    <DashboardShell activeItem={activeTab} onTabSelect={selectTab}>
      <div className="space-y-6">
        {error && <Alert variant="destructive">{error}</Alert>}

        {/* ═══════════════ WORKSPACE ═══════════════ */}
        {activeTab === "workspace" && (
          <div className="space-y-5">
            {/* ── Readiness score hero ── */}
            {metricsLoading ? (
              <div className="flex items-center gap-3 rounded-2xl border border-slate-200 bg-white p-8 dark:border-white/10 dark:bg-slate-900/60">
                <Loader2 className="h-5 w-5 animate-spin text-slate-400" />
                <span className="text-sm text-slate-500 dark:text-slate-400">Analyzing your performance...</span>
              </div>
            ) : metrics.readiness !== null ? (
              <div className="rounded-2xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
                <div className="flex flex-col gap-5 p-6 sm:flex-row sm:items-center sm:justify-between">
                  {/* Score */}
                  <div className="flex items-center gap-5">
                    <div className="relative flex h-20 w-20 flex-none items-center justify-center">
                      <svg viewBox="0 0 100 100" className="absolute inset-0 h-full w-full -rotate-90">
                        <circle cx="50" cy="50" r="42" fill="none" strokeWidth="7" className="stroke-slate-100 dark:stroke-slate-800" />
                        <circle
                          cx="50" cy="50" r="42" fill="none" strokeWidth="7" strokeLinecap="round"
                          strokeDasharray={`${(metrics.readiness / 10) * 263.9} 263.9`}
                          className={cn(
                            metrics.readiness >= 7 ? "stroke-emerald-500" : metrics.readiness >= 4 ? "stroke-amber-500" : "stroke-red-500",
                          )}
                        />
                      </svg>
                      <span className={cn("text-2xl font-bold tabular-nums", scoreColor(metrics.readiness))}>
                        {metrics.readiness}
                      </span>
                    </div>
                    <div>
                      <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">
                        Readiness score
                      </p>
                      <p className="mt-1 text-sm font-medium text-slate-900 dark:text-white">
                        {readinessMessage(metrics.readiness)}
                      </p>
                      {metrics.trend !== null && (
                        <div className="mt-1.5 flex items-center gap-1">
                          {metrics.trend >= 0 ? (
                            <ArrowUpRight className="h-3.5 w-3.5 text-emerald-500" />
                          ) : (
                            <ArrowDownRight className="h-3.5 w-3.5 text-red-500" />
                          )}
                          <span className={cn("text-xs font-semibold tabular-nums", metrics.trend >= 0 ? "text-emerald-600 dark:text-emerald-400" : "text-red-500 dark:text-red-400")}>
                            {metrics.trend >= 0 ? "+" : ""}{metrics.trend}
                          </span>
                          <span className="text-xs text-slate-400 dark:text-slate-500">vs previous sessions</span>
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Quick stats */}
                  <div className="flex gap-4">
                    {metrics.streak > 0 && (
                      <div className="flex items-center gap-2 rounded-xl bg-orange-50 px-3.5 py-2.5 dark:bg-orange-950/30">
                        <Flame className="h-4 w-4 text-orange-500" />
                        <div>
                          <p className="text-lg font-bold tabular-nums text-orange-600 dark:text-orange-400">{metrics.streak}</p>
                          <p className="text-[10px] font-semibold uppercase tracking-wider text-orange-500/70">day streak</p>
                        </div>
                      </div>
                    )}
                    <div className="flex items-center gap-2 rounded-xl bg-slate-50 px-3.5 py-2.5 dark:bg-slate-800/50">
                      <Target className="h-4 w-4 text-slate-500" />
                      <div>
                        <p className="text-lg font-bold tabular-nums text-slate-900 dark:text-white">{metrics.totalEvaluated}</p>
                        <p className="text-[10px] font-semibold uppercase tracking-wider text-slate-400">evaluated</p>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Urgency bar for free users */}
                {!hasActiveSubscription && historyLoaded && (
                  <div className="border-t border-slate-100 px-6 py-3 dark:border-white/5">
                    <div className="flex items-center justify-between">
                      <p className="text-xs text-slate-500 dark:text-slate-400">
                        {remainingFreeSessions > 0
                          ? `${remainingFreeSessions} free session${remainingFreeSessions !== 1 ? "s" : ""} left this month`
                          : "Free sessions used up this month"}
                      </p>
                      {remainingFreeSessions === 0 && (
                        <Button asChild variant="ghost" size="sm" className="h-7 gap-1 text-[11px] font-semibold text-amber-600 hover:text-amber-700 dark:text-amber-400">
                          <Link href="/dashboard/pricing">Upgrade <ArrowRight className="h-3 w-3" /></Link>
                        </Button>
                      )}
                    </div>
                  </div>
                )}
              </div>
            ) : (
              /* No readiness data yet */
              <div className="rounded-2xl border border-slate-200 bg-white p-8 dark:border-white/10 dark:bg-slate-900/60">
                <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">Get started</p>
                <p className="mt-2 text-xl font-semibold text-slate-900 dark:text-white">
                  No scores yet. Start practicing.
                </p>
                <p className="mt-1.5 text-sm text-slate-500 dark:text-slate-400">
                  Take an interview to see your readiness score and track your progress.
                </p>
                <Button
                  onClick={() => handleStartInterview(null)}
                  disabled={startingInterview}
                  className="mt-5 gap-2"
                >
                  {startingInterview ? <Loader2 className="h-4 w-4 animate-spin" /> : <Zap className="h-4 w-4" />}
                  Start Interview
                </Button>
              </div>
            )}

            {/* ── Score history chart ── */}
            {metrics.scoreHistory.length >= 2 && (
              <div className="rounded-xl border border-slate-200 bg-white p-5 dark:border-white/10 dark:bg-slate-900/60">
                <p className="mb-4 text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">
                  Recent sessions
                </p>
                <div className="flex items-end gap-1.5" style={{ height: 88 }}>
                  {metrics.scoreHistory.map((s, i) => {
                    const height = Math.max(8, (s.avgScore / 10) * 100);
                    const isLast = i === metrics.scoreHistory.length - 1;
                    return (
                      <div key={s.sessionId} className="group relative flex flex-1 flex-col items-center gap-1">
                        <div
                          className={cn(
                            "w-full min-w-[6px] max-w-[32px] rounded-sm transition-all",
                            s.avgScore >= 7
                              ? "bg-emerald-400 dark:bg-emerald-500"
                              : s.avgScore >= 4
                                ? "bg-amber-400 dark:bg-amber-500"
                                : "bg-red-400 dark:bg-red-500",
                            isLast && "ring-2 ring-slate-900/10 dark:ring-white/20",
                          )}
                          style={{ height: `${height}%` }}
                        />
                        <span className="text-[9px] tabular-nums text-slate-400">{s.avgScore}</span>
                        <div className="pointer-events-none absolute -top-10 left-1/2 z-10 hidden -translate-x-1/2 rounded-md bg-slate-900 px-2 py-1 text-[10px] text-white whitespace-nowrap group-hover:block dark:bg-white dark:text-slate-900">
                          {s.role} &middot; {formatDateShort(s.date)}
                        </div>
                      </div>
                    );
                  })}
                </div>
              </div>
            )}

            {/* ── Weakest topics ── */}
            {metrics.weakestTopics.length > 0 && (
              <div className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
                <div className="border-b border-slate-100 px-5 py-3.5 dark:border-white/5">
                  <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">
                    Topics to improve
                  </p>
                </div>
                <div className="divide-y divide-slate-100 dark:divide-white/5">
                  {metrics.weakestTopics.map((t) => (
                    <div key={t.topic} className="flex items-center justify-between px-5 py-3">
                      <div className="flex items-center gap-3">
                        <div className={cn("h-2 w-2 rounded-full", t.avgScore >= 4 ? "bg-amber-500" : "bg-red-500")} />
                        <span className="text-sm font-medium text-slate-900 dark:text-white">{formatTopicLabel(t.topic)}</span>
                        <span className="text-[11px] text-slate-400">{t.count} question{t.count !== 1 ? "s" : ""}</span>
                      </div>
                      <span className={cn("text-sm font-bold tabular-nums", scoreColor(t.avgScore))}>
                        {t.avgScore}/10
                      </span>
                    </div>
                  ))}
                </div>
                <div className="border-t border-slate-100 px-5 py-3 dark:border-white/5">
                  <button
                    type="button"
                    onClick={() => {
                      if (metrics.weakestTopics[0]) {
                        setSelectedTopic(metrics.weakestTopics[0].topic);
                        selectTab("interview");
                      }
                    }}
                    className="text-xs font-semibold text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-white"
                  >
                    Practice your weakest topic &rarr;
                  </button>
                </div>
              </div>
            )}

            {/* ── Last session feedback ── */}
            {metrics.lastSession && (
              <div className="rounded-xl border border-slate-200 bg-white p-5 dark:border-white/10 dark:bg-slate-900/60">
                <div className="flex items-center gap-2">
                  <AlertTriangle className={cn("h-4 w-4", scoreColor(metrics.lastSession.avgScore))} />
                  <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">
                    Last session
                  </p>
                  <span className={cn("ml-auto rounded-full border px-2 py-0.5 text-xs font-bold tabular-nums", scoreBg(metrics.lastSession.avgScore), scoreColor(metrics.lastSession.avgScore))}>
                    {metrics.lastSession.avgScore}/10
                  </span>
                </div>
                {metrics.lastSession.topWeakness && (
                  <p className="mt-2.5 text-sm text-slate-700 dark:text-slate-300">
                    <span className="font-medium text-red-600 dark:text-red-400">Weakness:</span>{" "}
                    {metrics.lastSession.topWeakness}
                  </p>
                )}
                {metrics.lastSession.topFeedback && !metrics.lastSession.topWeakness && (
                  <p className="mt-2.5 text-sm text-slate-600 dark:text-slate-400">{metrics.lastSession.topFeedback}</p>
                )}
              </div>
            )}

            {/* ── Active interview banner ── */}
            {activeSession && !result && (
              <div className="flex items-center gap-4 rounded-xl border border-blue-200 bg-blue-50 p-4 dark:border-blue-800/50 dark:bg-blue-950/30">
                <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/50">
                  <Timer className="h-5 w-5 text-blue-600 dark:text-blue-400" />
                </div>
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-blue-900 dark:text-blue-100">Interview in progress — {formatElapsed(elapsed)}</p>
                  <p className="text-sm text-blue-700 dark:text-blue-300">
                    {activeSession.questions.length} questions
                  </p>
                </div>
                <Button onClick={() => selectTab("interview")} size="sm" className="gap-1.5">
                  Resume <ArrowRight className="h-3.5 w-3.5" />
                </Button>
              </div>
            )}

            {/* ── Dominant CTA ── */}
            {!activeSession && metrics.readiness !== null && (
              <Button
                onClick={() => handleStartInterview(null)}
                disabled={startingInterview}
                className="h-12 w-full gap-2 rounded-xl text-sm font-semibold shadow-sm"
              >
                {startingInterview ? (
                  <Loader2 className="h-4 w-4 animate-spin" />
                ) : (
                  <Play className="h-4 w-4" />
                )}
                Start Practice Round
              </Button>
            )}
          </div>
        )}

        {/* ═══════════════ INTERVIEW ═══════════════ */}
        {activeTab === "interview" && (
          <div className="space-y-5">
            {upgradeMessage && (
              <div className="space-y-3">
                <Alert>{upgradeMessage}</Alert>
                <Button asChild variant="outline" size="sm">
                  <Link href="/dashboard/pricing">View Pricing</Link>
                </Button>
              </div>
            )}

            {/* Topic selector */}
            {!activeSession && (
              <>
                <div className="space-y-3">
                  <div className="flex items-center justify-between">
                    <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">
                      Choose a topic
                    </p>
                    {userRoleLabel && (
                      <span className="rounded-full bg-slate-100 px-2.5 py-0.5 text-[11px] font-medium text-slate-600 dark:bg-slate-800 dark:text-slate-400">
                        {userRoleLabel}
                      </span>
                    )}
                  </div>

                  <div className="grid gap-2.5 sm:grid-cols-2 lg:grid-cols-3">
                    {/* Random / All topics option */}
                    <button
                      type="button"
                      onClick={() => setSelectedTopic(null)}
                      className={cn(
                        "flex items-center gap-3 rounded-xl border p-4 text-left transition-all",
                        selectedTopic === null
                          ? "border-slate-900 bg-slate-900 text-white dark:border-white dark:bg-white dark:text-slate-900"
                          : "border-slate-200 bg-white hover:border-slate-300 dark:border-white/10 dark:bg-slate-900/60 dark:hover:border-white/20",
                      )}
                    >
                      <Shuffle className={cn("h-4 w-4 flex-none", selectedTopic === null ? "text-white dark:text-slate-900" : "text-slate-400")} />
                      <div>
                        <p className="text-sm font-semibold">Random Mix</p>
                        <p className={cn("text-[11px]", selectedTopic === null ? "text-white/60 dark:text-slate-500" : "text-slate-400")}>
                          Questions from all topics
                        </p>
                      </div>
                    </button>

                    {topics.map((t) => {
                      const isSelected = selectedTopic === t.topic;
                      return (
                        <button
                          key={t.topic}
                          type="button"
                          onClick={() => setSelectedTopic(t.topic)}
                          className={cn(
                            "flex items-center justify-between rounded-xl border p-4 text-left transition-all",
                            isSelected
                              ? "border-slate-900 bg-slate-900 text-white dark:border-white dark:bg-white dark:text-slate-900"
                              : "border-slate-200 bg-white hover:border-slate-300 dark:border-white/10 dark:bg-slate-900/60 dark:hover:border-white/20",
                          )}
                        >
                          <div>
                            <p className="text-sm font-semibold">{formatTopicLabel(t.topic)}</p>
                            <p className={cn("text-[11px]", isSelected ? "text-white/60 dark:text-slate-500" : "text-slate-400")}>
                              {t.questionCount} question{t.questionCount !== 1 ? "s" : ""}
                            </p>
                          </div>
                        </button>
                      );
                    })}
                  </div>
                </div>

                <Button
                  onClick={() => handleStartInterview()}
                  disabled={startingInterview}
                  className="h-11 w-full gap-2 rounded-xl font-semibold"
                >
                  {startingInterview ? (
                    <><Loader2 className="h-4 w-4 animate-spin" /> Starting...</>
                  ) : (
                    <><Play className="h-4 w-4" /> {selectedTopic ? `Practice ${formatTopicLabel(selectedTopic)}` : "Start Interview"}</>
                  )}
                </Button>
              </>
            )}

            {/* Active session */}
            {activeSession && (
              <div className="space-y-4">
                {/* Timer + progress bar */}
                <div className="flex items-center justify-between rounded-xl bg-slate-50 px-4 py-3 dark:bg-slate-800/50">
                  <div className="flex items-center gap-2">
                    <Timer className="h-4 w-4 text-slate-500" />
                    <span className="text-sm font-medium tabular-nums text-slate-700 dark:text-slate-300">{formatElapsed(elapsed)}</span>
                  </div>
                  <p className="text-xs text-slate-500 dark:text-slate-400">
                    {activeSession.questions.length} questions
                  </p>
                </div>

                {/* Score banner */}
                {result && (
                  <div className={cn("flex items-center gap-4 rounded-xl border p-5", scoreBg(result.overallScore))}>
                    <div className="relative flex h-16 w-16 flex-none items-center justify-center">
                      <svg viewBox="0 0 100 100" className="absolute inset-0 h-full w-full -rotate-90">
                        <circle cx="50" cy="50" r="42" fill="none" strokeWidth="8" className="stroke-slate-100 dark:stroke-slate-800" />
                        <circle
                          cx="50" cy="50" r="42" fill="none" strokeWidth="8" strokeLinecap="round"
                          strokeDasharray={`${(result.overallScore / 10) * 263.9} 263.9`}
                          className={cn(result.overallScore >= 7 ? "stroke-emerald-500" : result.overallScore >= 4 ? "stroke-amber-500" : "stroke-red-500")}
                        />
                      </svg>
                      <span className={cn("text-xl font-bold tabular-nums", scoreColor(result.overallScore))}>{result.overallScore}</span>
                    </div>
                    <div>
                      <p className="font-medium text-slate-900 dark:text-white">
                        {result.overallScore >= 7 ? "Strong performance." : result.overallScore >= 4 ? "Room for improvement." : "Significant gaps found."}
                      </p>
                      <p className="text-sm text-slate-500 dark:text-slate-400">
                        Completed in {formatElapsed(elapsed)}. Review your answers below.
                      </p>
                    </div>
                  </div>
                )}

                {/* Questions */}
                <div className="space-y-4">
                  {activeSession.questions.map((question, index) => {
                    const evaluation = evaluationsByQuestionId.get(question.questionId);
                    return (
                      <div key={question.questionId} className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
                        <div className="flex items-start justify-between gap-3 border-b border-slate-100 p-4 dark:border-white/5">
                          <div className="flex items-start gap-3">
                            <span className="flex h-7 w-7 flex-none items-center justify-center rounded-lg bg-slate-100 text-xs font-bold text-slate-600 dark:bg-slate-800 dark:text-slate-300">
                              {index + 1}
                            </span>
                            <div className="pt-0.5">
                              <p className="text-sm font-medium text-slate-900 dark:text-white">{question.text}</p>
                              <div className="mt-1.5">{difficultyBadge(question.difficulty)}</div>
                            </div>
                          </div>
                          {evaluation && (
                            <span className={cn("flex-none rounded-full border px-2.5 py-0.5 text-xs font-bold tabular-nums", scoreBg(evaluation.score), scoreColor(evaluation.score))}>
                              {evaluation.score}/10
                            </span>
                          )}
                        </div>

                        <div className="p-4">
                          <label
                            htmlFor={`answer-${question.questionId}`}
                            className="mb-2 block text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500"
                          >
                            Your answer
                          </label>
                          <textarea
                            id={`answer-${question.questionId}`}
                            value={draftAnswers[question.questionId] || ""}
                            onChange={(e) => setDraftAnswers((cur) => ({ ...cur, [question.questionId]: e.target.value }))}
                            disabled={Boolean(result)}
                            rows={4}
                            placeholder="Write your answer here..."
                            className="w-full rounded-lg border border-slate-200 bg-slate-50 px-3 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 outline-none transition focus:border-slate-400 focus:bg-white focus:ring-2 focus:ring-slate-200 disabled:opacity-60 dark:border-white/10 dark:bg-slate-800/50 dark:text-white dark:placeholder:text-slate-500 dark:focus:border-white/20 dark:focus:bg-slate-800 dark:focus:ring-slate-700"
                          />
                        </div>

                        {evaluation && (
                          <div className="border-t border-slate-100 bg-slate-50/50 p-4 dark:border-white/5 dark:bg-slate-950/30">
                            <p className="mb-3 text-sm text-slate-700 dark:text-slate-300">{evaluation.feedback}</p>
                            <div className="grid gap-3 sm:grid-cols-2">
                              {evaluation.strengths.length > 0 && (
                                <div className="rounded-lg border border-emerald-100 bg-emerald-50/50 p-3 dark:border-emerald-900/30 dark:bg-emerald-950/20">
                                  <p className="mb-2 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-emerald-700 dark:text-emerald-400">
                                    <CheckCircle2 className="h-3 w-3" /> Strengths
                                  </p>
                                  <ul className="space-y-1">
                                    {evaluation.strengths.map((s) => <li key={s} className="text-xs text-emerald-800 dark:text-emerald-300">{s}</li>)}
                                  </ul>
                                </div>
                              )}
                              {evaluation.weaknesses.length > 0 && (
                                <div className="rounded-lg border border-red-100 bg-red-50/50 p-3 dark:border-red-900/30 dark:bg-red-950/20">
                                  <p className="mb-2 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-red-700 dark:text-red-400">
                                    <XCircle className="h-3 w-3" /> Areas to improve
                                  </p>
                                  <ul className="space-y-1">
                                    {evaluation.weaknesses.map((w) => <li key={w} className="text-xs text-red-800 dark:text-red-300">{w}</li>)}
                                  </ul>
                                </div>
                              )}
                            </div>
                            {evaluation.modelAnswer && (
                              <div className="mt-3 rounded-lg border border-slate-200 bg-white p-3 dark:border-white/10 dark:bg-slate-900/60">
                                <p className="mb-1.5 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400">
                                  <Lightbulb className="h-3 w-3" /> Model answer
                                </p>
                                <p className="text-xs leading-relaxed text-slate-700 dark:text-slate-300">{evaluation.modelAnswer}</p>
                              </div>
                            )}
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>

                {!result && (
                  <Button onClick={handleSubmitAnswers} disabled={submittingAnswers} className="h-11 w-full gap-2 rounded-xl font-semibold">
                    {submittingAnswers ? (
                      <><Loader2 className="h-4 w-4 animate-spin" /> Evaluating answers...</>
                    ) : (
                      <><Send className="h-4 w-4" /> Submit Answers</>
                    )}
                  </Button>
                )}

                {/* Post-interview next step */}
                {result && (
                  <div className="rounded-xl border border-slate-200 bg-slate-50 p-5 dark:border-white/10 dark:bg-slate-800/30">
                    <p className="text-[11px] font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">What&apos;s next</p>
                    <p className="mt-2 text-sm text-slate-700 dark:text-slate-300">
                      {result.overallScore < 4
                        ? "That was rough. Review the model answers above, then retry."
                        : result.overallScore < 7
                          ? "Decent attempt. Focus on the red areas above, then try again."
                          : "Strong round. Try a different topic to broaden your coverage."}
                    </p>
                    <div className="mt-3 flex flex-wrap gap-2">
                      <Button
                        size="sm"
                        className="gap-1.5"
                        onClick={() => {
                          setActiveSession(null);
                          setResult(null);
                          setDraftAnswers({});
                          setInterviewStartTime(null);
                          setElapsed(0);
                        }}
                      >
                        <Play className="h-3.5 w-3.5" />
                        New Interview
                      </Button>
                      <Button size="sm" variant="outline" className="gap-1.5" onClick={() => selectTab("workspace")}>
                        <TrendingUp className="h-3.5 w-3.5" />
                        View Progress
                      </Button>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        )}

        {/* ═══════════════ HISTORY ═══════════════ */}
        {activeTab === "history" && (
          <div className="space-y-4">
            <div className="grid gap-3 sm:grid-cols-2">
              <div className="flex items-center gap-3 rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-slate-900/60">
                <Target className="h-5 w-5 text-slate-400" />
                <div>
                  <p className="text-xl font-bold tabular-nums text-slate-900 dark:text-white">{sessionsThisMonth}</p>
                  <p className="text-xs text-slate-500 dark:text-slate-400">Sessions this month</p>
                </div>
              </div>
              <div className="flex items-center gap-3 rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-slate-900/60">
                <Clock className="h-5 w-5 text-slate-400" />
                <div>
                  <p className="text-sm font-medium text-slate-900 dark:text-white">
                    {hasActiveSubscription ? "Unlimited" : `${remainingFreeSessions} remaining`}
                  </p>
                  <p className="text-xs text-slate-500 dark:text-slate-400">
                    {hasActiveSubscription ? "Paid plan active" : "Free tier (2/month)"}
                  </p>
                </div>
              </div>
            </div>

            {sessionDetailError && <Alert variant="destructive">{sessionDetailError}</Alert>}

            {sessionDetailLoadingId !== null && selectedSessionDetail === null && (
              <div className="flex items-center gap-3 rounded-xl border border-slate-200 bg-white p-6 dark:border-white/10 dark:bg-slate-900/60">
                <Loader2 className="h-5 w-5 animate-spin text-slate-400" />
                <p className="text-sm text-slate-500 dark:text-slate-400">Loading feedback...</p>
              </div>
            )}

            {selectedSessionDetail && (
              <div className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
                <div className="flex items-center justify-between border-b border-slate-100 p-4 dark:border-white/5">
                  <div>
                    <p className="font-semibold text-slate-900 dark:text-white">{selectedSessionDetail.role}</p>
                    <p className="mt-0.5 text-xs text-slate-500 dark:text-slate-400">
                      {formatSessionDate(selectedSessionDetail.createdAt)}
                    </p>
                  </div>
                  <button type="button" onClick={handleCloseFeedback} className="flex h-8 w-8 items-center justify-center rounded-lg text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800">
                    <X className="h-4 w-4" />
                  </button>
                </div>
                <div className="p-4">
                  {!selectedSessionHasFeedback ? (
                    <div className="flex flex-col items-center gap-2 rounded-lg border border-dashed border-slate-200 p-8 text-center dark:border-white/10">
                      <BookOpen className="h-8 w-8 text-slate-300 dark:text-slate-600" />
                      <p className="text-sm text-slate-500 dark:text-slate-400">Feedback not available for this session yet.</p>
                    </div>
                  ) : (
                    <div className="space-y-4">
                      {selectedSessionDetail.evaluations.map((ev, idx) => (
                        <div key={ev.questionId} className="rounded-lg border border-slate-100 bg-slate-50/50 dark:border-white/5 dark:bg-slate-950/30">
                          <div className="flex items-start justify-between gap-3 p-4">
                            <div className="flex items-start gap-3">
                              <span className="flex h-6 w-6 flex-none items-center justify-center rounded-md bg-slate-200 text-[11px] font-bold text-slate-600 dark:bg-slate-700 dark:text-slate-300">{idx + 1}</span>
                              <div>
                                <p className="text-sm font-medium text-slate-900 dark:text-white">{ev.question}</p>
                                <div className="mt-1">{difficultyBadge(ev.difficulty)}</div>
                              </div>
                            </div>
                            {ev.score !== null && (
                              <span className={cn("flex-none rounded-full border px-2.5 py-0.5 text-xs font-bold tabular-nums", scoreBg(ev.score), scoreColor(ev.score))}>
                                {ev.score}/10
                              </span>
                            )}
                          </div>
                          <div className="space-y-3 border-t border-slate-100 p-4 dark:border-white/5">
                            <div>
                              <p className="mb-1 text-[11px] font-semibold uppercase tracking-wider text-slate-400">Your answer</p>
                              <p className="text-xs leading-relaxed text-slate-700 dark:text-slate-300">{ev.answer || "No answer stored."}</p>
                            </div>
                            {ev.feedback && (
                              <div>
                                <p className="mb-1 text-[11px] font-semibold uppercase tracking-wider text-slate-400">Feedback</p>
                                <p className="text-xs leading-relaxed text-slate-700 dark:text-slate-300">{ev.feedback}</p>
                              </div>
                            )}
                            {(ev.strengths.length > 0 || ev.weaknesses.length > 0) && (
                              <div className="grid gap-3 sm:grid-cols-2">
                                {ev.strengths.length > 0 && (
                                  <div className="rounded-lg border border-emerald-100 bg-emerald-50/50 p-3 dark:border-emerald-900/30 dark:bg-emerald-950/20">
                                    <p className="mb-1.5 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-emerald-700 dark:text-emerald-400"><CheckCircle2 className="h-3 w-3" /> Strengths</p>
                                    <ul className="space-y-1">{ev.strengths.map((s) => <li key={s} className="text-xs text-emerald-800 dark:text-emerald-300">{s}</li>)}</ul>
                                  </div>
                                )}
                                {ev.weaknesses.length > 0 && (
                                  <div className="rounded-lg border border-red-100 bg-red-50/50 p-3 dark:border-red-900/30 dark:bg-red-950/20">
                                    <p className="mb-1.5 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-red-700 dark:text-red-400"><XCircle className="h-3 w-3" /> Weaknesses</p>
                                    <ul className="space-y-1">{ev.weaknesses.map((w) => <li key={w} className="text-xs text-red-800 dark:text-red-300">{w}</li>)}</ul>
                                  </div>
                                )}
                              </div>
                            )}
                            {ev.modelAnswer && (
                              <div className="rounded-lg border border-slate-200 bg-white p-3 dark:border-white/10 dark:bg-slate-900/60">
                                <p className="mb-1.5 flex items-center gap-1.5 text-[11px] font-semibold uppercase tracking-wider text-slate-500 dark:text-slate-400"><Lightbulb className="h-3 w-3" /> Model answer</p>
                                <p className="text-xs leading-relaxed text-slate-700 dark:text-slate-300">{ev.modelAnswer}</p>
                              </div>
                            )}
                          </div>
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              </div>
            )}

            {historyError ? (
              <div className="space-y-3">
                <Alert variant="destructive">{historyError}</Alert>
                <Button variant="outline" size="sm" onClick={() => { setHistoryError(""); setHistoryLoaded(false); }} disabled={historyLoading}>
                  {historyLoading ? "Retrying..." : "Retry"}
                </Button>
              </div>
            ) : historyLoading || !historyLoaded ? (
              <div className="flex items-center gap-3 rounded-xl border border-slate-200 bg-white p-6 dark:border-white/10 dark:bg-slate-900/60">
                <Loader2 className="h-5 w-5 animate-spin text-slate-400" />
                <p className="text-sm text-slate-500 dark:text-slate-400">Loading history...</p>
              </div>
            ) : sessions.length === 0 ? (
              <div className="flex flex-col items-center gap-3 rounded-xl border border-dashed border-slate-200 p-10 text-center dark:border-white/10">
                <BookOpen className="h-10 w-10 text-slate-300 dark:text-slate-600" />
                <p className="font-medium text-slate-900 dark:text-white">No sessions yet</p>
                <p className="text-sm text-slate-500 dark:text-slate-400">Take your first interview to start building history.</p>
                <Button size="sm" variant="outline" onClick={() => selectTab("interview")} className="mt-1 gap-1.5">
                  <Play className="h-3.5 w-3.5" /> Start Interview
                </Button>
              </div>
            ) : (
              <div className="space-y-2">
                {sessions.map((session) => {
                  const isViewing = selectedSessionId === session.id && selectedSessionDetail?.id === session.id;
                  return (
                    <div
                      key={session.id}
                      className={cn(
                        "flex items-center gap-4 rounded-xl border bg-white p-3.5 transition-all dark:bg-slate-900/60",
                        isViewing ? "border-slate-900 dark:border-white/30" : "border-slate-200 dark:border-white/10",
                      )}
                    >
                      <div className="flex h-9 w-9 flex-none items-center justify-center rounded-lg bg-slate-100 dark:bg-slate-800">
                        <span className="text-[10px] font-bold text-slate-500 dark:text-slate-400">{formatDateShort(session.createdAt)}</span>
                      </div>
                      <div className="min-w-0 flex-1">
                        <p className="text-sm font-semibold text-slate-900 dark:text-white">{session.role}</p>
                        <p className="text-[11px] text-slate-500 dark:text-slate-400">{formatSessionDate(session.createdAt)}</p>
                      </div>
                      <div className="flex items-center gap-2.5">
                        {statusBadge(session.status)}
                        <Button
                          variant={isViewing ? "default" : "outline"}
                          size="sm"
                          onClick={() => void handleViewFeedback(session.id)}
                          disabled={sessionDetailLoadingId === session.id}
                          className="gap-1.5 text-xs"
                        >
                          {sessionDetailLoadingId === session.id ? <Loader2 className="h-3 w-3 animate-spin" /> : <BookOpen className="h-3 w-3" />}
                          {isViewing ? "Viewing" : "Feedback"}
                        </Button>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}

        {/* ═══════════════ SETTINGS ═══════════════ */}
        {activeTab === "settings" && (
          <div className="space-y-4">
            {/* Role */}
            <div className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
              <div className="flex items-center gap-3 border-b border-slate-100 p-4 dark:border-white/5">
                <Briefcase className="h-4 w-4 text-slate-500" />
                <p className="text-sm font-semibold text-slate-900 dark:text-white">Interview Role</p>
              </div>
              <div className="flex items-center justify-between p-4">
                <div>
                  <p className="text-sm text-slate-600 dark:text-slate-400">Current role</p>
                  <p className="text-xs text-slate-400">{userRoleLabel ?? "Not set"}</p>
                </div>
                <div className="relative">
                  <Button
                    variant="outline"
                    size="sm"
                    className="gap-1.5 text-xs"
                    onClick={() => setRoleDropdownOpen(!roleDropdownOpen)}
                    disabled={changingRole}
                  >
                    {changingRole ? <Loader2 className="h-3 w-3 animate-spin" /> : <ChevronDown className="h-3 w-3" />}
                    Change
                  </Button>
                  {roleDropdownOpen && (
                    <div className="absolute right-0 top-full z-20 mt-1 w-48 rounded-lg border border-slate-200 bg-white py-1 shadow-lg dark:border-white/10 dark:bg-slate-900">
                      {(Object.entries(roleConfig) as Array<[InterviewRole, typeof roleConfig[InterviewRole]]>).map(([key, config]) => (
                        <button
                          key={key}
                          type="button"
                          onClick={() => void handleChangeRole(key)}
                          className={cn(
                            "flex w-full items-center gap-2 px-3 py-2 text-left text-sm transition-colors hover:bg-slate-50 dark:hover:bg-slate-800",
                            userProfile?.role === key ? "font-semibold text-slate-900 dark:text-white" : "text-slate-600 dark:text-slate-400",
                          )}
                        >
                          <config.icon className="h-4 w-4 flex-none text-slate-400" />
                          {config.label}
                          {userProfile?.role === key && <CheckCircle2 className="ml-auto h-3.5 w-3.5 text-emerald-500" />}
                        </button>
                      ))}
                    </div>
                  )}
                </div>
              </div>
            </div>

            {/* Appearance */}
            <div className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
              <div className="flex items-center gap-3 border-b border-slate-100 p-4 dark:border-white/5">
                <Palette className="h-4 w-4 text-slate-500" />
                <p className="text-sm font-semibold text-slate-900 dark:text-white">Appearance</p>
              </div>
              <div className="flex items-center justify-between p-4">
                <p className="text-sm text-slate-600 dark:text-slate-400">Theme</p>
                <ThemeToggle />
              </div>
            </div>

            {/* Account */}
            <div className="rounded-xl border border-slate-200 bg-white dark:border-white/10 dark:bg-slate-900/60">
              <div className="flex items-center gap-3 border-b border-slate-100 p-4 dark:border-white/5">
                <User className="h-4 w-4 text-slate-500" />
                <p className="text-sm font-semibold text-slate-900 dark:text-white">Account</p>
              </div>
              <div className="flex items-center justify-between p-4">
                <div>
                  <p className="text-sm text-slate-600 dark:text-slate-400">Subscription</p>
                  <p className="text-xs text-slate-400">
                    {hasActiveSubscription && currentPlan && currentInterval
                      ? `${billingPlanLabels[currentPlan]}, billed ${billingIntervalLabels[currentInterval].toLowerCase()}`
                      : "Free tier — 2 sessions/month"}
                  </p>
                </div>
                <Button asChild variant="outline" size="sm" className="gap-1.5 text-xs">
                  <Link href="/dashboard/pricing">{hasActiveSubscription ? "Manage" : "Upgrade"} <ArrowRight className="h-3 w-3" /></Link>
                </Button>
              </div>
            </div>

            {/* Sign out */}
            <div className="rounded-xl border border-red-100 bg-white dark:border-red-900/30 dark:bg-slate-900/60">
              <div className="flex items-center justify-between p-4">
                <div className="flex items-center gap-3">
                  <LogOut className="h-4 w-4 text-red-500 dark:text-red-400" />
                  <div>
                    <p className="text-sm font-semibold text-slate-900 dark:text-white">Sign out</p>
                    <p className="text-xs text-slate-500 dark:text-slate-400">Log out on this device</p>
                  </div>
                </div>
                <Button variant="outline" size="sm" onClick={handleLogout} className="gap-1.5 border-red-200 text-xs text-red-600 hover:bg-red-50 dark:border-red-800/50 dark:text-red-400 dark:hover:bg-red-950/30">
                  <LogOut className="h-3 w-3" /> Sign out
                </Button>
              </div>
            </div>
          </div>
        )}
      </div>
    </DashboardShell>
  );
}
