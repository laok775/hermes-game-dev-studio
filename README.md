# 🎮 Hermes Game Dev Studio

> **Turn Hermes Agent into a full game development studio**

基于 [Donchitos/Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) 的 AI 游戏开发工作室理念，专为 **Hermes Agent** 设计的游戏开发技能包。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Hermes Agent](https://img.shields.io/badge/Hermes-v0.8.0+-blue)](https://github.com/NousResearch/hermes-agent)
[![Game Dev](https://img.shields.io/badge/Game-Dev-orange)](https://github.com/topics/game-development)

---

## 📋 目录

- [灵感来源](#-灵感来源)
- [与原版对比](#-与原版对比)
- [快速开始](#-快速开始)
- [团队架构](#-团队架构)
- [核心工作流](#-核心工作流)
- [项目结构](#-项目结构)
- [使用示例](#-使用示例)
- [贡献指南](#-贡献指南)
- [许可证](#-许可证)

---

## 💡 灵感来源

本项目**核心理念**来自 GitHub 热门项目 [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)，该项目将 Claude Code CLI 转变为完整的游戏开发工作室。

**为什么创建 Hermes 版本？**

| 对比项 | Claude-Code-Game-Studios | Hermes Game Dev Studio |
|--------|-------------------------|------------------------|
| **底层平台** | Claude Code CLI | Hermes Agent |
| **Agent 实现** | 49 个 Markdown 定义文件 | Hermes `delegate_task` 动态调用 |
| **技能系统** | 72 个 Slash Commands | Hermes Skills + Templates |
| ** hooks** | Bash 脚本验证 | Hermes 工具链集成 |
| **部署方式** | 本地 CLI | 支持本地/云端/多平台网关 |

**Hermes 版本的优势：**
- ✅ 更轻量 - 无需维护 49 个 agent 定义文件
- ✅ 更灵活 - 动态调用子代理，按需加载
- ✅ 更易扩展 - 基于 Hermes Skill 系统
- ✅ 多平台支持 - Telegram/飞书/ Discord 等

---

## 🏗️ 团队架构

```
小虾米 (Hermes 总控)
    │
    ├── Tier 2: 产品开发团队 (4 人)
    │   ├── 🎨 游戏设计师 ────→ delegate_task(toolsets=['web','file'])
    │   ├── 💻 全栈工程师 ────→ delegate_task(toolsets=['terminal','file','web'])
    │   ├── 🎭 叙事设计师 ────→ delegate_task(toolsets=['file','web'])
    │   └── 🧪 测试工程师 ────→ delegate_task(toolsets=['terminal','file'])
    │
    └── Tier 3: 质量保障团队 (5 人，开发时强制调用)
        ├── code-reviewer
        ├── security-reviewer
        ├── test-engineer
        ├── debugger
        └── coordinator
```

---

## ⚡ 核心工作流

### **Phase 1: 创意与设计**
```
/brainstorm → 游戏创意头脑风暴
/map-systems → 游戏系统映射
/design-system → 详细系统设计
/create-gdd → 生成游戏设计文档
```

### **Phase 2: 架构与规划**
```
/create-architecture → 技术架构设计
/create-epics → 创建 Epic 故事
/create-stories → 拆解用户故事
/sprint-plan → 制定冲刺计划
```

### **Phase 3: 开发与实现** ⚠️ 强制 QA
```
/dev-story → 开发用户故事
/code-review → 代码审查 (强制)
/security-review → 安全审计 (强制)
/run-tests → 执行测试 (强制)
```

### **Phase 4: 测试与 QA**
```
/qa-plan → 制定 QA 计划
/smoke-check → 冒烟测试
/regression-suite → 回归测试
/balance-check → 数值平衡测试
/perf-profile → 性能分析
```

### **Phase 5: 发布与上线**
```
/release-checklist → 发布检查清单
/launch-checklist → 上线检查清单
/changelog → 生成变更日志
/patch-notes → 生成补丁说明
```

---

## 🚀 快速开始

### **前置条件**

1. **Hermes Agent v0.8.0+**
   ```bash
   # 检查版本
   hermes --version
   ```

2. **游戏引擎** (任选其一)
   - Godot 4.x
   - Unity 2022+
   - Unreal Engine 5

### **安装步骤**

#### **方式 1: 克隆项目**
```bash
git clone https://github.com/YOUR_USERNAME/hermes-game-dev-studio.git
cd hermes-game-dev-studio

# 复制 skill 到 Hermes 技能目录
cp -r skills/game-dev-studio ~/.hermes/skills/game-development/
```

#### **方式 2: 使用 Hermes Skill 系统**
```bash
# 未来支持（待 Hermes Skills Hub 上线）
hermes skill install game-dev-studio
```

### **开始第一个项目**

```bash
# 1. 创建项目目录
mkdir my-game && cd my-game

# 2. 初始化项目结构
hermes run "初始化游戏项目结构"

# 3. 开始创意阶段
hermes run "帮我头脑风暴一个 Roguelike 卡牌游戏创意"
```

---

## 📁 项目结构

```
hermes-game-dev-studio/
├── README.md                         # 本文件
├── LICENSE                           # MIT 许可证
├── docs/                             # 文档
│   ├── ARCHITECTURE.md               # 架构设计
│   ├── WORKFLOW.md                   # 工作流详解
│   ├── TEMPLATES.md                  # 模板说明
│   └── EXAMPLES.md                   # 使用示例
├── skills/
│   └── game-dev-studio/              # Hermes Skill
│       ├── SKILL.md                  # Skill 主文档
│       ├── templates/                # 文档模板
│       │   ├── GDD_Template.md
│       │   ├── Story_Template.md
│       │   ├── Code_Review_Template.md
│       │   ├── Test_Plan_Template.md
│       │   ├── Release_Checklist.md
│       │   └── Bug_Report_Template.md
│       └── scripts/                  # 辅助脚本
│           ├── init_project.sh
│           └── validate_hooks.sh
├── examples/                         # 示例项目
│   ├── roguelike-card-game/          # Roguelike 卡牌游戏示例
│   └── platformer-2d/                # 2D 平台跳跃示例
└── scripts/                          # 工具脚本
    ├── install.sh                    # 安装脚本
    └── update.sh                     # 更新脚本
```

---

## 📝 使用示例

### **示例 1: 头脑风暴游戏创意**

**主人输入：**
```
米米，我想做一个 Roguelike 卡牌游戏，帮我头脑风暴一下
```

**米米执行：**
```python
# 调用游戏设计师 Agent
delegate_task(
    goal="进行 Roguelike 卡牌游戏创意头脑风暴",
    toolsets=['web', 'file'],
    context="""
    游戏类型：Roguelike + 卡牌构建
    参考游戏：Slay the Spire, Dream Quest, Monster Train
    
    输出要求：
    1. 核心玩法循环
    2. 独特卖点 (至少 3 个)
    3. 目标受众分析
    4. 竞品差异化策略
    """
)
```

### **示例 2: 生成 GDD 文档**

**主人输入：**
```
创意不错，生成完整的 GDD 文档
```

**米米执行：**
```python
# 使用 GDD 模板生成文档
write_file(
    path="design/GDD.md",
    content=render_template(
        template="templates/GDD_Template.md",
        variables={
            "game_name": "主人确认的游戏名称",
            "core_loop": "米米生成的核心循环",
            "systems": "米米设计的游戏系统",
            # ... 其他字段
        }
    )
)
```

### **示例 3: 开发功能（强制 QA）**

**主人输入：**
```
开始实现卡牌抽取系统
```

**米米执行：**
```python
# 1. 全栈工程师开发
dev_result = delegate_task(
    goal="实现卡牌抽取系统",
    toolsets=['terminal', 'file'],
    context="使用 Godot 4 实现卡牌抽取逻辑"
)

# 2. 强制质量保障（5 个 QA Agent）
code_review = delegate_task(goal="代码审查", ...)
security_review = delegate_task(goal="安全审计", ...)
test_engineer = delegate_task(goal="生成测试", ...)
debugger = delegate_task(goal="问题诊断", ...)
coordinator = delegate_task(goal="进度协调", ...)

# 3. 全部通过后才能交付
if all([code_review.passed, security_review.passed, test_engineer.passed]):
    print("✅ 代码通过质量审查，可以交付")
else:
    print("❌ 质量审查未通过，需要修复")
```

---

## 🛡️ 质量保障规则

### **代码提交前必须通过：**

| 检查项 | 执行 Agent | 通过标准 |
|--------|-----------|----------|
| 代码审查 | code-reviewer | 无 Major/Blocker 问题 |
| 安全审计 | security-reviewer | 无安全漏洞 |
| 单元测试 | test-engineer | 覆盖率 >80% |
| Bug 修复 | debugger | 无已知问题 |

### **发布前必须通过：**

| 检查项 | 负责 Agent | 通过标准 |
|--------|-----------|----------|
| 冒烟测试 | 测试工程师 | 核心功能 100% 可用 |
| 回归测试 | 测试工程师 | 无功能退化 |
| 性能分析 | 性能分析师 | 帧率达标 |
| 平衡性测试 | 游戏设计师 | 数值平衡 |

---

## 🤝 贡献指南

### **如何贡献？**

1. **Fork 本项目**
2. **创建功能分支** (`git checkout -b feature/AmazingFeature`)
3. **提交更改** (`git commit -m 'Add some AmazingFeature'`)
4. **推送到分支** (`git push origin feature/AmazingFeature`)
5. **开启 Pull Request**

### **贡献内容：**

- 🎮 新的游戏类型模板（RPG/FPS/RTS 等）
- 📝 新的文档模板
- 🔧 新的工作流脚本
- 🐛 Bug 修复
- 📚 文档改进

---

## 📄 许可证

本项目采用 **MIT 许可证** - 查看 [LICENSE](LICENSE) 文件了解详情。

---

## 🙏 致谢

- **[Donchitos/Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)** - 本项目核心理念灵感来源
- **[NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)** - Hermes Agent 框架
- **所有贡献者** - 感谢你们的支持！

---

## 📞 联系方式

- **项目 Issues:** [GitHub Issues](https://github.com/YOUR_USERNAME/hermes-game-dev-studio/issues)
- **讨论区:** [GitHub Discussions](https://github.com/YOUR_USERNAME/hermes-game-dev-studio/discussions)

---

*最后更新：2026-04-17*  
*版本：1.0.0*
