import { Inter } from "next/font/google";
import { AppHeader } from "@/components/app-header";
import "./globals.css";

const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
});

export const metadata = {
  title: "Technical Interview Simulator to Get Hired | InterviewOS",
  description:
    "Practice with an AI technical interview simulator that asks role-based questions, scores answers, and tracks progress so you improve faster.",
  keywords: [
    "technical interview simulator",
    "practice technical interviews",
    "AI technical interview practice",
    "mock coding interview AI",
    "technical interview practice tool",
    "AI interview feedback",
    "role-based interview simulator",
    "backend engineer interview practice",
    "data science interview practice",
    "software engineer mock interview",
    "technical interview preparation",
    "technical interview simulator for students",
    "LeetCode alternative for interview practice",
    "Pramp alternative",
    "Interviewing.io alternative",
    "pass technical interviews",
    "get hired software engineer",
    "improve technical interview answers",
    "realistic mock interview platform",
  ],
  openGraph: {
    title: "Technical Interview Simulator to Get Hired | InterviewOS",
    description:
      "Practice with an AI technical interview simulator that asks role-based questions, scores answers, and tracks progress so you improve faster.",
    siteName: "InterviewOS",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Technical Interview Simulator to Get Hired | InterviewOS",
    description:
      "Practice with an AI technical interview simulator that asks role-based questions, scores answers, and tracks progress so you improve faster.",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "SoftwareApplication",
              name: "InterviewOS",
              description:
                "AI-powered technical interview simulator for job candidates preparing for software engineering and technical roles. InterviewOS generates role-based interview questions, evaluates answers, scores performance, and tracks improvement over time.",
              applicationCategory: "DeveloperApplication",
              operatingSystem: "Web",
              keywords: [
                "technical interview simulator",
                "practice technical interviews",
                "mock coding interview AI",
                "AI interview feedback",
                "role-based interview practice",
                "technical interview preparation",
                "software engineer interview practice",
                "interview simulator",
              ],
              featureList: [
                "Role-specific interview simulations",
                "AI-generated technical interview questions",
                "AI evaluation and scoring of answers",
                "Performance feedback and improvement insights",
                "Interview performance tracking dashboard",
                "Realistic technical interview environment",
              ],
            }),
          }}
        />
      </head>
      <body className={`${inter.variable} antialiased`}>
        <div className="min-h-screen">
          <AppHeader />
          <main className="mx-auto w-full max-w-6xl px-4 pb-10 pt-28 sm:px-6">{children}</main>
        </div>
      </body>
    </html>
  );
}
