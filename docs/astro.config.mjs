// @ts-check
import { defineConfig } from "astro/config";
import catppuccin from "@catppuccin/starlight";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      description: "Documentation for my personal Nix configuration flake.",
      plugins: [
        catppuccin({
          dark: { flavor: "mocha", accent: "blue" },
          light: { flavor: "latte", accent: "blue" },
        }),
      ],
      sidebar: [
        {
          label: "Guides",
          items: [
            // Each item here is one entry in the navigation menu.
            { label: "Example Guide", slug: "guides/example" },
          ],
        },
        {
          label: "Reference",
          autogenerate: { directory: "reference" },
        },
      ],
      social: [
        {
          icon: "github",
          label: "GitHub",
          href: "https://github.com/HeitorAugustoLN/nix-config",
        },
      ],
      title: "Heitor's Nix flake",
    }),
  ],
});
