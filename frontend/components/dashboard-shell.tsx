"use client";

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import {
  LayoutDashboard,
  MessageSquare,
  Clock,
  CreditCard,
  Settings,
} from "lucide-react";

export type DashboardNavItemKey = "workspace" | "interview" | "history" | "pricing" | "settings";
export type DashboardTabKey = Exclude<DashboardNavItemKey, "pricing">;

type DashboardShellProps = {
  activeItem: DashboardNavItemKey;
  onTabSelect?: (tab: DashboardTabKey) => void;
  children: React.ReactNode;
};

const navItems: Array<{
  key: DashboardNavItemKey;
  label: string;
  href: string;
  icon: React.ElementType;
}> = [
  { key: "workspace", label: "Workspace", href: "/dashboard", icon: LayoutDashboard },
  { key: "interview", label: "Interview", href: "/dashboard#interview", icon: MessageSquare },
  { key: "history", label: "History", href: "/dashboard#history", icon: Clock },
  { key: "pricing", label: "Pricing", href: "/dashboard/pricing", icon: CreditCard },
  { key: "settings", label: "Settings", href: "/dashboard#settings", icon: Settings },
];

export function DashboardShell({ activeItem, onTabSelect, children }: DashboardShellProps) {
  return (
    <section className="mx-auto max-w-7xl">
      <div className="flex flex-col gap-6 lg:flex-row">
        <aside className="w-full rounded-[20px] border border-slate-200 bg-white/95 p-3 shadow-[0_18px_40px_-28px_rgba(15,23,42,0.45)] dark:border-white/10 dark:bg-slate-950/70 lg:sticky lg:top-24 lg:w-56 lg:self-start">
          <div className="px-3 pb-1 pt-2">
            <p className="text-[10px] font-semibold uppercase tracking-[0.2em] text-slate-400 dark:text-slate-500">
              Navigation
            </p>
          </div>

          <nav className="mt-2 grid gap-0.5">
            {navItems.map((item) => {
              const isActive = item.key === activeItem;
              const Icon = item.icon;
              const className = cn(
                "h-10 w-full justify-start gap-3 rounded-xl px-3 text-[13px] font-medium transition-all",
                isActive && "shadow-[0_14px_30px_-20px_rgba(37,99,235,0.55)]",
              );

              if (item.key !== "pricing" && onTabSelect) {
                const tabKey = item.key as DashboardTabKey;

                return (
                  <Button
                    key={item.key}
                    variant={isActive ? "default" : "ghost"}
                    className={className}
                    onClick={() => onTabSelect(tabKey)}
                  >
                    <Icon className="h-4 w-4 flex-none" />
                    {item.label}
                  </Button>
                );
              }

              return (
                <Button key={item.key} asChild variant={isActive ? "default" : "ghost"} className={className}>
                  <Link href={item.href}>
                    <Icon className="h-4 w-4 flex-none" />
                    {item.label}
                  </Link>
                </Button>
              );
            })}
          </nav>
        </aside>

        <main className="min-w-0 flex-1">{children}</main>
      </div>
    </section>
  );
}
