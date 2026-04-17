# Hermes Game Dev Studio - 工作流详解

**版本：** 1.0.0  
**最后更新：** 2026-04-17  

---

## 📋 目录

1. [Phase 1: 创意与设计](#phase-1-创意与设计)
2. [Phase 2: 架构与规划](#phase-2-架构与规划)
3. [Phase 3: 开发与实现](#phase-3-开发与实现)
4. [Phase 4: 测试与 QA](#phase-4-测试与-qa)
5. [Phase 5: 发布与上线](#phase-5-发布与上线)

---

## Phase 1: 创意与设计

### 目标
- 确定游戏核心概念
- 完成游戏设计文档 (GDD)
- 获得主人确认

### 任务列表

| 任务 | 负责 Agent | 输出物 | 预计时长 |
|------|-----------|--------|----------|
| 头脑风暴 | 游戏设计师 | 创意列表 | 1-2 小时 |
| 系统映射 | 游戏设计师 | 系统架构图 | 2-4 小时 |
| 详细设计 | 游戏设计师 | 系统设计文档 | 4-8 小时 |
| GDD 编写 | 游戏设计师 | GDD.md | 8-16 小时 |

### 工作流

```
主人提出想法
     │
     ▼
┌─────────────────┐
│   头脑风暴      │
│ (brainstorm)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   系统映射      │
│ (map-systems)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   详细设计      │
│(design-system) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   GDD 编写      │
│ (create-gdd)   │
└────────┬────────┘
         │
         ▼
    主人确认 ✅
```

### 输出物模板

- [GDD_Template.md](../skills/game-dev-studio/templates/GDD_Template.md)

---

## Phase 2: 架构与规划

### 目标
- 完成技术架构设计
- 拆解为可执行任务
- 制定开发计划

### 任务列表

| 任务 | 负责 Agent | 输出物 | 预计时长 |
|------|-----------|--------|----------|
| 架构设计 | 全栈工程师 | architecture.md | 4-8 小时 |
| Epic 创建 | 游戏设计师 | epics.md | 2-4 小时 |
| Story 拆解 | 全栈工程师 | stories.md | 4-8 小时 |
| Sprint 计划 | 全栈工程师 | sprint-plan.md | 2-4 小时 |

### 工作流

```
GDD 确认
     │
     ▼
┌─────────────────┐
│   架构设计      │
│(architecture)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Epic 创建      │
│ (create-epics) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Story 拆解     │
│(create-stories)│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Sprint 计划    │
│ (sprint-plan)  │
└────────┬────────┘
         │
         ▼
    主人确认 ✅
```

### 输出物模板

- [Story_Template.md](../skills/game-dev-studio/templates/Story_Template.md)

---

## Phase 3: 开发与实现

### 目标
- 实现功能
- 通过质量审查
- 完成迭代

### 任务列表

| 任务 | 负责 Agent | 输出物 | 预计时长 |
|------|-----------|--------|----------|
| 功能开发 | 全栈工程师 | 代码 | 变 |
| 代码审查 | code-reviewer | review 报告 | 1-2 小时 |
| 安全审计 | security-reviewer | security 报告 | 1-2 小时 |
| 测试生成 | test-engineer | 测试用例 | 2-4 小时 |
| Bug 修复 | debugger | 修复报告 | 变 |

### ⚠️ 强制质量保障

**开发完成后必须通过以下检查：**

```python
# 伪代码示例
def deliver_code(code):
    # 1. 代码审查
    review = code_reviewer.review(code)
    if not review.passed:
        return "❌ 代码审查未通过"
    
    # 2. 安全审计
    security = security_reviewer.audit(code)
    if not security.passed:
        return "❌ 安全审计未通过"
    
    # 3. 测试生成
    tests = test_engineer.generate_tests(code)
    if not tests.passed:
        return "❌ 测试未通过"
    
    # 4. Bug 诊断
    bugs = debugger.diagnose(code)
    if bugs.found:
        return "❌ 发现 Bug"
    
    # 5. 进度记录
    coordinator.record_progress()
    
    return "✅ 可以交付"
```

### 工作流

```
Story 确认
     │
     ▼
┌─────────────────┐
│   功能开发      │
│  (dev-story)   │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│        质量保障流程 (强制)        │
│  ┌─────────┐ ┌───────────────┐  │
│  │代码审查  │ │  安全审计     │  │
│  └────┬────┘ └───────┬───────┘  │
│       │              │          │
│       ▼              ▼          │
│  ┌─────────┐ ┌───────────────┐  │
│  │测试生成  │ │  Bug 诊断     │  │
│  └────┬────┘ └───────┬───────┘  │
│       │              │          │
│       ▼              ▼          │
│       └──────┬───────┘          │
│              │                  │
│              ▼                  │
│        全部通过？                │
│         /    \                  │
│       是      否                │
│       │       │                 │
│       ▼       ▼                 │
│   ✅交付   ❌返回修复            │
└─────────────────────────────────┘
         │
         ▼
    主人确认 ✅
```

### 输出物模板

- [Code_Review_Template.md](../skills/game-dev-studio/templates/Code_Review_Template.md)
- [Bug_Report_Template.md](../skills/game-dev-studio/templates/Bug_Report_Template.md)

---

## Phase 4: 测试与 QA

### 目标
- 确保功能正常
- 无回归问题
- 性能达标

### 任务列表

| 任务 | 负责 Agent | 输出物 | 预计时长 |
|------|-----------|--------|----------|
| QA 计划 | 测试工程师 | test-plan.md | 2-4 小时 |
| 冒烟测试 | 测试工程师 | smoke-report.md | 1-2 小时 |
| 回归测试 | 测试工程师 | regression-report.md | 4-8 小时 |
| 性能分析 | 性能分析师 | perf-report.md | 2-4 小时 |
| 平衡测试 | 游戏设计师 | balance-report.md | 2-4 小时 |

### 工作流

```
开发完成
     │
     ▼
┌─────────────────┐
│    QA 计划      │
│  (qa-plan)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   冒烟测试      │
│(smoke-check)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   回归测试      │
│(regression)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   性能分析      │
│(perf-profile) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   平衡测试      │
│(balance-check)│
└────────┬────────┘
         │
         ▼
    主人确认 ✅
```

### 输出物模板

- [Test_Plan_Template.md](../skills/game-dev-studio/templates/Test_Plan_Template.md)

---

## Phase 5: 发布与上线

### 目标
- 完成发布准备
- 上线发布
- 监控反馈

### 任务列表

| 任务 | 负责 Agent | 输出物 | 预计时长 |
|------|-----------|--------|----------|
| 发布检查 | 测试工程师 | release-checklist.md | 2-4 小时 |
| 上线检查 | 全栈工程师 | launch-checklist.md | 2-4 小时 |
| 变更日志 | 全栈工程师 | CHANGELOG.md | 1-2 小时 |
| 补丁说明 | 叙事设计师 | patch-notes.md | 1-2 小时 |

### 工作流

```
测试通过
     │
     ▼
┌─────────────────┐
│  发布检查清单   │
│(release-check)│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  上线检查清单   │
│ (launch-check)│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   变更日志      │
│ (changelog)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   补丁说明      │
│(patch-notes)  │
└────────┬────────┘
         │
         ▼
    主人确认 ✅
         │
         ▼
    🚀 发布！
```

### 输出物模板

- [Release_Checklist.md](../skills/game-dev-studio/templates/Release_Checklist.md)

---

## 📊 工作流状态跟踪

### 状态定义

| 状态 | 说明 |
|------|------|
| `pending` | 等待开始 |
| `in_progress` | 进行中 |
| `blocked` | 被阻塞（等待确认/修复） |
| `completed` | 已完成 |
| `approved` | 已批准 |

### 状态转换

```
pending ──(开始)──> in_progress ──(完成)──> completed
   ▲                    │                       │
   │                    │ (阻塞)                │ (批准)
   │                    ▼                       ▼
   └─────────────── blocked ──(解决)───────── approved
```

---

*文档版本：1.0.0*  
*最后更新：2026-04-17*
