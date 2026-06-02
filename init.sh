#!/bin/bash
# init.sh — 环境初始化与健康检查
set -euo pipefail

echo "🔍 检查依赖..."

# Python
if ! command -v python3 &>/dev/null; then
    echo "❌ python3 not found"
    exit 1
fi

# pip
if ! command -v pip3 &>/dev/null; then
    echo "⚠️  pip3 not found, trying pip..."
    python3 -m pip --version &>/dev/null || {
        echo "❌ pip not available"
        exit 1
    }
fi

# Git hooks
if [ -d .git/hooks ]; then
    echo "🔗 安装 pre-commit hook..."
    cp init.sh .git/hooks/post-checkout 2>/dev/null || true
fi

echo "✅ 环境健康"
