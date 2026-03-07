"use client";

import { useCallback, useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { fetchWithCsrf } from "@/lib/csrf";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type InterviewRole = "BACKEND_ENGINEER" | "DATA_SCIENTIST" | "PRODUCT_MANAGER";

type InterviewQuestion = {
  questionId: number;
  text: string;
};

type InterviewSessionResponse = {
  sessionId: number;
  role: InterviewRole;
  questions: InterviewQuestion[];
};

type ApiResponse = {
  message?: string;
};

const roleLabels: Record<InterviewRole, string> = {
  BACKEND_ENGINEER: "Backend Engineer",
  DATA_SCIENTIST: "Data Scientist",
  PRODUCT_MANAGER: "Product Manager",
};

export default function DashboardPage() {
  const router = useRouter();

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [selectedRole, setSelectedRole] = useState<InterviewRole>("BACKEND_ENGINEER");
  const [startingInterview, setStartingInterview] = useState(false);
  const [activeSession, setActiveSession] = useState<InterviewSessionResponse | null>(null);

  const redirectToLogin = useCallback(() => {
    router.push("/login");
  }, [router]);

  async function handleStartInterview() {
    setStartingInterview(true);
    setError("");
    setActiveSession(null);

    try {
      const res = await fetchWithCsrf(API_BASE, `${API_BASE}/api/interviews/start`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
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
        redirectToLogin();
        return;
      }

      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not start interview.");
        return;
      }

      setActiveSession(data as InterviewSessionResponse);
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setStartingInterview(false);
    }
  }

  useEffect(() => {
    async function loadDashboard() {
      try {
        const res = await fetch(`${API_BASE}/api/health`, {
          method: "GET",
          credentials: "include",
        });

        if (res.status === 401) {
          redirectToLogin();
          return;
        }

        if (!res.ok) {
          setError("Something went wrong. Please try again.");
          return;
        }
      } catch {
        setError("Something went wrong. Please try again.");
      } finally {
        setLoading(false);
      }
    }

    loadDashboard();
  }, [redirectToLogin]);

  if (loading) {
    return (
      <section className="mx-auto max-w-2xl">
        <Card className="border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
          <CardHeader>
            <CardTitle className="text-[var(--heading)] dark:text-[#f8fafc]">Dashboard</CardTitle>
            <CardDescription className="text-[var(--muted-foreground)] dark:text-[#9ca3af]">Loading your session...</CardDescription>
          </CardHeader>
        </Card>
      </section>
    );
  }

  return (
    <section className="mx-auto max-w-3xl">
      <Card className="border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <CardHeader>
          <div>
            <CardTitle className="text-[var(--heading)] dark:text-[#f8fafc]">Dashboard</CardTitle>
            <CardDescription className="text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              Pick a role and start an interview session.
            </CardDescription>
          </div>
        </CardHeader>

        <CardContent className="space-y-4">
          {error && <Alert variant="destructive">{error}</Alert>}

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

            <Button onClick={handleStartInterview} disabled={startingInterview}>
              {startingInterview ? "Starting interview..." : "Start Interview"}
            </Button>
          </div>

          {activeSession && (
            <div className="space-y-4">
              <div className="grid gap-3">
                {activeSession.questions.map((question, index) => (
                  <div
                    key={question.questionId}
                    className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm dark:border-white/10 dark:bg-slate-900/60"
                  >
                    <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                      Question {index + 1}
                    </p>
                    <p className="mt-2 text-base text-[var(--heading)] dark:text-[#f8fafc]">{question.text}</p>
                  </div>
                ))}
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    </section>
  );
}
