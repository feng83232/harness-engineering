#!/bin/bash
# validate.sh — 4 阶段验证管线
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

PASS=0
FAIL=0

check() {
    local name="$1"
    shift
    echo -n "🧪 $name... "
    if "$@" 2>/dev/null; then
        echo "✅"
        PASS=$((PASS + 1))
    else
        echo "❌"
        FAIL=$((FAIL + 1))
    fi
}

echo "=== Harness Engineering 验证管线 ==="

# Phase 1: 文件完整性
check "核心文件存在" test -f README.md
check "AGENTS.md存在" test -f AGENTS.md
check "init.sh可执行" test -x init.sh
check "harness目录存在" test -d harness
check "feature_list存在" test -f feature_list.json

# Phase 2: Shell 检查
if command -v shellcheck &>/dev/null; then
    check "init.sh shellcheck" shellcheck init.sh
fi

# Phase 3: JSON 检查
if command -v python3 &>/dev/null; then
    check "feature_list JSON格式" python3 -c "import json; json.load(open('feature_list.json'))"
fi

# Summary
echo ""
echo "=== 结果: $PASS 通过 / $FAIL 失败 / $((PASS + FAIL)) 总项 ==="
exit $FAIL
