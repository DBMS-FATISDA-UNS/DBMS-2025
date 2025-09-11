import type { ReactNode } from "react";
import clsx from "clsx";
import Heading from "@theme/Heading";
import styles from "./styles.module.css";
import Link from "@docusaurus/Link";

type FeatureItem = {
  title: string;
  description: ReactNode;
  cta?: { label: string; to: string };
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
    cta: { label: "Buka Silabus", to: "https://www.sqlservertutorial.net" },
  },
  {
    title: "Google Classroom",
    description: (
      <>
        Platform utama untuk pengumuman, pengumpulan tugas, dan interaksi kelas
        yang mendukung diskusi antar mahasiswa.
      </>
    ),
    cta: {
      label: "Lihat Classroom",
      to: "https://classroom.google.com/c/ODA1NDg0NTM3OTQ4",
    },
  },
  {
    title: "Video Tutorial",
    description: <>
        Rangkaian video pembelajaran yang memandu langkah demi langkah dalam
        memahami konsep dan praktik database.
    </>,
    cta: {
      label: "Lihat Video",
      to: "https://www.youtube.com/watch?v=xYBclb-sYQ4&t=725s",
    },
  },
  {
    title: "Playground SQL",
    description: (
      <>
        Lingkungan interaktif untuk bereksperimen dengan kode SQL secara langsung
        tanpa perlu instalasi.
      </>
    ),
    cta: { label: "Hubungi / FAQ", to: "/playground/" },
  },
];

function Feature({ title, description, cta }: FeatureItem) {
  return (
    <div className={clsx("col col--6", styles.cardCol)}>
      <div className={clsx("card shadow--md", styles.card)}>
        <div className="card__header">
          <Heading as="h3">{title}</Heading>
        </div>
        <div className="card__body">
          <p>{description}</p>
        </div>
        {cta && (
          <div className="card__footer">
            <Link className="button button--primary button--sm" to={cta.to}>
              {cta.label}
            </Link>
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
