import { Inter } from "next/font/google";
import { AppHeader } from "@/components/app-header";
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
          <AppHeader />
          <main className="mx-auto w-full max-w-6xl px-4 pb-10 pt-28 sm:px-6">{children}</main>
        </div>
      </body>
    </html>
  );
}
