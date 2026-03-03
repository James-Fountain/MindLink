# Git 快速参考卡片 🚀

## 📊 查看状态和改动

```bash
# 查看当前状态
git status              # 详细状态
git status -s           # 简洁状态

# 查看改动
git diff                # 查看未暂存的改动
git diff --staged       # 查看已暂存的改动
git diff --stat         # 查看改动统计

# 查看修改的文件列表
git diff --name-only    # 只显示文件名
```

## 📝 提交代码

```bash
# 标准流程
git status              # 1. 查看状态
git add .               # 2. 添加所有修改
git commit -m "描述"    # 3. 提交
git push origin main    # 4. 推送到远程

# 快捷方式
git commit -am "描述"   # 添加并提交（仅已跟踪文件）
```

## 📜 查看历史

```bash
# 查看提交历史
git log --oneline -10           # 简洁格式，最近10条
git log --graph --oneline --all # 图形化显示所有分支

# 查看某个文件的历史
git log -p backend/server.js    # 显示每次改动
git log backend/server.js       # 只显示提交信息

# 查看特定提交
git show 469c7fc                # 查看某次提交的详情
```

## 🏷️ 版本标签

```bash
# 查看标签
git tag                         # 列出所有标签
git tag -l -n9 v1.0.0          # 查看标签详情

# 创建标签
git tag -a v1.0.1 -m "描述"    # 创建附注标签
git push origin v1.0.1          # 推送标签到远程
git push origin --tags          # 推送所有标签
```

## 🌿 分支管理

```bash
# 查看分支
git branch                      # 本地分支
git branch -a                   # 所有分支（含远程）

# 创建和切换
git checkout -b dev/v2.0        # 创建并切换到新分支
git checkout main               # 切换到main分支

# 合并分支
git merge dev/v2.0              # 合并dev/v2.0到当前分支
```

## 🔄 同步代码

```bash
# 拉取最新代码
git pull origin main            # 拉取并合并

# 推送代码
git push origin main            # 推送到main分支
git push origin dev/v2.0        # 推送到dev/v2.0分支
```

## 🔍 版本对比

```bash
# 比较版本
git diff v1.0.0 v1.0.1         # 比较两个版本
git diff v1.0.0 HEAD           # 比较v1.0.0和当前版本

# 查看版本间的提交
git log v1.0.0..HEAD --oneline # 查看v1.0.0到现在的提交
```

## ⚠️ 撤销操作

```bash
# 撤销工作区修改（危险！会丢失修改）
git checkout -- <file>

# 撤销暂存（保留修改）
git reset HEAD <file>

# 修改最后一次提交
git commit --amend
```

## 🎯 常用场景

### 场景1：日常开发
```bash
# 修改代码后
git status                      # 查看改了什么
git diff                        # 查看具体改动
git add .                       # 添加所有修改
git commit -m "feat: 新功能"    # 提交
git push origin main            # 推送
```

### 场景2：开始新功能开发
```bash
git checkout -b feature/new-ui  # 创建功能分支
# 开发...
git add .
git commit -m "feat: 新UI"
git push origin feature/new-ui  # 推送功能分支
```

### 场景3：发布新版本
```bash
git add .
git commit -m "Release v1.0.1"
git tag -a v1.0.1 -m "v1.0.1"
git push origin main
git push origin v1.0.1
```

### 场景4：查看改动历史
```bash
# 查看最近的改动
git log --oneline -10

# 查看某个文件的改动历史
git log -p backend/server.js

# 查看两个版本之间的差异
git diff v1.0.0 v1.0.1 --stat
```

## 📱 GitHub 网页查看

- **提交历史**: https://github.com/James-Fountain/MindLink/commits/main
- **版本标签**: https://github.com/James-Fountain/MindLink/tags
- **版本发布**: https://github.com/James-Fountain/MindLink/releases
- **比较版本**: https://github.com/James-Fountain/MindLink/compare/v1.0.0...main

## 💡 提示

1. **提交前先查看**: 养成 `git status` 和 `git diff` 的习惯
2. **提交信息要清晰**: 使用规范的提交信息格式
3. **经常提交**: 每完成一个小功能就提交
4. **重要节点打标签**: 每个版本发布都打标签
5. **使用分支开发**: 新功能在分支上开发，完成后合并

---

**快速帮助**: 任何git命令后加 `--help` 查看详细帮助
例如: `git commit --help`
