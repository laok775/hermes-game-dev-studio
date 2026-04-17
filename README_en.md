# 🎮 Hermes Game Dev Studio

> **Turn Hermes Agent into a full game development studio**

A game development skill package designed for **Hermes Agent**, inspired by [Donchitos/Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Hermes Agent](https://img.shields.io/badge/Hermes-v0.8.0+-blue)](https://github.com/NousResearch/hermes-agent)
[![Game Dev](https://img.shields.io/badge/Game-Dev-orange)](https://github.com/topics/game-development)

---

## 📋 Table of Contents

- [Inspiration](#-inspiration)
- [Comparison with Original](#-comparison-with-original)
- [Quick Start](#-quick-start)
- [Team Architecture](#-team-architecture)
- [Core Workflow](#-core-workflow)
- [Project Structure](#-project-structure)
- [Usage Examples](#-usage-examples)
- [Contributing](#-contributing)
- [License](#-license)

---

## 💡 Inspiration

This project's **core concept** comes from the popular GitHub project [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios), which transforms Claude Code CLI into a complete game development studio.

**Why create a Hermes version?**

| Feature | Claude-Code-Game-Studios | Hermes Game Dev Studio |
|---------|-------------------------|------------------------|
| **Platform** | Claude Code CLI | Hermes Agent |
| **Agent Implementation** | 49 Markdown definition files | Hermes `delegate_task` dynamic calls |
| **Skill System** | 72 Slash Commands | Hermes Skills + Templates |
| **Hooks** | Bash script validation | Hermes toolchain integration |
| **Deployment** | Local CLI | Local/Cloud/Multi-platform gateway |

**Advantages of Hermes Version:**
- ✅ More lightweight - No need to maintain 49 agent definition files
- ✅ More flexible - Dynamic sub-agent calls, load on demand
- ✅ Easier to extend - Based on Hermes Skill system
- ✅ Multi-platform support - Telegram/Feishu/Discord/etc.

---

## 🏗️ Team Architecture

```
Hermes Agent (Controller)
    │
    ├── Tier 2: Product Development Team (4 members)
    │   ├── 🎨 Game Designer ────→ delegate_task(toolsets=['web','file'])
    │   ├── 💻 Full-Stack Engineer ────→ delegate_task(toolsets=['terminal','file','web'])
    │   ├── 🎭 Narrative Designer ────→ delegate_task(toolsets=['file','web'])
    │   └── 🧪 Test Engineer ────→ delegate_task(toolsets=['terminal','file'])
    │
    └── Tier 3: Quality Assurance Team (5 members, mandatory during development)
        ├── code-reviewer
        ├── security-reviewer
        ├── test-engineer
        ├── debugger
        └── coordinator
```

---

## ⚡ Core Workflow

### **Phase 1: Ideation & Design**
```
/brainstorm → Game idea brainstorming
/map-systems → Game system mapping
/design-system → Detailed system design
/create-gdd → Generate Game Design Document
```

### **Phase 2: Architecture & Planning**
```
/create-architecture → Technical architecture design
/create-epics → Create Epic stories
/create-stories → Break down user stories
/sprint-plan → Create sprint plan
```

### **Phase 3: Development & Implementation** ⚠️ Mandatory QA
```
/dev-story → Develop user story
/code-review → Code review (mandatory)
/security-review → Security audit (mandatory)
/run-tests → Execute tests (mandatory)
```

### **Phase 4: Testing & QA**
```
/qa-plan → Create QA plan
/smoke-check → Smoke testing
/regression-suite → Regression testing
/balance-check → Numerical balance testing
/perf-profile → Performance profiling
```

### **Phase 5: Release & Launch**
```
/release-checklist → Release checklist
/launch-checklist → Launch checklist
/changelog → Generate changelog
/patch-notes → Generate patch notes
```

---

## 🚀 Quick Start

### **Prerequisites**

1. **Hermes Agent v0.8.0+**
   ```bash
   # Check version
   hermes --version
   ```

2. **Game Engine** (choose one)
   - Godot 4.x
   - Unity 2022+
   - Unreal Engine 5

### **Installation**

#### **Method 1: Clone Repository**
```bash
git clone https://github.com/YOUR_USERNAME/hermes-game-dev-studio.git
cd hermes-game-dev-studio

# Copy skill to Hermes skills directory
cp -r skills/game-dev-studio ~/.hermes/skills/game-development/
```

#### **Method 2: Use Hermes Skill System**
```bash
# Future support (pending Hermes Skills Hub launch)
hermes skill install game-dev-studio
```

### **Start Your First Project**

```bash
# 1. Create project directory
mkdir my-game && cd my-game

# 2. Initialize project structure
hermes run "Initialize game project structure"

# 3. Start ideation phase
hermes run "Help me brainstorm a Roguelike card game concept"
```

---

## 📁 Project Structure

```
hermes-game-dev-studio/
├── README.md                         # This file
├── README_en.md                      # English version
├── LICENSE                           # MIT License
├── docs/                             # Documentation
│   ├── ARCHITECTURE.md               # Architecture design
│   ├── WORKFLOW.md                   # Workflow details
│   ├── TEMPLATES.md                  # Template guide
│   └── EXAMPLES.md                   # Usage examples
├── skills/
│   └── game-dev-studio/              # Hermes Skill
│       ├── SKILL.md                  # Skill main document
│       ├── templates/                # Document templates
│       │   ├── GDD_Template.md
│       │   ├── Story_Template.md
│       │   ├── Code_Review_Template.md
│       │   ├── Test_Plan_Template.md
│       │   ├── Release_Checklist.md
│       │   └── Bug_Report_Template.md
│       └── scripts/                  # Helper scripts
│           ├── init_project.sh
│           └── validate_hooks.sh
├── examples/                         # Example projects
│   ├── roguelike-card-game/          # Roguelike card game example
│   └── platformer-2d/                # 2D platformer example
└── scripts/                          # Utility scripts
    ├── install.sh                    # Installation script
    └── update.sh                     # Update script
```

---

## 📝 Usage Examples

### **Example 1: Brainstorm Game Concept**

**User Input:**
```
Help me brainstorm a Roguelike card game concept
```

**Agent Execution:**
```python
# Call Game Designer Agent
delegate_task(
    goal="Brainstorm Roguelike card game concept",
    toolsets=['web', 'file'],
    context="""
    Game Type: Roguelike + Card Building
    Reference Games: Slay the Spire, Dream Quest, Monster Train
    
    Output Requirements:
    1. Core gameplay loop
    2. Unique selling points (at least 3)
    3. Target audience analysis
    4. Competitive differentiation strategy
    """
)
```

### **Example 2: Generate GDD Document**

**User Input:**
```
Great concept, generate a complete GDD document
```

**Agent Execution:**
```python
# Generate document using GDD template
write_file(
    path="design/GDD.md",
    content=render_template(
        template="templates/GDD_Template.md",
        variables={
            "game_name": "User-confirmed game name",
            "core_loop": "Core loop generated by Agent",
            "systems": "Game systems designed by Agent",
            # ... other fields
        }
    )
)
```

### **Example 3: Feature Development (Mandatory QA)**

**User Input:**
```
Start implementing the card draw system
```

**Agent Execution:**
```python
# 1. Full-stack engineer development
dev_result = delegate_task(
    goal="Implement card draw system",
    toolsets=['terminal', 'file'],
    context="Implement card draw logic using Godot 4"
)

# 2. Mandatory quality assurance (5 QA Agents)
code_review = delegate_task(goal="Code review", ...)
security_review = delegate_task(goal="Security audit", ...)
test_engineer = delegate_task(goal="Generate tests", ...)
debugger = delegate_task(goal="Issue diagnosis", ...)
coordinator = delegate_task(goal="Progress coordination", ...)

# 3. Can only deliver after all pass
if all([code_review.passed, security_review.passed, test_engineer.passed]):
    print("✅ Code passed quality review, ready for delivery")
else:
    print("❌ Quality review failed, needs fixes")
```

---

## 🛡️ Quality Assurance Rules

### **Before Code Commit (Mandatory):**

| Check | Agent | Pass Criteria |
|-------|-------|---------------|
| Code Review | code-reviewer | No Major/Blocker issues |
| Security Audit | security-reviewer | No security vulnerabilities |
| Unit Tests | test-engineer | Coverage >80% |
| Bug Fixes | debugger | No known issues |

### **Before Release (Mandatory):**

| Check | Agent | Pass Criteria |
|-------|-------|---------------|
| Smoke Test | Test Engineer | Core features 100% functional |
| Regression Test | Test Engineer | No functionality degradation |
| Performance Profile | Performance Analyst | Frame rate meets target |
| Balance Test | Game Designer | Numerical balance achieved |

---

## 🤝 Contributing

### **How to Contribute?**

1. **Fork this repository**
2. **Create your feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### **What to Contribute:**

- 🎮 New game type templates (RPG/FPS/RTS/etc.)
- 📝 New document templates
- 🔧 New workflow scripts
- 🐛 Bug fixes
- 📚 Documentation improvements

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **[Donchitos/Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)** - Inspiration for the core concept
- **[NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)** - Hermes Agent framework
- **All Contributors** - Thank you for your support!

---

## 📞 Contact

- **Project Issues:** [GitHub Issues](https://github.com/YOUR_USERNAME/hermes-game-dev-studio/issues)
- **Discussions:** [GitHub Discussions](https://github.com/YOUR_USERNAME/hermes-game-dev-studio/discussions)

---

*Last updated: 2026-04-17*  
*Version: 1.0.0*
