import type { ReactNode } from "react";
import clsx from "clsx";
import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import HomepageFeatures from "@site/src/components/HomepageFeatures";
import Heading from "@theme/Heading";
import { BookOpen, ClipboardPlus } from "lucide-react";

import styles from "./index.module.css";

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header
      className={clsx("hero hero--primary heroGradient", styles.heroBanner)}
    >
      <div className="container">
        <div className={styles.heroInner}>
          <span className={styles.badgeSemester}>Odd Semester 2025/2026</span>
          <Heading
            as="h1"
            className="hero__title"
            style={{ marginTop: "0.75rem" }}
          >
            {siteConfig.title}
          </Heading>
          <h1 className="hero__subtitle">
            Materi, tugas, dan sumber belajar terkurasi untuk Praktikum Database
            Management System.
          </h1>
          <div className={styles.actions}>
            <Link className={clsx("button button--secondary button--lg", styles.buttonWithIcon)} to="/docs">
              <span>Lihat Materi</span>
              <BookOpen className={styles.buttonIcon} />
            </Link>
            <Link
              className={clsx("button button--primary button--lg", styles.buttonWithIcon)}
              to="/assignments"
            >
              <span>Lihat Tugas</span>
              <ClipboardPlus className={styles.buttonIcon} />
            </Link>
            {/* <Link
              className="button button--thirdary button--lg"
              to="https://github.com/DBMS-FATISDA-UNS/DBMS-2025"
            >
              Repo GitHub
            </Link> */}
          </div>
        </div>
      </div>
    </header>
  );
}

export default function Home(): ReactNode {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`Welcome | ${siteConfig.title}`}
      description="Praktikum Database Management System | FATISDA UNS"
    >
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
