# SCUTHPCSkill — 华南理工 HPC（Slurm）使用技能

一份可被多种代码 Agent 复用的「在华南理工科学计算平台 hpckapok2 集群上跑任务」实战技能：
作业提交与依赖链、线程/资源预算、存储配额与清理、容器/代理/HF 镜像、排障速查表、提交前检查清单，附 sbatch 模板。

技能正文：[`skills/scut-hpc/SKILL.md`](skills/scut-hpc/SKILL.md) · 模板：[`skills/scut-hpc/templates/`](skills/scut-hpc/templates/)
（SKILL.md 采用通用的 Agent Skills 格式：YAML frontmatter `name`/`description` + Markdown 正文，任何支持该格式的 agent 都能直接加载。）

## 各 Agent 怎么用

| Agent | 方式 |
|---|---|
| Claude Code（插件） | `/plugin marketplace add IRAgentLab/SCUTHPCSkill` → `/plugin install scut-hpc@scut-hpc` |
| Claude Code（项目内） | 把 `skills/scut-hpc/` 拷到项目的 `.claude/skills/scut-hpc/`，或 `bash install.sh claude` 装到 `~/.claude/skills/` |
| OpenAI Codex CLI | `bash install.sh codex`（复制到 `~/.codex/skills/scut-hpc/`），或放进项目的技能目录 |
| Cursor | 把 `.cursor/rules/scut-hpc.mdc` 拷到项目的 `.cursor/rules/`，并把本仓库放在项目可见路径下 |
| 任何读 `AGENTS.md` 的 agent（Codex / Jules / Gemini CLI 等） | 把 `AGENTS.md` 的入口段落并入项目的 `AGENTS.md`（或 `GEMINI.md`），让 agent 在 HPC 任务前先读 SKILL.md |
| 人 | 直接读 SKILL.md，`templates/` 里的两个脚本可以照抄 |

## 目录
```
skills/scut-hpc/SKILL.md            技能正文（≈290 行）
skills/scut-hpc/templates/gpu_job.sbatch   GPU 作业骨架：propagate=NONE、代理/镜像、驱动校验、线程预算、看门狗、exit $RC
skills/scut-hpc/templates/cpu_run.sbatch   通用 CPU 包装器：--export=ALL,CMD='...'，透传退出码
AGENTS.md                            通用 agent 入口
.cursor/rules/scut-hpc.mdc           Cursor 规则
.claude-plugin/                      Claude Code 插件/市场元数据
install.sh                           一键复制到 ~/.claude/skills 与 ~/.codex/skills
```

## 贡献
踩到新坑就补进 SKILL.md 的「排障速查表」，并在「官方文档索引」里注明依据；改模板同时更新 SKILL.md 对应小节。
