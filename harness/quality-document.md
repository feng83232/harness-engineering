# Harness Engineering — 质量文档

## 系统概要

AI 作业流程工程质量体系。当前为骨架阶段。

## 当前质量评级

**总体评分: B- (可运行但有大量缺失)**

| 子系统 | 评分 | 备注 |
|--------|------|------|
| 项目骨架 | B+ | AGENTS.md + feature_list + init.sh 完整 |
| 验证管线 | C | 只有 init.sh 基础检查 |
| CI/CD | D | GitHub Actions 配置存在但无实际内容 |
| 评估系统 | C | rubric 初版，尚无自动化 |
| 交接体系 | D | 无 session-handoff.md 模板 |

## 改进路线

1. **立即**：实现 CI pipeline（lint + test）
2. **短程**：harness/validate.sh 自动化验证
3. **中程**：runner.py 一键评分
4. **长程**：错误模式库 + 跨会话交接模板
