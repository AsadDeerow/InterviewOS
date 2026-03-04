import Link from "next/link";
import { Inter } from "next/font/google";
import { ThemeToggle } from "@/components/theme-toggle";
import "./globals.css";

const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
});

export const metadata = {
  title: "InterviewOS",
  description: "AI-powered interview simulator",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`${inter.variable} text-slate-900 antialiased`}>
        <div className="min-h-screen">
          <header className="border-b border-white/60 bg-white/70 backdrop-blur">
            <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-4 py-4 sm:px-6">
              <Link href="/" className="text-xl font-semibold tracking-tight text-slate-900">
                InterviewOS <span className="text-xs text-slate-500">beta</span>
              </Link>

              <nav className="flex items-center gap-2 text-sm">
                <Link href="/login" className="rounded-md px-3 py-2 text-slate-700 transition hover:bg-white hover:text-slate-950">
                  Login
                </Link>
                <Link href="/register" className="rounded-md px-3 py-2 text-slate-700 transition hover:bg-white hover:text-slate-950">
                  Register
                </Link>
                <ThemeToggle />
              </nav>
            </div>
          </header>

          <main className="mx-auto w-full max-w-6xl px-4 py-10 sm:px-6">{children}</main>
        </div>
      </body>
    </html>
  );
}
