# CHEESE VIOLENCE — personal dispatch

A personal blog for **N0CS**, built as a numbered zine from the Cheese Violence
universe. Field notes on security, the homelab, brewing, the decks, and learning —
under the banner of a cheese-slinging anime mercenary. One run. No restock.

> **Vol. 002.** The merch drop was Vol. 001. This blog is the next volume.

Static site, **Hugo** + a hand-built theme (no third-party theme, no JS framework).
Deploys two places:

| Target | URL | How |
|---|---|---|
| **Live preview** | `https://n0cspocalypse.github.io/cheeseviolence/` | auto, on every `git push` (GitHub Actions) |
| **The real domain** | `https://cheeseviolence.com` | manual one-liner — `./deploy.sh` (needs your Cloudflare login) |

---

## Ship it to cheeseviolence.com (the cutover)

The domain is a **Cloudflare Pages** project named `cheeseviolence`, already bound to
the apex. Replacing the old storefront with this blog is one command — but it needs
**your** Cloudflare auth (an AI session can't do the browser OAuth). Pick one:

```bash
npx wrangler login                 # A) one-time browser OAuth, or
export CLOUDFLARE_API_TOKEN=…      # B) a token with the Pages:Edit permission
```

then:

```bash
./deploy.sh
```

The old storefront is **not lost** — Cloudflare keeps every past deployment. Roll back
anytime: CF dashboard → Workers & Pages → `cheeseviolence` → Deployments → pick the
previous one → *Rollback*. (Local backups also live in
`~/Desktop/cheeseviolence-rollback-2026-06-21/` and `~/_archive_2026-04-17/cheeseviolence/`.)

**Even better, permanent fix:** in the CF dashboard, connect this GitHub repo to the
`cheeseviolence` Pages project (Settings → Builds → Connect to Git, build command
`hugo --gc --minify`, output `public`). After that, every `git push` auto-deploys to
the real domain and you never touch wrangler again.

---

## Add a dispatch (this is what you'll do with your photos + excerpts)

```bash
hugo new dispatch/my-new-post.md      # creates a draft from the template
```

Edit the file. Front matter cheat-sheet:

```toml
+++
title = "Your headline"
date = 2026-06-21                      # date only — see the gotcha below
dispatch_no = "No 07"
dek = "One-sentence standfirst."
categories = ["BREWING"]               # ONE of: SECURITY HOMELAB BREWING DECKS "FIELD NOTES"
tags = ["yeast", "control-loops"]
draft = false                          # flip to false to publish
# image = "img/my-photo.jpg"           # optional hero — drop the file in static/img/
# imageAlt = "describe the photo"
# imageCaption = "FIG.007 — caption in the machine voice"
+++

Write in Markdown. ## headers, > pull-quotes, lists — the theme styles them all.
```

**Photos:** drop image files into `static/img/`, then reference them in a post's
`image = "img/whatever.jpg"` (hero) or inline with `![alt](/img/whatever.jpg)`.
Keep them web-sized (≤ ~1600px wide). The two mascot images live there already.

⚠️ **Date gotcha:** Hugo will NOT publish a post dated in the future. If a new post
"won't show up," it's almost always because its `date` is later than right now. Use a
date that's already passed (date-only `YYYY-MM-DD` = midnight, always safe).

Preview locally:

```bash
hugo server -D          # -D shows drafts; open http://localhost:1313
```

---

## Design language (the colophon, for future-you)

- **Palette:** brand gold `#C9A84C` (structure/links) + blood red `#D4001A` ("violence"/
  emphasis) on a near-black void `#0B0B0C`, warm bone text `#ECE7DA`.
- **Type:** Bebas Neue (masthead/headlines) · Inter (body) · Space Mono (the machine voice).
- **Signature motif:** the Swiss-cheese hole — a punched circle that reads as cheese
  *and* bullet hole. It's the dividers, the list bullets, the hover markers.
- **Rules:** hard edges (zero border-radius), no shadows, brutalist editorial. The
  whole thing degrades gracefully — works with JS off, respects reduced-motion, prints clean.

Everything lives in:

```
hugo.toml                 site config + nav + brand params
content/dispatch/*.md     the posts
content/about.md          who's holding the cheese
content/colophon.md       how it's built
layouts/                  the hand-built theme (baseof, index, single, list, page, partials)
static/css/main.css       the entire design system
static/js/cv.js           progressive-enhancement scroll reveals (optional)
static/img/               mascot + your photos
deploy.sh                 cutover to cheeseviolence.com
```

Built by N0CS with an AI co-conspirator. 限定 — San Francisco / Los Angeles / Nowhere.
