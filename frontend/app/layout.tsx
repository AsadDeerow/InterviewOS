import Link from "next/link";
import { Inter } from "next/font/google";
import { AuthNavLinks } from "@/components/auth-nav-links";
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
      <body className={`${inter.variable} antialiased`}>
        <div className="min-h-screen">
          <header className="sticky top-0 z-30 border-b border-slate-200/80 bg-white/90 backdrop-blur-md dark:border-white/10 dark:bg-[#0f172a]/90">
            <div className="mx-auto flex w-full max-w-6xl items-center justify-between px-4 py-4 sm:px-6">
              <Link href="/" className="group flex items-center gap-2">
                <span className="h-2.5 w-2.5 rounded-full bg-[var(--brand-primary)] shadow-[0_0_12px_rgba(107,114,128,0.35)] transition group-hover:scale-110 dark:bg-[#3b82f6] dark:shadow-[0_0_18px_rgba(59,130,246,0.45)]" />
                <span className="text-xl font-semibold tracking-tight text-[var(--heading)] dark:text-[var(--heading)]">InterviewOS</span>
                <span className="hidden rounded-full border border-slate-300 px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-[var(--muted-foreground)] dark:border-white/10 dark:text-[var(--muted-foreground)] sm:inline-block">
                  beta
                </span>
              </Link>

              <nav className="flex items-center gap-3 text-sm">
                <AuthNavLinks />
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
