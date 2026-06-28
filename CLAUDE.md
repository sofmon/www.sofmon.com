# www.sofmon.com

Static marketing site for Sofmon B.V., served via **GitHub Pages** with a custom
domain (`docs/CNAME` → `www.sofmon.com`).

## Structure

All site files live in `docs/` (GitHub Pages publishes from this folder):

- `index.html` — single-page site (hero, portfolio, contact, footer)
- `main.css` — all styling; design tokens are CSS variables under `:root`
  (seafoam green palette: `--sf-hue-green-*`, `--sf-hue-gray-*`)
- `CNAME`, `favicon.ico`, `icon.png`, `sitemap.xml`, `*.svg` — assets

There is **no build step** — edit the HTML/CSS directly.

## Preview

A dev server is configured in `.claude/launch.json` (Python's built-in HTTP
server, no dependencies). Start it with the Claude Code preview panel, or run:

```sh
python3 -m http.server 4321 --directory docs
```

Then open http://localhost:4321.

## Deploy

GitHub Pages serves the live site from `docs/` on the **master** branch. To
publish changes, merge the working branch into `master` and push.
