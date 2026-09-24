#!/usr/bin/env bash
# 把 scut-hpc 技能装进各家 code agent 的技能目录（复制，不是软链，避免相对路径问题）。
# 用法：bash install.sh [claude|codex|all]   默认 all
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SRC="$HERE/skills/scut-hpc"
target="${1:-all}"
install_to() { mkdir -p "$1"; rm -rf "$1/scut-hpc"; cp -R "$SRC" "$1/scut-hpc"; echo "installed -> $1/scut-hpc"; }
case "$target" in
  claude) install_to "$HOME/.claude/skills" ;;
  codex)  install_to "$HOME/.codex/skills" ;;
  all)    install_to "$HOME/.claude/skills"; install_to "$HOME/.codex/skills" ;;
  *) echo "usage: $0 [claude|codex|all]"; exit 2 ;;
esac
echo "Cursor：把本仓库的 .cursor/rules/scut-hpc.mdc 拷到你项目的 .cursor/rules/；其它读 AGENTS.md 的 agent：把 AGENTS.md 里的入口段落并入你项目的 AGENTS.md。"
