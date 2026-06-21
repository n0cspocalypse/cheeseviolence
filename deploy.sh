#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────
#  deploy.sh — ship Cheese Violence to the REAL domain (cheeseviolence.com)
#  via Cloudflare Pages, project "cheeseviolence".
#
#  This is the one step that needs YOUR Cloudflare auth — it can't be done
#  unattended. Do ONE of these first:
#     A)  npx wrangler login              # opens a browser, one-time OAuth
#     B)  export CLOUDFLARE_API_TOKEN=…   # a token with Pages:Edit scope
#
#  Then just run:   ./deploy.sh
# ─────────────────────────────────────────────────────────────────────────
set -euo pipefail
cd "$(dirname "$0")"

PROJECT="cheeseviolence"
BRANCH="${1:-main}"          # CF Pages production branch (default: main)
APEX="https://cheeseviolence.com/"

echo "▸ Building static site for ${APEX} …"
hugo --gc --minify --baseURL "$APEX"

echo "▸ Deploying ./public to Cloudflare Pages project '${PROJECT}' (branch: ${BRANCH}) …"
npx --yes wrangler@4 pages deploy public \
  --project-name="$PROJECT" \
  --branch="$BRANCH" \
  --commit-dirty=true

cat <<'DONE'

▸ Done. If wrangler said "Deployment complete" with a cheeseviolence.com URL,
  it's live on the apex. If it landed as a *preview* (a random *.pages.dev),
  your project's PRODUCTION branch isn't "main" — re-run with the right one:
      ./deploy.sh <production-branch>
  (find it in CF dashboard → Workers & Pages → cheeseviolence → Settings → Builds).

  Rollback is always available: CF dashboard → cheeseviolence → Deployments →
  pick the previous (storefront) deployment → "Rollback to this deployment".
DONE
