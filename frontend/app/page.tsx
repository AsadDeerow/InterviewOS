import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

export default function HomePage() {
  return (
    <section className="mx-auto max-w-4xl">
      <Card className="relative overflow-hidden">
        <div className="pointer-events-none absolute -right-20 -top-24 h-64 w-64 rounded-full bg-blue-400/20 blur-3xl" />
        <CardHeader className="relative">
          <p className="inline-flex w-fit rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-medium tracking-wide text-blue-700">
            AI Interview Practice
          </p>
          <CardTitle className="pt-3 text-3xl sm:text-4xl">Train for technical interviews with confidence</CardTitle>
          <CardDescription className="max-w-2xl text-base">
            InterviewOS gives you realistic question loops, structured feedback, and progress tracking in one focused workspace.
          </CardDescription>
        </CardHeader>
        <CardContent className="relative flex flex-wrap gap-3 pt-2">
          <Button asChild size="lg">
            <Link href="/login">Sign in</Link>
          </Button>
          <Button asChild size="lg" variant="outline">
            <Link href="/register">Create account</Link>
          </Button>
        </CardContent>
      </Card>
    </section>
  );
}
