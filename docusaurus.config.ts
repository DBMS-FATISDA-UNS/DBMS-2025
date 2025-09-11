import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: "Praktikum Database Management System",
  tagline: "Odd Semester 2025/2026",
  favicon: "img/logo.png",

  // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
  future: {
    v4: true, // Improve compatibility with the upcoming Docusaurus v4
  },

  // Set the production url of your site here
  url: "https://dbms-fatisda-uns.github.io",
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: "/DBMS-2025/",

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: "DBMS-FATISDA-UNS", // Usually your GitHub org/user name.
  projectName: "DBMS-2025", // Usually your repo name.

  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      {
        docs: {
          sidebarPath: "./sidebars.ts",
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          // editUrl:
          //   "https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/",
        },
        blog: false,
        theme: {
          customCss: "./src/css/custom.css",
        },
        pages: {
          path: "src/pages",
          routeBasePath: "/",
          include: ["**/*.{js,jsx,ts,tsx,md,mdx}"],
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      "@docusaurus/plugin-content-docs",
      {
        id: "assignments",
        path: "assignments", // folder sumber konten
        routeBasePath: "assignments", // URL -> /assignments/
        sidebarPath: "./sidebarsAssignments.ts",
      },
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: "img/logo.png",
    navbar: {
      hideOnScroll: true,
      title: "DBMS 25/26",
      logo: {
        alt: "UNS Logo",
        src: "img/logo.png",
      },
      items: [
        {
          type: "docSidebar",
          sidebarId: "tutorialSidebar",
          position: "left",
          label: "Tutorial",
        },
        {
          type: "docSidebar",
          sidebarId: "assignmentsSidebar",
          docsPluginId: "assignments",
          label: "Tugas",
          position: "left",
        },
        {
          href: "https://github.com/DBMS-FATISDA-UNS/DBMS-2025",
          label: "GitHub",
          position: "right",
        },
        {
          type: "localeDropdown",
          position: "right",
        },
      ],
    },
    footer: {
      style: "dark",
      links: [
        {
          title: "More",
          items: [
            {
              label: "Assignments",
              to: "/assignments/",
            },
            {
              href: "https://github.com/DBMS-FATISDA-UNS/DBMS-2025",
              label: "GitHub",
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} DBMS FATISDA UNS.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
