import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function HomePage() {
  return (
    <section className="mx-auto w-full max-w-3xl">
      <div className="space-y-8">
        {/* Hero */}
        <div className="space-y-5">
          <div className="inline-flex items-center gap-2 rounded-full border border-slate-300 bg-slate-100 px-3 py-1 dark:border-[#4b5563] dark:bg-[#0f172a]">
            <span className="h-1.5 w-1.5 rounded-full bg-emerald-500" />
            <span className="text-xs font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">900+ questions across 3 roles</span>
          </div>

          <h1 className="text-4xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc] sm:text-5xl lg:text-6xl">
            Practice Technical Interviews
            <br />
            <span className="text-[var(--muted-foreground)] dark:text-[#9ca3af]">with AI That Scores Your Answers</span>
          </h1>

          <p className="max-w-xl text-lg text-[var(--muted-foreground)] dark:text-[#9ca3af]">
            Timed mock interviews. AI-scored answers. Feedback that tells you exactly
            where you&apos;re weak. Stop guessing if you&apos;re ready.
          </p>
        </div>

        {/* CTAs */}
        <div className="flex flex-wrap items-center gap-3">
          <Button asChild size="lg" className="h-12 rounded-xl px-8 text-sm font-semibold">
            <Link href="/register">Start practicing now</Link>
          </Button>
          <Button asChild size="lg" variant="ghost" className="h-12 rounded-xl px-6 text-sm">
            <Link href="/login">I have an account</Link>
          </Button>
        </div>

        {/* Value props */}
        <div className="grid gap-4 pt-4 sm:grid-cols-3">
          <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">5</p>
            <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              Questions per session, scored by AI
            </p>
          </div>
          <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">0-10</p>
            <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              Score per question with strengths and weaknesses
            </p>
          </div>
          <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">Free</p>
            <p className="mt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              2 sessions per month. No credit card required.
            </p>
          </div>
        </div>

        {/* How it works */}
        <div className="space-y-4 pt-4">
          <h2 className="text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">How InterviewOS simulates real technical interviews</h2>
          <div className="grid gap-3 sm:grid-cols-3">
            {[
              { step: "01", text: "Pick a topic and start a timed interview" },
              { step: "02", text: "Answer 5 questions like it's the real thing" },
              { step: "03", text: "Get scored, see model answers, fix weak spots" },
            ].map((item) => (
              <div key={item.step} className="flex gap-3">
                <span className="text-3xl font-bold text-slate-200 dark:text-slate-700">{item.step}</span>
                <p className="pt-1 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">{item.text}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Who it's for */}
        <div className="space-y-4 pt-4">
          <h2 className="text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Built for students, engineers, and job candidates</h2>
          <div className="grid gap-3 sm:grid-cols-3">
            <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
              <p className="text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Backend Engineers</p>
              <p className="mt-1 text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                Databases, system design, APIs, security, and concurrency.
              </p>
            </div>
            <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
              <p className="text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Data Scientists</p>
              <p className="mt-1 text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                Statistics, ML, SQL, experimentation, and Python.
              </p>
            </div>
            <div className="rounded-xl border border-slate-200 bg-white p-4 dark:border-white/10 dark:bg-[#1e293b]">
              <p className="text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Product Managers</p>
              <p className="mt-1 text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                Product sense, analytics, execution, technical, and behavioral.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
