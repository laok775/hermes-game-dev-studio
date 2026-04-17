#!/bin/bash

# Hermes Game Dev Studio - 安装脚本
# 用法：./scripts/install.sh

set -e

echo "🎮 Hermes Game Dev Studio 安装脚本"
echo "=================================="

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查 Hermes 是否安装
check_hermes() {
    if ! command -v hermes &> /dev/null; then
        echo -e "${RED}❌ 错误：未找到 Hermes Agent${NC}"
        echo "请先安装 Hermes Agent: https://github.com/NousResearch/hermes-agent"
        exit 1
    fi
    echo -e "${GREEN}✅ Hermes Agent 已安装${NC}"
}

# 检查 Python
check_python() {
    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}❌ 错误：未找到 Python 3${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Python 3 已安装${NC}"
}

# 复制 Skill 到 Hermes 目录
install_skill() {
    echo ""
    echo "📦 安装 Game Dev Studio Skill..."
    
    SKILL_SRC="$(pwd)/skills/game-dev-studio"
    SKILL_DST="$HOME/.hermes/skills/game-development/game-dev-studio"
    
    # 创建目标目录
    mkdir -p "$(dirname $SKILL_DST)"
    
    # 复制 Skill
    if [ -d "$SKILL_DST" ]; then
        echo -e "${YELLOW}⚠️  Skill 已存在，是否覆盖？(y/n)${NC}"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            rm -rf "$SKILL_DST"
            cp -r "$SKILL_SRC" "$SKILL_DST"
            echo -e "${GREEN}✅ Skill 已更新${NC}"
        else
            echo -e "${YELLOW}⏭️  跳过安装${NC}"
            return
        fi
    else
        cp -r "$SKILL_SRC" "$SKILL_DST"
        echo -e "${GREEN}✅ Skill 已安装到：$SKILL_DST${NC}"
    fi
}

# 复制模板
install_templates() {
    echo ""
    echo "📄 安装文档模板..."
    
    TEMPLATE_SRC="$(pwd)/templates"
    TEMPLATE_DST="$HOME/.hermes/templates/game-dev"
    
    mkdir -p "$TEMPLATE_DST"
    cp -r "$TEMPLATE_SRC"/* "$TEMPLATE_DST"/
    
    echo -e "${GREEN}✅ 模板已安装到：$TEMPLATE_DST${NC}"
}

# 验证安装
verify_installation() {
    echo ""
    echo "🔍 验证安装..."
    
    if [ -d "$HOME/.hermes/skills/game-development/game-dev-studio" ]; then
        echo -e "${GREEN}✅ Skill 目录存在${NC}"
    else
        echo -e "${RED}❌ Skill 目录不存在${NC}"
        exit 1
    fi
    
    if [ -f "$HOME/.hermes/skills/game-development/game-dev-studio/SKILL.md" ]; then
        echo -e "${GREEN}✅ SKILL.md 存在${NC}"
    else
        echo -e "${RED}❌ SKILL.md 不存在${NC}"
        exit 1
    fi
    
    echo ""
    echo -e "${GREEN}=================================${NC}"
    echo -e "${GREEN}🎉 安装完成！${NC}"
    echo -e "${GREEN}=================================${NC}"
    echo ""
    echo "下一步："
    echo "1. 重启 Hermes Agent (如已运行)"
    echo "2. 运行：hermes skill list 查看已安装技能"
    echo "3. 开始使用：hermes run '帮我头脑风暴一个游戏创意'"
    echo ""
}

# 主函数
main() {
    echo ""
    check_hermes
    check_python
    install_skill
    install_templates
    verify_installation
}

# 运行主函数
main
