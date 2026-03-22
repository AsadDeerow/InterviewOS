import Link from "next/link";

export const metadata = {
  title: "Privacy Policy — InterviewOS",
};

export default function PrivacyPage() {
  return (
    <section className="mx-auto w-full max-w-3xl">
      <div className="rounded-[10px] border border-slate-200 bg-white p-8 shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Legal</p>
        <h1 className="mt-3 text-3xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">Privacy Policy</h1>
        <p className="mt-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">Last updated: 19 March 2026</p>

        <div className="mt-8 space-y-6 text-sm leading-relaxed text-[var(--foreground)] dark:text-[#cbd5e1]">
          <p>
            InterviewOS is operated by Asad Deerow (&quot;InterviewOS&quot;, &quot;we&quot;, &quot;us&quot;, &quot;our&quot;). This Privacy Policy explains what personal data we collect, how we use it, and your rights when you use InterviewOS.
          </p>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">1. Who We Are</h2>
            <p className="mt-2">
              For the purposes of applicable data protection law, Asad Deerow is the data controller of the personal data described in this Privacy Policy.
            </p>
            <p className="mt-2">Contact email: <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a></p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">2. Personal Data We Collect</h2>
            <p className="mt-2">We may collect the following categories of personal data:</p>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">a. Account Information</h3>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>email address</li>
              <li>hashed password</li>
              <li>account creation date</li>
              <li>subscription plan and account status</li>
            </ul>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">b. Interview Data</h3>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>selected interview roles</li>
              <li>answers you submit during interview sessions</li>
              <li>AI-generated evaluations, scores, feedback, and recommendations</li>
              <li>session history and timestamps</li>
            </ul>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">c. Billing and Payment Data</h3>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>subscription status</li>
              <li>billing plan</li>
              <li>payment transaction references and billing metadata provided by our payment processor</li>
            </ul>
            <p className="mt-2">We do not store your full payment card number. Payment card details are processed by Stripe.</p>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">d. Technical and Usage Data</h3>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>IP address</li>
              <li>login activity</li>
              <li>browser or device metadata</li>
              <li>session timestamps</li>
              <li>feature usage</li>
              <li>server logs</li>
              <li>local preference data such as theme settings</li>
            </ul>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">e. Communications</h3>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>emails or messages you send to us</li>
              <li>support requests</li>
              <li>transactional email records</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">3. How We Collect Your Data</h2>
            <p className="mt-2">We collect data:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>directly from you when you create an account, subscribe, or use the service</li>
              <li>automatically when you use InterviewOS</li>
              <li>from third-party providers such as Stripe when billing events occur</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">4. How We Use Your Data</h2>
            <p className="mt-2">We use your personal data to:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>create and manage your account</li>
              <li>provide interview practice sessions</li>
              <li>generate AI-based feedback and evaluations</li>
              <li>store and display your interview history and performance metrics</li>
              <li>process subscriptions and manage billing</li>
              <li>send transactional emails such as account, billing, and service notices</li>
              <li>secure the service and prevent fraud, abuse, and unauthorised access</li>
              <li>maintain, troubleshoot, and improve the platform</li>
              <li>comply with legal obligations</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">5. Improving Our Systems</h2>
            <p className="mt-2">
              By default, we may use your interview answers, session data, and related usage data to improve, test, fine-tune, and develop our own prompts, evaluation systems, ranking systems, models, and product features.
            </p>
            <p className="mt-2">
              You may opt out of this use at any time by contacting <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a>.
            </p>
            <p className="mt-2">
              If you opt out, we will stop using future eligible data from your account for those improvement purposes after your opt-out is processed.
            </p>
            <p className="mt-2">
              We do not use payment card details or passwords for model training or system improvement.
            </p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">6. Lawful Bases for Processing</h2>
            <p className="mt-2">Where UK GDPR or similar law applies, we rely on the following lawful bases:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li><strong>Contract:</strong> to provide the service you requested</li>
              <li><strong>Legitimate interests:</strong> to operate, secure, improve, and monitor the service</li>
              <li><strong>Legal obligation:</strong> to comply with applicable law, tax, fraud, or dispute requirements</li>
              <li><strong>Consent:</strong> where consent is required by law</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">7. Third-Party Services</h2>
            <p className="mt-2">We use third-party providers to operate InterviewOS, including:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li><strong>OpenAI</strong> — to process interview answers and generate AI feedback</li>
              <li><strong>Stripe</strong> — to process payments and subscriptions</li>
              <li><strong>Resend</strong> — to send transactional emails</li>
              <li><strong>Self-managed VPS infrastructure</strong> — to host the application and related systems</li>
            </ul>
            <p className="mt-2">These providers may process personal data on our behalf for the purposes described in this Privacy Policy.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">8. AI Processing</h2>
            <p className="mt-2">When you submit interview answers, those answers may be sent to OpenAI&apos;s API to generate evaluations, scores, or feedback.</p>
            <p className="mt-2">According to OpenAI&apos;s API terms, data sent through the API is not used by OpenAI to train its models.</p>
            <p className="mt-2">AI outputs may be inaccurate, incomplete, or misleading. They are provided for interview practice purposes only.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">9. International Data Transfers</h2>
            <p className="mt-2">
              Your personal data may be processed in countries outside the United Kingdom, including by third-party service providers such as OpenAI and Stripe.
            </p>
            <p className="mt-2">
              Where international data transfers occur, we take steps intended to ensure appropriate safeguards are in place, which may include contractual protections and provider compliance commitments.
            </p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">10. Data Retention</h2>
            <p className="mt-2">We retain personal data only for as long as reasonably necessary for the purposes described in this Privacy Policy.</p>
            <p className="mt-2">In general:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>account and interview data is retained while your account is active</li>
              <li>if you request deletion, we will delete or anonymise your personal data within 30 days, unless retention is required by law or for billing, fraud prevention, security, or dispute resolution</li>
              <li>anonymised or aggregated data may be retained for analytics, reporting, and product improvement</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">11. Data Security</h2>
            <p className="mt-2">We use reasonable technical and organisational measures to protect personal data, including:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>HTTPS encryption in transit</li>
              <li>password hashing using BCrypt or similar secure methods</li>
              <li>signed authentication tokens</li>
              <li>access controls</li>
              <li>server and application logging</li>
              <li>routine security updates and monitoring</li>
            </ul>
            <p className="mt-2">No method of storage or transmission is completely secure, and we cannot guarantee absolute security.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">12. Your Rights</h2>
            <p className="mt-2">Subject to applicable law, you may have the right to:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>access the personal data we hold about you</li>
              <li>request correction of inaccurate data</li>
              <li>request deletion of your personal data</li>
              <li>object to certain processing</li>
              <li>request restriction of processing</li>
              <li>request export of your data in a portable format</li>
              <li>withdraw consent where processing is based on consent</li>
              <li>lodge a complaint with the Information Commissioner&apos;s Office (ICO) or another relevant regulator</li>
            </ul>
            <p className="mt-2">
              To exercise your rights, contact <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a>.
            </p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">13. Cookies, Local Storage, and Similar Technologies</h2>
            <p className="mt-2">InterviewOS uses localStorage, sessionStorage, and similar technologies for core functionality such as:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>authentication</li>
              <li>session handling</li>
              <li>security</li>
              <li>theme and preference storage</li>
            </ul>
            <p className="mt-2">We do not use third-party advertising cookies.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">14. Children&apos;s Privacy</h2>
            <p className="mt-2">InterviewOS is not intended for users under 16 years old. You must not use the service if you are under 16.</p>
            <p className="mt-2">If we become aware that we have collected personal data from a user under 16 in violation of this policy, we may delete that data.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">15. Account Deletion</h2>
            <p className="mt-2">
              You may request deletion of your account by contacting <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a>.
            </p>
            <p className="mt-2">
              Deleting your account may permanently remove access to your interview history, scores, and subscription-related features, subject to legal or operational retention requirements.
            </p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">16. Changes to This Privacy Policy</h2>
            <p className="mt-2">
              We may update this Privacy Policy from time to time. If we make material changes, we may notify users by email or by updating the &quot;Last updated&quot; date above.
            </p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">17. Contact</h2>
            <p className="mt-2">For privacy-related questions or requests, contact:</p>
            <p className="mt-1">Asad Deerow</p>
            <p>Email: <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a></p>
          </div>
        </div>
      </div>
    </section>
  );
}
