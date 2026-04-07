#!/usr/bin/env bash
# Fetch GitHub stats and generate termgraph data files
set -euo pipefail

USERNAME="${1:-YousefHadder}"
DATA_DIR="$(cd "$(dirname "$0")/.." && pwd)/data"
mkdir -p "$DATA_DIR"

YEAR=$(date +%Y)
TODAY=$(date +%Y-%m-%dT23:59:59Z)

echo "Fetching stats for $USERNAME (YTD $YEAR)..."

# --- Activity stats (commits, PRs, reviews, issues, repos) ---
STATS=$(gh api graphql --jq '.data.user.contributionsCollection | {
  commits: .totalCommitContributions,
  prs: .totalPullRequestContributions,
  reviews: .totalPullRequestReviewContributions,
  issues: .totalIssueContributions,
  repos: .totalRepositoryContributions
}' -f query="{
  user(login: \"$USERNAME\") {
    contributionsCollection(from: \"${YEAR}-01-01T00:00:00Z\", to: \"${TODAY}\") {
      totalCommitContributions
      totalPullRequestContributions
      totalPullRequestReviewContributions
      totalIssueContributions
      totalRepositoryContributions
    }
  }
}")

COMMITS=$(echo "$STATS" | jq -r '.commits')
PRS=$(echo "$STATS" | jq -r '.prs')
REVIEWS=$(echo "$STATS" | jq -r '.reviews')
ISSUES=$(echo "$STATS" | jq -r '.issues')
REPOS=$(echo "$STATS" | jq -r '.repos')

cat > "$DATA_DIR/activity.dat" << EOF
💻 Commits,$COMMITS
🔀 PRs,$PRS
🔍 Reviews,$REVIEWS
🐛 Issues,$ISSUES
📦 Repos,$REPOS
EOF

echo "  Activity: $COMMITS commits, $PRS PRs, $REVIEWS reviews, $ISSUES issues"

# --- Top languages across repos (including org) ---
LANGS=$(gh api graphql --jq '
  [.data.user.repositories.nodes[] | select(.primaryLanguage != null) | .primaryLanguage.name] |
  group_by(.) | map({name: .[0], count: length}) | sort_by(-.count) | .[0:7][] |
  "\(.name),\(.count)"
' -f query="{
  user(login: \"$USERNAME\") {
    repositories(first: 100, ownerAffiliations: [OWNER, ORGANIZATION_MEMBER]) {
      nodes {
        primaryLanguage { name }
      }
    }
  }
}")

# Map languages to emojis
echo "$LANGS" | while IFS=',' read -r lang count; do
  case "$lang" in
    Ruby)         echo "💎 Ruby,$count" ;;
    Objective-C)  echo "📱 Obj-C,$count" ;;
    Java)         echo "☕ Java,$count" ;;
    JavaScript)   echo "🌐 JS,$count" ;;
    C)            echo "🔧 C,$count" ;;
    Shell)        echo "🐚 Shell,$count" ;;
    Go)           echo "🐹 Go,$count" ;;
    HTML)         echo "🌍 HTML,$count" ;;
    CSS)          echo "🎨 CSS,$count" ;;
    TypeScript)   echo "🔷 TS,$count" ;;
    Python)       echo "🐍 Py,$count" ;;
    Lua)          echo "🌙 Lua,$count" ;;
    "C#")         echo "🟣 C#,$count" ;;
    *)            echo "📄 $lang,$count" ;;
  esac
done > "$DATA_DIR/languages.dat"

echo "  Languages: $(wc -l < "$DATA_DIR/languages.dat") entries"
echo "Done! Data files written to $DATA_DIR/"
