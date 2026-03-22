"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Eye, EyeOff, Loader2 } from "lucide-react";
import { getStoredToken } from "@/lib/auth";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type LoginResponse = {
  token?: string;
  message?: string;
};

export default function LoginPage() {
  const router = useRouter();
  const emailRef = useRef<HTMLInputElement>(null);

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [rememberMe, setRememberMe] = useState(true);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [emailTouched, setEmailTouched] = useState(false);

  const emailValid = email.length === 0 || /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  const formValid = email.length > 0 && emailValid && password.length > 0;

  // Redirect if already logged in
  useEffect(() => {
    const token = getStoredToken();
    if (token) {
      router.replace("/dashboard");
    }
  }, [router]);

  // Auto-focus email field
  useEffect(() => {
    emailRef.current?.focus();
  }, []);

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const res = await fetch(`${API_BASE}/api/auth/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });

      let data: LoginResponse = {};
      try {
        data = (await res.json()) as LoginResponse;
      } catch {
        data = {};
      }

      if (!res.ok || !data.token) {
        setError(data.message || "Login failed. Please try again.");
        return;
      }

      if (rememberMe) {
        localStorage.setItem("token", data.token);
        sessionStorage.removeItem("token");
      } else {
        sessionStorage.setItem("token", data.token);
        localStorage.removeItem("token");
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
    <section className="mx-auto grid w-full max-w-5xl items-center gap-8 lg:grid-cols-2">
      <div className="lg:hidden">
        <div className="mb-6 flex gap-6">
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">3</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Roles</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">0-10</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">AI scoring</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">Real</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Feedback</p>
          </div>
        </div>
      </div>

      <div className="hidden rounded-[10px] border border-slate-200 bg-white p-8 shadow-[0_10px_30px_rgba(15,23,42,0.12)] lg:block dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Welcome back</p>
        <h2 className="text-3xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">
          Your interview prep
          <br />
          doesn&apos;t pause.
        </h2>
        <p className="mt-4 text-[var(--muted-foreground)] dark:text-[#9ca3af]">
          Sign in to review your scores, drill weak areas, and keep your streak alive.
        </p>
        <div className="mt-6 flex gap-6 border-t border-slate-200 pt-6 dark:border-white/10">
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">3</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Roles</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">0-10</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">AI scoring</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">Real</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Feedback</p>
          </div>
        </div>
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
                ref={emailRef}
                id="email"
                type="email"
                placeholder="name@company.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                onBlur={() => setEmailTouched(true)}
                className={`block w-full rounded-[10px] border bg-slate-50 p-2.5 text-[var(--foreground)] placeholder:text-slate-400 focus:outline-none focus:ring-2 dark:bg-[#374151] dark:text-white dark:placeholder:text-[#9ca3af] ${
                  emailTouched && !emailValid
                    ? "border-red-300 focus:border-red-400 focus:ring-red-200 dark:border-red-700 dark:focus:ring-red-900/50"
                    : "border-slate-300 focus:border-[var(--brand-primary)] focus:ring-[var(--brand-primary)] dark:border-[#4b5563]"
                }`}
                required
              />
              {emailTouched && !emailValid && (
                <p className="mt-1.5 text-xs text-red-600 dark:text-red-400">Enter a valid email address</p>
              )}
            </div>

            <div>
              <label htmlFor="password" className="mb-2 block text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">
                Password
              </label>
              <div className="relative">
                <input
                  id="password"
                  type={showPassword ? "text" : "password"}
                  placeholder="********"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="block w-full rounded-[10px] border border-slate-300 bg-slate-50 p-2.5 pr-10 text-[var(--foreground)] placeholder:text-slate-400 focus:border-[var(--brand-primary)] focus:outline-none focus:ring-2 focus:ring-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151] dark:text-white dark:placeholder:text-[#9ca3af]"
                  required
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-[var(--muted-foreground)] hover:text-[var(--heading)] dark:text-[#9ca3af] dark:hover:text-[#f8fafc]"
                  tabIndex={-1}
                >
                  {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                </button>
              </div>
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
            </div>

            {error && (
              <p className="rounded-[10px] border border-red-200 bg-red-50 p-3 text-sm text-red-700 dark:border-red-800 dark:bg-red-950/30 dark:text-red-300">
                {error}
              </p>
            )}

            <button
              type="submit"
              disabled={loading || !formValid}
              className="flex w-full items-center justify-center gap-2 rounded-[10px] bg-[var(--brand-primary)] px-5 py-2.5 text-base font-medium text-white transition hover:bg-[var(--brand-primary-hover)] disabled:opacity-50"
            >
              {loading && <Loader2 className="h-4 w-4 animate-spin" />}
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
