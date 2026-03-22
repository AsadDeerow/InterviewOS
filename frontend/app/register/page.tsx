"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Eye, EyeOff, Check, X, Loader2 } from "lucide-react";
import { cn } from "@/lib/utils";
import { getStoredToken } from "@/lib/auth";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

type LoginResponse = {
  token?: string;
  message?: string;
};

type ApiResponse = {
  message?: string;
};

function passwordStrength(pw: string): { label: string; percent: number; color: string } {
  if (pw.length === 0) return { label: "", percent: 0, color: "bg-slate-200 dark:bg-slate-700" };
  let score = 0;
  if (pw.length >= 8) score++;
  if (pw.length >= 12) score++;
  if (/[a-z]/.test(pw) && /[A-Z]/.test(pw)) score++;
  if (/\d/.test(pw)) score++;
  if (/[^a-zA-Z0-9]/.test(pw)) score++;

  if (score <= 1) return { label: "Weak", percent: 20, color: "bg-red-500" };
  if (score === 2) return { label: "Fair", percent: 40, color: "bg-orange-500" };
  if (score === 3) return { label: "Good", percent: 60, color: "bg-amber-500" };
  if (score === 4) return { label: "Strong", percent: 80, color: "bg-emerald-500" };
  return { label: "Very strong", percent: 100, color: "bg-emerald-500" };
}

