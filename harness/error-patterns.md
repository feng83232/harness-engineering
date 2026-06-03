# 错误模式库

常见错误与解决模式的记录。每次修复后再现的问题记录到此。

## 模式 001：Gateway 端口失败

**症状**：Gateway 启动后 health check 失败。
**原因**：端口号写错（8787 → 9888）或端口被占用。
**修复**：先 `lsof -i :<PORT>` 检查端口，再 `hermes gateway restart`。
**预防**：启动脚本先 `fuser -k <PORT>/tcp` 清理。

## 模式 002：飞书 bot 静默

**症状**：Bot 看起来健康但群消息无响应。
**原因**：
1. Gateway routes 行为变化（beta.1）
2. .env 配置文件权限不足（需 600）
3. bot 不在群中
**修复**：检查 health → 检查群成员 → 检查 routes。
**预防**：Watchdog 每 2 分钟检查一次 bot 回复。

## 模式 003：Langfuse trace 缺失

**症状**：插件已启用但 Langfuse 无数据。
**原因**：
1. 环境变量必须用 `HERMES_LANGFUSE_*` 前缀
2. `langfuse` SDK 未安装在 Hermes venv 下
3. Gateway 进程启动后 env 变更需重启
**修复**：验证 SDK 安装 → 验证 env 前缀 → 重启 Gateway。
**预防**：启动前打印 env 变量检查。

## 模式 004：跨会话状态丢失

**症状**：新会话不知道上次做了什么。
**原因**：`feature_list.json` 或 `progress.md` 未更新。
**修复**：读取这两个文件恢复状态。
**预防**：结束会话前必须更新这两个文件（写入 AGENTS.md）。
