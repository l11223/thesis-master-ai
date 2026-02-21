#!/bin/bash

# 学术论文创作系统 - 新建论文脚本
# 用法: ./new_thesis.sh "论文题目"

if [ -z "$1" ]; then
    echo "用法: ./new_thesis.sh \"论文题目\""
    echo "示例: ./new_thesis.sh \"嗅觉对旅游目的地依恋的影响研究\""
    exit 1
fi

THESIS_NAME="$1"
THESIS_DIR="./$THESIS_NAME"

# 检查是否已存在
if [ -d "$THESIS_DIR" ]; then
    echo "错误: 文件夹 '$THESIS_NAME' 已存在"
    exit 1
fi

echo "🎓 创建论文: $THESIS_NAME"

# 创建文件夹结构
mkdir -p "$THESIS_DIR"/{大纲,存档,草稿,文献,数据,图表,附录}

# 复制模板文件
if [ -d "_论文模板" ]; then
    cp "_论文模板/大纲/总大纲模板.md" "$THESIS_DIR/大纲/总大纲.md" 2>/dev/null
    cp "_论文模板/文献/文献矩阵模板.md" "$THESIS_DIR/文献/文献矩阵.md" 2>/dev/null
    cp "_论文模板/存档/存档模板.md" "$THESIS_DIR/存档/存档模板.md" 2>/dev/null
fi

# 创建论文信息文件
cat > "$THESIS_DIR/论文信息.md" << EOF
# 📝 论文基本信息

## 基本信息

| 项目 | 内容 |
|------|------|
| 论文题目 | $THESIS_NAME |
| 创建时间 | $(date +%Y-%m-%d) |
| 论文类型 | |
| 学科领域 | |
| 目标字数 | |
| 导师 | |
| 计划完成时间 | |

## 研究问题

（简要描述研究问题）

## 核心变量

| 变量类型 | 变量名称 |
|----------|----------|
| 自变量 | |
| 因变量 | |
| 中介变量 | |
| 调节变量 | |

## 写作进度

| 章节 | 状态 | 字数 |
|------|------|------|
| 摘要 | 未开始 | |
| 第一章 引言 | 未开始 | |
| 第二章 文献综述 | 未开始 | |
| 第三章 研究设计 | 未开始 | |
| 第四章 研究结果 | 未开始 | |
| 第五章 讨论与结论 | 未开始 | |

---

*最后更新: $(date +%Y-%m-%d)*
EOF

# 创建 .gitkeep 保持空文件夹
touch "$THESIS_DIR/草稿/.gitkeep"
touch "$THESIS_DIR/数据/.gitkeep"
touch "$THESIS_DIR/图表/.gitkeep"
touch "$THESIS_DIR/附录/.gitkeep"

echo ""
echo "✅ 论文文件夹创建完成!"
echo ""
echo "📁 文件夹结构:"
echo "   $THESIS_NAME/"
echo "   ├── 大纲/           # 论文大纲"
echo "   │   └── 总大纲.md"
echo "   ├── 存档/           # 写作进度存档"
echo "   ├── 草稿/           # 各章节草稿"
echo "   ├── 文献/           # 文献资料"
echo "   │   └── 文献矩阵.md"
echo "   ├── 数据/           # 数据文件"
echo "   ├── 图表/           # 图表文件"
echo "   ├── 附录/           # 附录材料"
echo "   └── 论文信息.md     # 论文基本信息"
echo ""
echo "🚀 下一步:"
echo "   1. 编辑 $THESIS_NAME/大纲/总大纲.md 完善大纲"
echo "   2. 复制 THESIS_MASTER_PROMPT.md 发给 AI"
echo "   3. 开始写作!"
echo ""
