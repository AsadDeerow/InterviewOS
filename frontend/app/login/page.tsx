"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE_URL!;

export default function LoginPage() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

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
        body: JSON.stringify({
          email,
          password,
        }),
      });

      let data: unknown = {};

      try {
        data = await res.json();
      } catch {
        data = {};
      }

      const token = (data as { token?: string }).token;

      if (res.status === 401) {
        setError("Invalid email or password");
        return;
      }

      if (!res.ok || !token) {
        setError("Login failed. Please try again.");
        return;
      }

      localStorage.setItem("token", token);

      router.push("/dashboard");
    } catch {
      setError("Network error. Please try again later.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <section className="mx-auto grid w-full max-w-5xl items-center gap-6 lg:grid-cols-2">
      <div className="hidden rounded-2xl border border-white/70 bg-white/60 p-8 backdrop-blur lg:block">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Welcome back</p>
        <h2 className="text-3xl font-semibold tracking-tight text-slate-900">Practice like it is the real interview day.</h2>
        <p className="mt-4 text-slate-600">Sign in to continue mock rounds, review performance trends, and sharpen weak topics.</p>
      </div>

      <Card className="mx-auto w-full max-w-md">
        <CardHeader>
          <CardTitle>Sign in</CardTitle>
          <CardDescription>Enter your credentials to access your dashboard.</CardDescription>
        </CardHeader>

        <CardContent>
          <form onSubmit={handleLogin} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                placeholder="name@company.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="password">Password</Label>
              <Input
                id="password"
                type="password"
                placeholder="********"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>

            {error && <Alert variant="destructive">{error}</Alert>}

            <Button type="submit" disabled={loading} className="w-full">
              {loading ? "Signing in..." : "Sign in"}
            </Button>

            <p className="text-sm text-slate-600">
              Don&apos;t have an account yet?{" "}
              <Link href="/register" className="font-medium text-slate-900 underline-offset-4 hover:underline">
                Sign up
              </Link>
            </p>
          </form>
        </CardContent>
      </Card>
    </section>
  );
}
