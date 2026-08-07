#!/bin/bash
# 🛡️ Hermes Cybersecurity Lab — Full Ecosystem Cloner
# Clones all referenced repositories with a single command.
#
# Usage:
#   bash scripts/clone-all.sh              # clone everything
#   bash scripts/clone-all.sh --subset     # clone only large skill repos
#   bash scripts/clone-all.sh --list       # show what would be cloned (dry-run)
#
# All repos go into ./external/ by default. Set CLONE_DIR to override.
set -euo pipefail

CLONE_DIR="${CLONE_DIR:-$(dirname "$0")/../external}"

# ── Repository Catalogue ──────────────────────────────────────────
# Format: "url|label|skills_count|category"
# skills_count = approximate count for display; "curated" for lists
declare -a REPOS=(
    "https://github.com/handnewb/hermes-cybersec-lab|hermes-cybersec-lab|247|core"
    "https://github.com/mukul975/Anthropic-Cybersecurity-Skills|Anthropic-Cybersecurity-Skills|817|skills"
    "https://github.com/0xarkstar/awesome-hermes-agent|awesome-hermes-agent-arkstar|700+|skills"
    "https://github.com/ZeroPointRepo/awesome-hermes-skills|awesome-hermes-skills|101+|skills"
    "https://github.com/Strategic-Automation/violin|violin|31|playbooks"
    "https://github.com/gmh5225/awesome-ai-security|awesome-ai-security|31|playbooks"
    "https://github.com/0xNyk/awesome-hermes-agent|awesome-hermes-agent-nyk|curated|reference"
    "https://github.com/frankxai/awesome-hermes-agent-skills|awesome-hermes-agent-skills|curated|reference"
)

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

list_repos() {
    printf "${BOLD}%5s  %-45s  %10s  %s${NC}\n" "#" "Repository" "Skills" "Category"
    echo "─────  ────────────────────────────────────────────  ──────────  ─────────"
    local i=0
    for entry in "${REPOS[@]}"; do
        local url label count cat _rest
        url="${entry%%|*}"; _rest="${entry#*|}"
        label="${_rest%%|*}"; _rest="${_rest#*|}"
        count="${_rest%%|*}"; cat="${_rest#*|}"
        ((i++)) || true
        printf "%5d  %-45s  %10s  %s\n" "$i" "$label" "$count" "$cat"
    done
    echo ""
}

clone_all() {
    local subset="${1:-false}"
    mkdir -p "$CLONE_DIR"
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║  🛡️  Hermes Cybersecurity Lab — Ecosystem Cloner       ║"
    echo "║  Target: $CLONE_DIR"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo ""

    local cloned=0 skipped=0 failed=0
    for entry in "${REPOS[@]}"; do
        local url label count cat _rest
        url="${entry%%|*}"; _rest="${entry#*|}"
        label="${_rest%%|*}"; _rest="${_rest#*|}"
        count="${_rest%%|*}"; cat="${_rest#*|}"

        # Skip core repo (we're inside it)
        if [ "$label" = "hermes-cybersec-lab" ]; then
            echo -e " ${GREEN}●${NC} $label ${CYAN}(this repo)${NC}"
            ((skipped++)) || true
            continue
        fi

        # Subset mode: only large skill repos
        if [ "$subset" = "true" ] && [ "$cat" = "reference" ]; then
            echo -e " ${CYAN}○${NC} $label ${CYAN}(skipped — reference only, use full mode)${NC}"
            ((skipped++)) || true
            continue
        fi

        local target="$CLONE_DIR/$label"
        if [ -d "$target/.git" ]; then
            echo -e " ${GREEN}●${NC} $label ${CYAN}(exists)${NC}"
            ((skipped++)) || true
        else
            echo -e " ${CYAN}↓${NC} $label ${CYAN}[$count skills]${NC} ..."
            if git clone --depth 1 "$url" "$target" 2>/dev/null; then
                echo -e "   ${GREEN}✔ cloned${NC} $label"
                ((cloned++)) || true
            else
                echo -e "   ${RED}✘ failed${NC} $label — repo may be private or renamed"
                ((failed++)) || true
            fi
        fi
    done

    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    printf "║   ${GREEN}✔ %d cloned${NC}  ${CYAN}○ %d skipped${NC}" "$cloned" "$skipped"
    if [ "$failed" -gt 0 ]; then
        printf "  ${RED}✘ %d failed${NC}" "$failed"
    fi
    echo "        ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo ""
    echo "  📂 All repos:     $CLONE_DIR/"
    echo "  🔧 Install tools: bash scripts/install.sh"
    echo ""
    echo "  Total ecosystem: 1,927 skills | 131+ tools | 23 frameworks"
    echo ""

    if [ "$failed" -gt 0 ]; then
        echo "  ⚠️  Some repos failed. Check the list above — they may be private or renamed."
        echo ""
    fi
}

# ── Entrypoint ────────────────────────────────────────────────────
case "${1:-}" in
    --list|-l)
        list_repos
        ;;
    --subset|-s)
        clone_all true
        ;;
    --help|-h)
        echo "Usage: bash scripts/clone-all.sh [--subset|--list|--help]"
        echo ""
        echo "  (no flag)   Clone all 8 repositories (~1,927 skills total)"
        echo "  --subset    Clone only large skill repos (skip reference-only lists)"
        echo "  --list      Dry-run: show what would be cloned"
        echo "  --help      This message"
        ;;
    *)
        clone_all false
        ;;
esac
