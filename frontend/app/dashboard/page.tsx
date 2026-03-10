"use client";

import { useCallback, useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

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

type Evaluation = {
  questionId: number;
  score: number;
  strengths: string[];
  weaknesses: string[];
  feedback: string;
  modelAnswer: string;
};

type SubmitAnswersResponse = {
  overallScore: number;
  evaluations: Evaluation[];
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
  const [submittingAnswers, setSubmittingAnswers] = useState(false);
  const [activeSession, setActiveSession] = useState<InterviewSessionResponse | null>(null);
  const [draftAnswers, setDraftAnswers] = useState<Record<number, string>>({});
  const [result, setResult] = useState<SubmitAnswersResponse | null>(null);

  const getToken = useCallback(() => {
    return localStorage.getItem("token") ?? sessionStorage.getItem("token");
  }, []);

  const clearAuthAndRedirect = useCallback(() => {
    localStorage.removeItem("token");
    sessionStorage.removeItem("token");
    router.push("/login");
  }, [router]);

  async function handleStartInterview() {
    const token = getToken();

    if (!token) {
      clearAuthAndRedirect();
      return;
    }

    setStartingInterview(true);
    setError("");
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

      if (!res.ok) {
        setError(("message" in data && data.message) || "Could not start interview.");
        return;
      }

      const session = data as InterviewSessionResponse;
      setActiveSession(session);
      setDraftAnswers(
        Object.fromEntries(session.questions.map((question) => [question.questionId, ""])) as Record<number, string>,
      );
    } catch {
      setError("Network error. Please try again.");
    } finally {
      setStartingInterview(false);
    }
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

    const token = getToken();

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

      setResult(data as SubmitAnswersResponse);
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

  useEffect(() => {
    async function loadDashboard() {
      const token = getToken();

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
      } catch {
        setError("Something went wrong. Please try again.");
      } finally {
        setLoading(false);
      }
    }

    loadDashboard();
  }, [clearAuthAndRedirect, getToken]);

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
              {result && (
                <div className="rounded-2xl border border-slate-200 bg-slate-50/80 p-4 dark:border-white/10 dark:bg-slate-900/40">
                  <p className="text-xs font-semibold uppercase tracking-[0.14em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                    Interview score
                  </p>
                  <div className="mt-2 flex items-end gap-3">
                    <span className="text-4xl font-semibold text-[var(--heading)] dark:text-[#f8fafc]">
                      {result.overallScore}
                    </span>
                    <span className="pb-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">out of 100</span>
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
                            Score {evaluationsByQuestionId.get(question.questionId)?.score}/100
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
        </CardContent>
      </Card>
    </section>
  );
}
