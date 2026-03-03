#!/bin/bash

# MindLink 停止脚本

echo "🛑 停止 MindLink 平台..."
echo ""

# 停止后端服务
if [ -f .pids/backend.pid ]; then
    BACKEND_PID=$(cat .pids/backend.pid)
    if ps -p $BACKEND_PID > /dev/null 2>&1; then
        kill $BACKEND_PID
        echo "✅ 后端服务已停止 (PID: $BACKEND_PID)"
    else
        echo "⚠️  后端服务未运行"
    fi
    rm .pids/backend.pid
else
    echo "⚠️  未找到后端PID文件"
fi

# 停止前端服务
if [ -f .pids/frontend.pid ]; then
    FRONTEND_PID=$(cat .pids/frontend.pid)
    if ps -p $FRONTEND_PID > /dev/null 2>&1; then
        kill $FRONTEND_PID
        echo "✅ 前端服务已停止 (PID: $FRONTEND_PID)"
    else
        echo "⚠️  前端服务未运行"
    fi
    rm .pids/frontend.pid
else
    echo "⚠️  未找到前端PID文件"
fi

# 清理其他可能的进程
pkill -f "node server.js" 2>/dev/null
pkill -f "python3 -m http.server 8080" 2>/dev/null

echo ""
echo "✅ MindLink 平台已停止"
