# Hermes Game Dev Studio - 架构设计

**版本：** 1.0.0  
**最后更新：** 2026-04-17  

---

## 📋 目录

1. [系统架构](#1-系统架构)
2. [Agent 设计](#2-agent-设计)
3. [工作流引擎](#3-工作流引擎)
4. [质量保障体系](#4-质量保障体系)
5. [扩展性设计](#5-扩展性设计)

---

## 1. 系统架构

### 1.1 整体架构

```
┌─────────────────────────────────────────────────────────┐
│                    主人 (Human)                          │
│                   Telegram/飞书/Discord                   │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│              Hermes Agent (总控 - 小虾米)                  │
│  - 接收主人指令                                          │
│  - 协调各专业 Agent                                       │
│  - 质量保障流程监督                                       │
│  - 进度汇报                                              │
└────────────────────┬────────────────────────────────────┘
                     │
         ┌───────────┼───────────┐
         │           │           │
         ▼           ▼           ▼
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│  游戏设计师  │ │  全栈工程师  │ │  叙事设计师  │
│  (web,file) │ │(terminal,   │ │  (file,web) │
│             │ │   file,web) │ │             │
└─────────────┘ └─────────────┘ └─────────────┘
         │           │           │
         └───────────┼───────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│              质量保障团队 (5 人，开发时强制调用)              │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐             │
│  │code-      │ │security-  │ │test-      │             │
│  │reviewer   │ │reviewer   │ │engineer   │             │
│  └───────────┘ └───────────┘ └───────────┘             │
│  ┌───────────┐ ┌───────────┐                           │
│  │debugger   │ │coordinator│                           │
│  └───────────┘ └───────────┘                           │
└─────────────────────────────────────────────────────────┘
```

### 1.2 技术栈

| 层级 | 技术/工具 |
|------|----------|
| **交互层** | Telegram Bot / 飞书 / Discord |
| **Agent 层** | Hermes Agent + delegate_task |
| **技能层** | Hermes Skills 系统 |
| **工具层** | terminal / file / web / search |
| **引擎层** | Godot 4 / Unity / Unreal Engine 5 |

---

## 2. Agent 设计

### 2.1 Agent 定义

每个 Agent 通过 `delegate_task` 动态创建，定义包含：

```yaml
Agent: 游戏设计师
职责：
  - 游戏机制设计
  - 关卡设计
  - 数值平衡
  - GDD 文档编写
工具集：
  - web: 搜索竞品、参考设计
  - file: 读写设计文档
上下文：
  - 游戏类型
  - 目标受众
  - 平台限制
```

### 2.2 Agent 调用模式

```python
# 模式 1: 单次调用
result = delegate_task(
    goal="设计战斗系统",
    toolsets=['web', 'file'],
    context="Roguelike 卡牌游戏，参考 Slay the Spire"
)

# 模式 2: 并行调用（多个 Agent 同时工作）
results = delegate_task(
    tasks=[
        {"goal": "设计战斗系统", "toolsets": ['web', 'file']},
        {"goal": "设计经济系统", "toolsets": ['web', 'file']},
        {"goal": "设计成长系统", "toolsets": ['web', 'file']}
    ]
)

# 模式 3: 串行调用（有依赖关系）
design = delegate_task(goal="设计系统", ...)
review = delegate_task(goal="审查设计", context=design.result)
```

---

## 3. 工作流引擎

### 3.1 工作流定义

```yaml
Workflow: 游戏开发完整流程
Phases:
  - Phase 1: 创意与设计
    tasks: [brainstorm, map-systems, design-system, create-gdd]
    approval: required
    
  - Phase 2: 架构与规划
    tasks: [create-architecture, create-epics, create-stories, sprint-plan]
    approval: required
    
  - Phase 3: 开发与实现
    tasks: [dev-story, code-review, security-review, run-tests]
    approval: required
    qa_required: true
    
  - Phase 4: 测试与 QA
    tasks: [qa-plan, smoke-check, regression-suite, balance-check]
    approval: required
    
  - Phase 5: 发布与上线
    tasks: [release-checklist, launch-checklist, changelog]
    approval: required
```

### 3.2 状态机

```
[Phase 1] ──(主人确认)──> [Phase 2] ──(主人确认)──> [Phase 3]
     ▲                           │                        │
     │                           ▼                        ▼
     │                    [需要修改]               [QA 未通过]
     │                           │                        │
     └───────────────────────────┴────────────────────────┘
```

---

## 4. 质量保障体系

### 4.1 代码审查流程

```
代码提交
   │
   ▼
┌─────────────────┐
│ code-reviewer   │── 未通过 ──> 返回修复
│ (代码审查)      │
└────────┬────────┘
         │ 通过
         ▼
┌─────────────────┐
│ security-reviewer│── 未通过 ──> 返回修复
│ (安全审计)      │
└────────┬────────┘
         │ 通过
         ▼
┌─────────────────┐
│ test-engineer   │── 未通过 ──> 返回修复
│ (测试生成)      │
└────────┬────────┘
         │ 通过
         ▼
┌─────────────────┐
│ debugger        │── 发现问题 ──> 返回修复
│ (问题诊断)      │
└────────┬────────┘
         │ 通过
         ▼
┌─────────────────┐
│ coordinator     │── 记录进度
│ (进度协调)      │
└────────┬────────┘
         │
         ▼
   ✅ 可以交付
```

### 4.2 质量指标

| 指标 | 目标值 | 测量方式 |
|------|--------|----------|
| 代码审查通过率 | >90% | review 报告 |
| 安全漏洞数 | 0 | security scan |
| 测试覆盖率 | >80% | coverage report |
| Bug 密度 | <1/1000LOC | bug tracking |
| 性能指标 | 60 FPS | profiling |

---

## 5. 扩展性设计

### 5.1 新增游戏类型

```yaml
GameType: RPG
extends: base-game
new_agents:
  - combat-designer
  - quest-designer
  - loot-designer
new_templates:
  - Character_Template.md
  - Quest_Template.md
  - Loot_Table_Template.md
```

### 5.2 新增工作流

```yaml
Workflow: LiveOps 运营流程
tasks:
  - analyze-player-data
  - design-event
  - implement-event
  - test-event
  - deploy-event
  - monitor-event
```

### 5.3 新增引擎支持

```yaml
Engine: Custom Engine
specialist: custom-engine-specialist
tools:
  - custom-cli
  - custom-editor
scripts:
  - build.sh
  - deploy.sh
```

---

## 📎 附录

### A. 与原版对比

| 特性 | Claude-Code-Game-Studios | Hermes Game Dev Studio |
|------|-------------------------|------------------------|
| Agent 定义 | 49 个 Markdown 文件 | 动态 delegate_task |
| 技能系统 | 72 Slash Commands | Hermes Skills |
| Hooks | Bash 脚本 | Hermes 工具链 |
| 部署 | 本地 CLI | 多平台网关 |

### B. 设计原则

1. **轻量化** - 不维护大量静态文件
2. **动态化** - 按需调用 Agent
3. **可扩展** - 基于 Hermes Skill 系统
4. **质量优先** - 强制 QA 流程

---

*文档版本：1.0.0*  
*最后更新：2026-04-17*
