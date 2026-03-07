"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { fetchWithCsrf } from "@/lib/csrf";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type ApiResponse = {
  message?: string;
};

export default function LoginPage() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rememberMe, setRememberMe] = useState(true);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const res = await fetchWithCsrf(API_BASE, `${API_BASE}/api/auth/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password, rememberMe }),
      });

      let data: ApiResponse = {};
      try {
        data = (await res.json()) as ApiResponse;
      } catch {
        data = {};
      }

      if (!res.ok) {
        setError(data.message || "Login failed. Please try again.");
        return;
      }

      router.push("/dashboard");
      router.refresh();
    } catch {
      setError("Network error. Please try again later.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <section className="mx-auto grid w-full max-w-5xl items-center gap-6 lg:grid-cols-2">
      <div className="hidden rounded-[10px] border border-slate-200 bg-white p-8 shadow-[0_10px_30px_rgba(15,23,42,0.12)] lg:block dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Welcome back</p>
        <h2 className="text-3xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">Practice like it is the real interview day.</h2>
        <p className="mt-4 text-[var(--muted-foreground)] dark:text-[#9ca3af]">Sign in to continue mock rounds, review performance trends, and sharpen weak topics.</p>
      </div>

      <div className="mx-auto w-full max-w-md rounded-[10px] border border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <div className="space-y-6 p-6">
          <h1 className="text-2xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">Sign in to your account</h1>

          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label htmlFor="email" className="mb-2 block text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">
                Your email
              </label>
              <input
                id="email"
                type="email"
                placeholder="name@company.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="block w-full rounded-[10px] border border-slate-300 bg-slate-50 p-2.5 text-[var(--foreground)] placeholder:text-slate-400 focus:border-[var(--brand-primary)] focus:outline-none focus:ring-2 focus:ring-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151] dark:text-white dark:placeholder:text-[#9ca3af]"
                required
              />
            </div>

            <div>
              <label htmlFor="password" className="mb-2 block text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">
                Password
              </label>
              <input
                id="password"
                type="password"
                placeholder="********"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="block w-full rounded-[10px] border border-slate-300 bg-slate-50 p-2.5 text-[var(--foreground)] placeholder:text-slate-400 focus:border-[var(--brand-primary)] focus:outline-none focus:ring-2 focus:ring-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151] dark:text-white dark:placeholder:text-[#9ca3af]"
                required
              />
            </div>

            <div className="flex items-center justify-between">
              <label className="flex items-center gap-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
                <input
                  type="checkbox"
                  className="h-4 w-4 rounded border border-slate-300 bg-slate-50 accent-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151]"
                  checked={rememberMe}
                  onChange={(e) => setRememberMe(e.target.checked)}
                />
                Remember me
              </label>
              <span className="text-sm font-medium text-[var(--brand-link)] hover:text-[var(--brand-link-hover)]">Forgot password?</span>
            </div>

            {error && <p className="rounded-[10px] border border-red-800 bg-red-950/30 p-3 text-sm text-red-300">{error}</p>}

            <button
              type="submit"
              disabled={loading}
              className="w-full rounded-[10px] bg-[var(--brand-primary)] px-5 py-2.5 text-center text-base font-medium text-white transition hover:bg-[var(--brand-primary-hover)] disabled:opacity-60"
            >
              {loading ? "Signing in..." : "Sign in"}
            </button>

            <p className="text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              Don&apos;t have an account yet?{" "}
              <Link href="/register" className="font-medium text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline">
                Sign up
              </Link>
            </p>
          </form>
        </div>
      </div>
    </section>
  );
}
