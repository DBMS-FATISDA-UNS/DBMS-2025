import type { ReactNode } from "react";
import clsx from "clsx";
import Heading from "@theme/Heading";
import styles from "./styles.module.css";
import Link from "@docusaurus/Link";

type CTA = { label: string; to: string; variant?: "primary" | "secondary" };
type FeatureItem = {
  title: string;
  description: ReactNode;
  ctas?: CTA[]; // now supports multiple buttons
};

const FeatureList: FeatureItem[] = [
  {
    title: "Sumber Belajar Terstruktur",
    description: (
      <>
        Silabus, materi, dan referensi yang disusun untuk mendukung pembelajaran
        praktikum.
      </>
    ),
    ctas: [{ label: "Buka Silabus", to: "https://www.sqlservertutorial.net" }],
  },
  {
    title: "Google Classroom",
    description: (
      <>
        Platform utama untuk pengumuman, pengumpulan tugas, dan interaksi kelas
        yang mendukung diskusi antar mahasiswa.
      </>
    ),
    ctas: [
      {
        label: "Classroom Kelas A",
        to: "https://classroom.google.com/c/ODA1NDg0NTM3OTQ4",
        variant: "primary",
      },
      {
        label: "Classroom Kelas B",
        to: "https://classroom.google.com/u/0/c/ODA1NTM5NzI3Njc0",
        variant: "primary",
      },
      {
        label: "Classroom PSDKU",
        to: "https://classroom.google.com/u/0/c/ODA1NTQyNDUyNzA0",
        variant: "primary",
      },
    ],
  },
  {
    title: "Video Tutorial",
    description: (
      <>
        Rangkaian video pembelajaran yang memandu langkah demi langkah dalam
        memahami konsep dan praktik database.
      </>
    ),
    ctas: [
      {
        label: "Lihat Video",
        to: "https://www.youtube.com/watch?v=xYBclb-sYQ4&t=725s",
      },
    ],
  },
  {
    title: "Playground",
    description: (
      <>
        Platform interaktif kalau kamu gabut dan gaada kerjaan bisa banget coba
        dan di ubah&quot; 😃
      </>
    ),
    ctas: [{ label: "Playground", to: "/playground/" }],
  },
];

function Feature({ title, description, ctas }: FeatureItem) {
  return (
    <div className={clsx("col col--6", styles.cardCol)}>
      <div className={clsx("card shadow--md", styles.card)}>
        <div className="card__header">
          <Heading as="h3">{title}</Heading>
        </div>
        <div className="card__body">
          <p>{description}</p>
        </div>

        {ctas && ctas.length > 0 && (
          <div
            className="card__footer"
            style={{ display: "flex", gap: "0.75rem", flexWrap: "wrap" }}
          >
            {ctas.map((cta, i) => (
              <Link
                key={i}
                className={clsx(
                  "button button--sm",
                  cta.variant === "secondary"
                    ? "button--secondary"
                    : "button--primary"
                )}
                to={cta.to}
                target={cta.to.startsWith("http") ? "_blank" : undefined}
                rel={
                  cta.to.startsWith("http") ? "noopener noreferrer" : undefined
                }
              >
                {cta.label}
              </Link>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