export default function RegisterPage() {
  const router = useRouter();
  const emailRef = useRef<HTMLInputElement>(null);

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);
  const [agreedToTerms, setAgreedToTerms] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [emailTouched, setEmailTouched] = useState(false);

  const emailValid = email.length === 0 || /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  const strength = passwordStrength(password);
  const confirmTouched = confirmPassword.length > 0;
  const confirmMatch = password === confirmPassword;
  const formValid =
    email.length > 0 &&
    emailValid &&
    password.length >= 8 &&
    confirmMatch &&
    confirmTouched &&
    agreedToTerms;

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

  async function handleRegister(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setError("");
    setSuccess("");

    if (password.length < 8) {
      setError("Password must be at least 8 characters long.");
      return;
    }

    if (password !== confirmPassword) {
      setError("Passwords do not match.");
      return;
    }

    if (!agreedToTerms) {
      setError("You must agree to the Terms of Service and Privacy Policy.");
      return;
    }

    setLoading(true);

    try {
      const registerRes = await fetch(`${API_BASE}/api/auth/register`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });

      let registerData: ApiResponse = {};
      try {
        registerData = (await registerRes.json()) as ApiResponse;
      } catch {
        registerData = {};
      }

      if (!registerRes.ok) {
        setError(registerData.message || "Registration failed. Please try again.");
        return;
      }

      const loginRes = await fetch(`${API_BASE}/api/auth/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });

      let loginData: LoginResponse = {};
      try {
        loginData = (await loginRes.json()) as LoginResponse;
      } catch {
        loginData = {};
      }

      if (!loginRes.ok || !loginData.token) {
        setSuccess("Account created successfully. Redirecting to sign in...");
        setTimeout(() => {
          router.push("/login");
          router.refresh();
        }, 1500);
        return;
      }

      localStorage.setItem("token", loginData.token);
      router.push("/onboarding");
      router.refresh();
    } catch {
      setError("Could not reach the server. Please try again.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <section className="mx-auto grid w-full max-w-5xl items-center gap-8 lg:grid-cols-2">
      <div className="lg:hidden">
        <div className="mb-6 flex gap-6">
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">Free</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">2 sessions/mo</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">30s</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">To sign up</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">AI</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Scored feedback</p>
          </div>
        </div>
      </div>

      <div className="hidden rounded-[10px] border border-slate-200 bg-white p-8 shadow-[0_10px_30px_rgba(15,23,42,0.12)] lg:block dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Get started</p>
        <h2 className="text-3xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">
          Find out where
          <br />
          you actually stand.
        </h2>
        <p className="mt-4 text-[var(--muted-foreground)] dark:text-[#9ca3af]">
          Take a mock interview. Get a real score. See what you need to fix before the real thing.
        </p>
        <div className="mt-6 flex gap-6 border-t border-slate-200 pt-6 dark:border-white/10">
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">Free</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">2 sessions/mo</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">30s</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">To sign up</p>
          </div>
          <div>
            <p className="text-2xl font-bold text-[var(--heading)] dark:text-[#f8fafc]">AI</p>
            <p className="text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Scored feedback</p>
          </div>
        </div>
      </div>

      <div className="mx-auto w-full max-w-md rounded-[10px] border border-slate-200 bg-white shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <div className="space-y-6 p-6">
          <h1 className="text-2xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">Create your account</h1>

          <form onSubmit={handleRegister} className="space-y-4">
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
                  placeholder="At least 8 characters"
                  minLength={8}
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
              {password.length > 0 && (
                <div className="mt-2 space-y-1.5">
                  <div className="flex items-center gap-2">
                    <div className="h-1.5 flex-1 overflow-hidden rounded-full bg-slate-200 dark:bg-slate-700">
                      <div
                        className={cn("h-full rounded-full transition-all", strength.color)}
                        style={{ width: `${strength.percent}%` }}
                      />
                    </div>
                    <span className="text-xs font-medium text-[var(--muted-foreground)] dark:text-[#9ca3af]">{strength.label}</span>
                  </div>
                  <p className={cn("text-xs", password.length >= 8 ? "text-emerald-600 dark:text-emerald-400" : "text-[var(--muted-foreground)] dark:text-[#9ca3af]")}>
                    {password.length >= 8 ? "Minimum length met" : `${8 - password.length} more character${8 - password.length !== 1 ? "s" : ""} needed`}
                  </p>
                </div>
              )}
              {password.length === 0 && (
                <p className="mt-1.5 text-xs text-[var(--muted-foreground)] dark:text-[#9ca3af]">Must be at least 8 characters</p>
              )}
            </div>

            <div>
              <label htmlFor="confirm-password" className="mb-2 block text-sm font-medium text-[var(--foreground)] dark:text-[#cbd5e1]">
                Confirm password
              </label>
              <div className="relative">
                <input
                  id="confirm-password"
                  type={showConfirm ? "text" : "password"}
                  placeholder="Re-enter your password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  className={cn(
                    "block w-full rounded-[10px] border bg-slate-50 p-2.5 pr-16 text-[var(--foreground)] placeholder:text-slate-400 focus:outline-none focus:ring-2 dark:bg-[#374151] dark:text-white dark:placeholder:text-[#9ca3af]",
                    confirmTouched && !confirmMatch
                      ? "border-red-300 focus:border-red-400 focus:ring-red-200 dark:border-red-700 dark:focus:ring-red-900/50"
                      : confirmTouched && confirmMatch
                        ? "border-emerald-300 focus:border-emerald-400 focus:ring-emerald-200 dark:border-emerald-700 dark:focus:ring-emerald-900/50"
                        : "border-slate-300 focus:border-[var(--brand-primary)] focus:ring-[var(--brand-primary)] dark:border-[#4b5563]",
                  )}
                  required
                />
                <div className="absolute right-3 top-1/2 flex -translate-y-1/2 items-center gap-1.5">
                  {confirmTouched && (
                    confirmMatch
                      ? <Check className="h-4 w-4 text-emerald-500" />
                      : <X className="h-4 w-4 text-red-500" />
                  )}
                  <button
                    type="button"
                    onClick={() => setShowConfirm(!showConfirm)}
                    className="text-[var(--muted-foreground)] hover:text-[var(--heading)] dark:text-[#9ca3af] dark:hover:text-[#f8fafc]"
                    tabIndex={-1}
                  >
                    {showConfirm ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                  </button>
                </div>
              </div>
              {confirmTouched && !confirmMatch && (
                <p className="mt-1.5 text-xs text-red-600 dark:text-red-400">Passwords don&apos;t match</p>
              )}
            </div>

            <label className="flex items-start gap-2.5 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              <input
                type="checkbox"
                className="mt-0.5 h-4 w-4 rounded border border-slate-300 bg-slate-50 accent-[var(--brand-primary)] dark:border-[#4b5563] dark:bg-[#374151]"
                checked={agreedToTerms}
                onChange={(e) => setAgreedToTerms(e.target.checked)}
              />
              <span>
                I agree to the{" "}
                <Link href="/terms" target="_blank" className="font-medium text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">
                  Terms of Service
                </Link>{" "}
                and{" "}
                <Link href="/privacy" target="_blank" className="font-medium text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">
                  Privacy Policy
                </Link>
              </span>
            </label>

            {error && (
              <p className="rounded-[10px] border border-red-200 bg-red-50 p-3 text-sm text-red-700 dark:border-red-800 dark:bg-red-950/30 dark:text-red-300">
                {error}
              </p>
            )}

            {success && (
              <p className="rounded-[10px] border border-emerald-200 bg-emerald-50 p-3 text-sm text-emerald-700 dark:border-emerald-800 dark:bg-emerald-950/30 dark:text-emerald-300">
                {success}
              </p>
            )}

            <button
              type="submit"
              disabled={loading || !formValid}
              className="flex w-full items-center justify-center gap-2 rounded-[10px] bg-[var(--brand-primary)] px-5 py-2.5 text-base font-medium text-white transition hover:bg-[var(--brand-primary-hover)] disabled:opacity-50"
            >
              {loading && <Loader2 className="h-4 w-4 animate-spin" />}
              {loading ? "Creating account..." : "Create account"}
            </button>

            <p className="text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">
              Already have an account?{" "}
              <Link href="/login" className="font-medium text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline">
                Sign in
              </Link>
            </p>
          </form>
        </div>
      </div>
    </section>
  );
}
