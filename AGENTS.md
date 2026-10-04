# 给任何代码 Agent 的入口

本仓库是一份「在华南理工科学计算平台（hpckapok2 集群，Slurm）上跑任务」的实战技能。
凡是涉及在该集群上提交作业、写 sbatch、串依赖链、排查作业失败、清理存储、配置容器/代理/HF 镜像的任务，
**先完整阅读 `skills/scut-hpc/SKILL.md`**，按其中的规则和检查清单操作；sbatch 模板在 `skills/scut-hpc/templates/`。

硬性规则摘要（详见 SKILL.md）：
1. 登录节点只做轻量操作，重计算一律 sbatch。
2. 每个 sbatch 必须 `#SBATCH --propagate=NONE`，且所有 `#SBATCH` 在第一条命令之前。
3. 线程数按申请核数派生，不按节点 64 核开；Isaac Sim 的 Kit 线程池 ≥ 8。
4. 流水线用 `--dependency` 串联，脚本末尾 `exit $RC` 透传退出码。
5. 删除类操作先 dry-run；训练进行中不要删 HF datasets 缓存。
6. 提交 GPU 作业前用 `skills/scut-hpc/scripts/free_gpus.py` 看单机可立即提交的卡数，优先选不排队的规格。
