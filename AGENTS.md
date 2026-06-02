# harness-engineering

## 开工流程

1. 确认当前目录
2. 读取 `feature_list.json`，选未完成功能
3. 运行 `./init.sh` 确认环境健康
4. 每个功能完成后更新 `progress.md`

## 工作规则

- 一次只做一个功能
- 验证是必须的
- 不要越界修改无关文件
- 留下干净状态

## 验证管线

```bash
./init.sh
```
