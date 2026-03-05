import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

export default function HomePage() {
  return (
    <section className="mx-auto w-full max-w-4xl">
      <Card className="relative overflow-hidden border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <div className="pointer-events-none absolute -right-20 -top-20 h-56 w-56 rounded-full bg-[#3b82f6]/15 blur-3xl dark:bg-[#3b82f6]/20" />
        <CardHeader className="relative space-y-5">
          <p className="inline-flex w-fit rounded-full border border-slate-300 bg-slate-100 px-3 py-1 text-xs font-medium tracking-wide text-[var(--foreground)] dark:border-[#4b5563] dark:bg-[#0f172a] dark:text-[#cbd5e1]">
            AI Interview Practice
          </p>
          <CardTitle className="text-3xl leading-tight text-[var(--heading)] dark:text-[#f8fafc] sm:text-5xl">
            Practice full technical interviews with structured AI feedback
          </CardTitle>
          <CardDescription className="max-w-2xl text-base text-[var(--muted-foreground)] dark:text-[#9ca3af]">
            Simulate real interview rounds, receive structured feedback, and track improvement across sessions.
          </CardDescription>
        </CardHeader>
        <CardContent className="relative space-y-4">
          <div className="flex flex-wrap items-center gap-3">
            <Button asChild size="lg">
              <Link href="/register">Start your first mock interview</Link>
            </Button>
            <Button asChild size="lg" variant="outline">
              <Link href="/login">Sign in</Link>
            </Button>
          </div>
          <ul className="grid gap-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af] sm:grid-cols-3">
            <li>Real interview-style prompts</li>
            <li>Structured feedback summaries</li>
            <li>Progress tracking over time</li>
          </ul>
        </CardContent>
      </Card>
    </section>
  );
}
