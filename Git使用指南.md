# Git 版本管理指南

## 📋 目录
1. [查看修改状态](#查看修改状态)
2. [查看具体改动](#查看具体改动)
3. [提交代码](#提交代码)
4. [版本管理](#版本管理)
5. [分支管理](#分支管理)
6. [常用命令速查](#常用命令速查)

---

## 1. 查看修改状态

### 查看哪些文件被修改了
```bash
# 查看工作区状态（详细）
git status

# 查看工作区状态（简洁）
git status -s
# 输出说明：
# M  = 已修改并暂存
# MM = 已修改、暂存后又修改
# A  = 新添加的文件
# D  = 已删除的文件
# ?? = 未跟踪的文件
```

### 查看修改统计
```bash
# 查看修改的文件列表
git diff --name-only

# 查看修改的文件及统计
git diff --stat

# 查看已暂存的修改统计
git diff --staged --stat
```

---

## 2. 查看具体改动

### 查看未暂存的修改
```bash
# 查看所有未暂存的改动
git diff

# 查看特定文件的改动
git diff backend/server.js

# 查看改动的简要统计
git diff --stat
```

### 查看已暂存的修改
```bash
# 查看已暂存但未提交的改动
git diff --staged

# 或使用
git diff --cached
```

### 查看历史提交的改动
```bash
# 查看最近一次提交的改动
git show

# 查看特定提交的改动
git show 469c7fc

# 查看某个文件的历史改动
git log -p backend/server.js

# 查看两个版本之间的差异
git diff v1.0.0 HEAD
```

---

## 3. 提交代码

### 基本提交流程
```bash
# 1. 查看当前状态
git status

# 2. 添加修改的文件到暂存区
git add backend/server.js          # 添加单个文件
git add backend/                    # 添加整个目录
git add .                           # 添加所有修改

# 3. 查看暂存的内容
git diff --staged

# 4. 提交
git commit -m "修复：修复用户登录bug"

# 5. 推送到远程
git push origin main
```

### 提交信息规范
```bash
# 推荐的提交信息格式：
git commit -m "类型: 简短描述

详细说明（可选）
- 修改点1
- 修改点2

相关issue: #123"

# 常用类型：
# feat:     新功能
# fix:      修复bug
# docs:     文档更新
# style:    代码格式调整
# refactor: 重构代码
# test:     测试相关
# chore:    构建/工具相关
```

### 撤销操作
```bash
# 撤销工作区的修改（危险！）
git checkout -- backend/server.js

# 撤销暂存（保留修改）
git reset HEAD backend/server.js

# 修改最后一次提交
git commit --amend

# 回退到上一个版本（危险！）
git reset --hard HEAD^
```

---

## 4. 版本管理

### 查看版本历史
```bash
# 查看提交历史（简洁）
git log --oneline

# 查看提交历史（详细）
git log

# 查看最近5次提交
git log -5

# 查看提交历史图形化
git log --graph --oneline --all

# 查看某个文件的提交历史
git log backend/server.js

# 查看某个作者的提交
git log --author="fountain"
```

### 版本标签管理
```bash
# 查看所有标签
git tag

# 查看标签详情
git tag -l -n9 v1.0.0

# 创建轻量标签
git tag v1.0.1

# 创建附注标签（推荐）
git tag -a v1.0.1 -m "版本1.0.1发布"

# 给历史提交打标签
git tag -a v1.0.0 469c7fc -m "v1.0.0版本"

# 推送标签到远程
git push origin v1.0.1

# 推送所有标签
git push origin --tags

# 删除本地标签
git tag -d v1.0.1

# 删除远程标签
git push origin :refs/tags/v1.0.1
```

### 版本比较
```bash
# 比较两个版本
git diff v1.0.0 v1.0.1

# 比较当前版本和v1.0.0
git diff v1.0.0 HEAD

# 查看两个版本之间的提交
git log v1.0.0..v1.0.1

# 查看文件在不同版本的差异
git diff v1.0.0:backend/server.js v1.0.1:backend/server.js
```

---

## 5. 分支管理

### 创建和切换分支
```bash
# 查看所有分支
git branch -a

# 创建新分支
git branch dev/v2.0

# 切换分支
git checkout dev/v2.0

# 创建并切换分支（推荐）
git checkout -b dev/v2.0

# 或使用新命令
git switch -c dev/v2.0
```

### 分支开发流程
```bash
# 1. 从main创建开发分支
git checkout main
git pull origin main
git checkout -b feature/new-ui

# 2. 在分支上开发
git add .
git commit -m "feat: 添加新UI界面"

# 3. 推送分支到远程
git push origin feature/new-ui

# 4. 合并到main（在GitHub上创建PR，或本地合并）
git checkout main
git merge feature/new-ui

# 5. 删除已合并的分支
git branch -d feature/new-ui
git push origin --delete feature/new-ui
```

### 推荐的分支策略
```
main          - 主分支（生产环境）
├── v1.0.0    - 版本标签
├── v1.0.1    - 版本标签
│
dev/v2.0      - v2.0开发分支
├── feature/new-ui        - 新UI功能
├── feature/education     - 教育场景
└── fix/login-bug         - bug修复
```

---

## 6. 常用命令速查

### 日常开发
```bash
# 查看状态
git status -s

# 查看改动
git diff

# 添加并提交
git add .
git commit -m "feat: 添加新功能"

# 推送
git push origin main

# 拉取最新代码
git pull origin main
```

### 查看历史
```bash
# 查看提交历史
git log --oneline -10

# 查看某个文件的历史
git log -p backend/server.js

# 查看谁修改了某行代码
git blame backend/server.js
```

### 版本对比
```bash
# 查看修改的文件
git diff --name-only

# 查看修改统计
git diff --stat

# 查看两个版本差异
git diff v1.0.0 v1.0.1
```

### 撤销操作
```bash
# 撤销工作区修改
git checkout -- <file>

# 撤销暂存
git reset HEAD <file>

# 回退版本（保留修改）
git reset --soft HEAD^

# 回退版本（丢弃修改）
git reset --hard HEAD^
```

---

## 📝 实际使用示例

### 场景1：开始v2.0开发
```bash
# 1. 确保在最新的main分支
git checkout main
git pull origin main

# 2. 创建v2.0开发分支
git checkout -b dev/v2.0

# 3. 开始开发...
# 修改文件

# 4. 查看修改
git status
git diff

# 5. 提交修改
git add .
git commit -m "feat: 开始v2.0开发 - 优化前端UI"

# 6. 推送到远程
git push origin dev/v2.0
```

### 场景2：修复v1.0的bug
```bash
# 1. 从v1.0.0标签创建修复分支
git checkout -b hotfix/v1.0.1 v1.0.0

# 2. 修复bug
# 修改文件

# 3. 提交
git add .
git commit -m "fix: 修复用户登录bug"

# 4. 打标签
git tag -a v1.0.1 -m "修复登录bug"

# 5. 合并回main
git checkout main
git merge hotfix/v1.0.1

# 6. 推送
git push origin main
git push origin v1.0.1
```

### 场景3：查看v1.0到现在的所有改动
```bash
# 查看提交列表
git log v1.0.0..HEAD --oneline

# 查看详细改动
git log v1.0.0..HEAD -p

# 查看改动统计
git diff v1.0.0 HEAD --stat

# 查看具体文件的改动
git diff v1.0.0 HEAD -- backend/server.js
```

---

## 🎯 v2.0开发建议

### 推荐的工作流程
```bash
# 1. 创建v2.0开发分支
git checkout -b dev/v2.0

# 2. 为每个大功能创建feature分支
git checkout -b feature/ui-redesign dev/v2.0
# 开发UI重设计
git commit -m "feat: 重新设计用户界面"
git checkout dev/v2.0
git merge feature/ui-redesign

# 3. 定期提交到dev/v2.0
git push origin dev/v2.0

# 4. v2.0完成后，合并到main并打标签
git checkout main
git merge dev/v2.0
git tag -a v2.0.0 -m "v2.0.0发布"
git push origin main --tags
```

### 提交频率建议
- 每完成一个小功能就提交一次
- 每天至少提交一次
- 重要节点（如完成某个模块）创建标签

---

## 🔍 GitHub上查看

推送后，你可以在GitHub上：
1. 查看提交历史：https://github.com/James-Fountain/MindLink/commits/main
2. 查看版本标签：https://github.com/James-Fountain/MindLink/tags
3. 查看v1.0.0发布：https://github.com/James-Fountain/MindLink/releases
4. 比较版本差异：https://github.com/James-Fountain/MindLink/compare/v1.0.0...main

---

**提示**：建议将这个文档保存在项目根目录，随时查阅！
