import { DashboardShell } from "@/components/dashboard-shell";
import { PricingSurface } from "@/components/pricing-surface";

export default function PricingPage() {
  return (
    <DashboardShell activeItem="pricing">
      <PricingSurface />
    </DashboardShell>
  );
}
