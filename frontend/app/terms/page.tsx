export const metadata = {
  title: "Terms of Service — InterviewOS",
};

export default function TermsPage() {
  return (
    <section className="mx-auto w-full max-w-3xl">
      <div className="rounded-[10px] border border-slate-200 bg-white p-8 shadow-[0_10px_30px_rgba(15,23,42,0.12)] dark:border-white/10 dark:bg-[#1e293b] dark:shadow-[0_10px_30px_rgba(0,0,0,0.35)]">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-[var(--muted-foreground)] dark:text-[#9ca3af]">Legal</p>
        <h1 className="mt-3 text-3xl font-bold tracking-tight text-[var(--heading)] dark:text-[#f8fafc]">Terms of Service</h1>
        <p className="mt-2 text-sm text-[var(--muted-foreground)] dark:text-[#9ca3af]">Last updated: 19 March 2026</p>

        <div className="mt-8 space-y-6 text-sm leading-relaxed text-[var(--foreground)] dark:text-[#cbd5e1]">
          <p>
            These Terms of Service (&quot;Terms&quot;) govern your access to and use of InterviewOS, operated by Asad Deerow (&quot;InterviewOS&quot;, &quot;we&quot;, &quot;us&quot;, &quot;our&quot;).
          </p>
          <p>By creating an account, subscribing, or using InterviewOS, you agree to these Terms.</p>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">1. Eligibility</h2>
            <p className="mt-2">You must be at least 16 years old to use InterviewOS.</p>
            <p className="mt-2">By using the service, you represent that:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>you are legally able to enter into a binding agreement</li>
              <li>the information you provide is accurate</li>
              <li>you will comply with these Terms and applicable law</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">2. Description of the Service</h2>
            <p className="mt-2">InterviewOS is an AI-powered interview practice platform that may provide:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>simulated interview sessions</li>
              <li>AI-generated evaluations, scores, and feedback</li>
              <li>session history and performance tracking</li>
              <li>subscription-based access to certain features</li>
            </ul>
            <p className="mt-2">The service is provided for practice purposes only. InterviewOS does not guarantee interview success, employment, or job offers.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">3. AI Output Disclaimer</h2>
            <p className="mt-2">InterviewOS uses AI systems and third-party AI providers to generate feedback and evaluations.</p>
            <p className="mt-2">You acknowledge that:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>AI outputs may be inaccurate, incomplete, inconsistent, or misleading</li>
              <li>scores and evaluations are estimates only</li>
              <li>you are solely responsible for how you use any output provided by the service</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">4. Accounts</h2>
            <p className="mt-2">To use certain features, you must create an account.</p>
            <p className="mt-2">You agree to:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>provide a valid email address and accurate information</li>
              <li>keep your credentials confidential</li>
              <li>remain responsible for activity under your account</li>
              <li>notify us promptly of any unauthorised account use</li>
            </ul>
            <p className="mt-2">You must not:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>share your account with others</li>
              <li>impersonate another person</li>
              <li>create accounts using false or misleading information</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">5. Free Tier and Paid Subscriptions</h2>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Free Tier</h3>
            <p className="mt-1">Free accounts may receive limited access, including a cap on interview sessions or features. We may change or remove free-tier features at any time.</p>

            <h3 className="mt-4 text-sm font-semibold text-[var(--heading)] dark:text-[#f8fafc]">Paid Plans</h3>
            <p className="mt-1">Paid subscriptions are billed through Stripe. By purchasing a subscription, you authorise recurring charges for the selected billing interval unless you cancel before renewal.</p>
            <p className="mt-2">Prices, features, billing intervals, and usage limits may change from time to time.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">6. Billing, Renewal, and Cancellation</h2>
            <p className="mt-2">Unless stated otherwise at checkout:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>subscriptions renew automatically at the end of each billing period</li>
              <li>you may cancel at any time through the product or by contacting <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a></li>
              <li>cancellation stops future renewals but does not automatically refund amounts already paid for the current billing period</li>
            </ul>
            <p className="mt-2">You remain responsible for charges incurred before cancellation takes effect.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">7. Refund Policy</h2>
            <p className="mt-2">You may request a refund within 7 days of payment only if the subscription has not been used.</p>
            <p className="mt-2">A subscription will generally be treated as used if you have accessed paid features, started paid interview sessions, or otherwise consumed material paid functionality.</p>
            <p className="mt-2">Refunds may also be granted for duplicate or accidental charges at our discretion or where required by law.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">8. Your Content</h2>
            <p className="mt-2">You retain ownership of the interview answers and other content you submit to InterviewOS (&quot;User Content&quot;).</p>
            <p className="mt-2">You grant us a limited, non-exclusive, worldwide licence to host, store, process, transmit, reproduce, analyse, and use your User Content as necessary to:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>operate the service</li>
              <li>generate AI feedback and evaluations</li>
              <li>maintain session history</li>
              <li>improve, test, and develop our systems as described in the Privacy Policy</li>
              <li>comply with legal obligations</li>
            </ul>
            <p className="mt-2">You are responsible for ensuring that your User Content does not violate any law or the rights of others.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">9. Acceptable Use</h2>
            <p className="mt-2">You agree not to:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>use the service for unlawful, fraudulent, abusive, or deceptive purposes</li>
              <li>attempt to gain unauthorised access to accounts, systems, or data</li>
              <li>interfere with or disrupt the platform or infrastructure</li>
              <li>scrape, mirror, or systematically extract service content beyond permitted use</li>
              <li>reverse-engineer, decompile, disassemble, or attempt to derive source code, prompts, or internal logic except where prohibited restrictions are unenforceable by law</li>
              <li>use bots, scripts, or automation to abuse limits, billing systems, or service integrity</li>
              <li>upload malicious code or harmful payloads</li>
              <li>manipulate or exploit AI evaluations in a way that undermines the service</li>
            </ul>
            <p className="mt-2">We may suspend, restrict, or terminate accounts involved in abuse, fraud, misuse, or security threats.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">10. Intellectual Property</h2>
            <p className="mt-2">Except for your User Content, InterviewOS and all related content, software, branding, design, text, features, and workflows are owned by or licensed to us and protected by intellectual property law.</p>
            <p className="mt-2">Subject to these Terms, we grant you a limited, revocable, non-transferable, non-exclusive right to use the service for your personal lawful use.</p>
            <p className="mt-2">You must not copy, sell, license, redistribute, or commercially exploit the service except as expressly permitted by us in writing.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">11. Third-Party Services</h2>
            <p className="mt-2">InterviewOS relies on third-party services including OpenAI, Stripe, Resend, and hosting infrastructure providers.</p>
            <p className="mt-2">We are not responsible for outages, policy changes, or failures caused by third-party providers.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">12. Service Availability</h2>
            <p className="mt-2">We may modify, suspend, or discontinue any part of the service at any time, with or without notice.</p>
            <p className="mt-2">We do not guarantee that the service will be uninterrupted, secure, or error-free.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">13. Termination and Suspension</h2>
            <p className="mt-2">We may suspend or terminate your access immediately if:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>you breach these Terms</li>
              <li>you fail to pay applicable fees</li>
              <li>we reasonably suspect fraud, abuse, or security risk</li>
              <li>we are required to do so by law</li>
              <li>continuing to provide the service is no longer commercially or technically viable</li>
            </ul>
            <p className="mt-2">You may stop using the service at any time and may request account deletion under the Privacy Policy.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">14. Disclaimer of Warranties</h2>
            <p className="mt-2">To the maximum extent permitted by law, InterviewOS is provided &quot;as is&quot; and &quot;as available&quot; without warranties of any kind, whether express, implied, or statutory.</p>
            <p className="mt-2">We disclaim all implied warranties to the maximum extent permitted by law, including merchantability, fitness for a particular purpose, non-infringement, and accuracy of AI-generated outputs.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">15. Limitation of Liability</h2>
            <p className="mt-2">To the maximum extent permitted by law:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>we are not liable for indirect, incidental, special, consequential, or punitive damages</li>
              <li>we are not liable for loss of profits, business, opportunity, goodwill, data, or service interruption</li>
              <li>our total aggregate liability arising out of or relating to the service or these Terms will not exceed the greater of: the amount you paid us in the 12 months before the event giving rise to the claim, or &pound;100</li>
            </ul>
            <p className="mt-2">Nothing in these Terms excludes or limits liability that cannot lawfully be excluded or limited.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">16. Indemnity</h2>
            <p className="mt-2">You agree to indemnify and hold harmless InterviewOS and its operator from claims, liabilities, losses, damages, and expenses arising from:</p>
            <ul className="mt-1 list-disc space-y-1 pl-5">
              <li>your misuse of the service</li>
              <li>your violation of these Terms</li>
              <li>your violation of applicable law</li>
              <li>your infringement of another person&apos;s rights</li>
            </ul>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">17. Changes to the Service or Terms</h2>
            <p className="mt-2">We may update the service or these Terms from time to time. If we make material changes, we may notify you by email or by updating the &quot;Last updated&quot; date above.</p>
            <p className="mt-2">Continued use of the service after updated Terms take effect constitutes acceptance of the updated Terms.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">18. Governing Law and Jurisdiction</h2>
            <p className="mt-2">These Terms and any dispute or claim arising out of or in connection with them or the use of InterviewOS shall be governed by the laws of England and Wales.</p>
            <p className="mt-2">You and we agree that the courts of England and Wales shall have exclusive jurisdiction, except where mandatory law provides otherwise.</p>
          </div>

          <div>
            <h2 className="text-base font-semibold text-[var(--heading)] dark:text-[#f8fafc]">19. Contact</h2>
            <p className="mt-2">For legal, billing, or support matters, contact:</p>
            <p className="mt-1">Asad Deerow</p>
            <p>Email: <a href="mailto:a.deerow98@gmail.com" className="text-[var(--brand-link)] hover:text-[var(--brand-link-hover)] hover:underline dark:text-[#60a5fa]">a.deerow98@gmail.com</a></p>
          </div>
        </div>
      </div>
    </section>
  );
}
