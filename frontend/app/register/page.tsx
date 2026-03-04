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

type LoginResponse = {
  token?: string;
};

export default function RegisterPage() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleRegister(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setError("");

    if (password.length < 8) {
      setError("Password must be at least 8 characters long.");
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

      if (registerRes.status === 409) {
        setError("An account with this email already exists.");
        return;
      }

      if (!registerRes.ok) {
        setError("Registration failed. Please try again.");
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
        loginData = await loginRes.json();
      } catch {
        loginData = {};
      }

      if (!loginRes.ok || !loginData.token) {
        router.push("/login");
        return;
      }

      localStorage.setItem("token", loginData.token);
      router.push("/dashboard");
    } catch {
      setError("Could not reach the server. Please try again.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <section className="mx-auto grid w-full max-w-5xl items-center gap-6 lg:grid-cols-2">
      <div className="hidden rounded-2xl border border-white/70 bg-white/60 p-8 backdrop-blur lg:block">
        <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Get started</p>
        <h2 className="text-3xl font-semibold tracking-tight text-slate-900">Build your interview engine in minutes.</h2>
        <p className="mt-4 text-slate-600">Create an account to start personalized mock interviews and track your growth over time.</p>
      </div>

      <Card className="mx-auto w-full max-w-md">
        <CardHeader>
          <CardTitle>Create account</CardTitle>
          <CardDescription>Set up your profile and jump straight into practice sessions.</CardDescription>
        </CardHeader>

        <CardContent>
          <form onSubmit={handleRegister} className="space-y-4">
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
                placeholder="At least 8 characters"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>

            {error && <Alert variant="destructive">{error}</Alert>}

            <Button type="submit" disabled={loading} className="w-full">
              {loading ? "Creating account..." : "Create account"}
            </Button>

            <p className="text-sm text-slate-600">
              Already have an account?{" "}
              <Link href="/login" className="font-medium text-slate-900 underline-offset-4 hover:underline">
                Sign in
              </Link>
            </p>
          </form>
        </CardContent>
      </Card>
    </section>
  );
}
