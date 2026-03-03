#!/bin/bash

# MindLink 快速启动脚本

echo "🚀 启动 MindLink 平台..."
echo ""

# 检查PostgreSQL服务
echo "📊 检查PostgreSQL服务..."
if ! pg_isready > /dev/null 2>&1; then
    echo "❌ PostgreSQL服务未运行，请先启动PostgreSQL"
    exit 1
fi
echo "✅ PostgreSQL服务正常"
echo ""

# 启动后端服务
echo "🔧 启动后端服务..."
cd backend
node server.js > ../logs/backend.log 2>&1 &
BACKEND_PID=$!
echo "✅ 后端服务已启动 (PID: $BACKEND_PID)"
echo "   日志文件: logs/backend.log"
echo "   API地址: http://localhost:3000"
echo ""

# 等待后端启动
sleep 3

# 检查后端健康状态
echo "🏥 检查后端健康状态..."
if curl -s http://localhost:3000/health > /dev/null; then
    echo "✅ 后端服务健康检查通过"
else
    echo "❌ 后端服务启动失败"
    exit 1
fi
echo ""

# 启动前端服务
echo "🌐 启动前端服务..."
cd ..
python3 -m http.server 8080 > logs/frontend.log 2>&1 &
FRONTEND_PID=$!
echo "✅ 前端服务已启动 (PID: $FRONTEND_PID)"
echo "   日志文件: logs/frontend.log"
echo "   访问地址: http://localhost:8080"
echo ""

# 保存PID到文件
mkdir -p .pids
echo $BACKEND_PID > .pids/backend.pid
echo $FRONTEND_PID > .pids/frontend.pid

echo "🎉 MindLink 平台启动成功！"
echo ""
echo "📝 访问方式:"
echo "   前端: http://localhost:8080"
echo "   后端API: http://localhost:3000"
echo "   健康检查: http://localhost:3000/health"
echo ""
echo "🛑 停止服务:"
echo "   运行: ./stop.sh"
echo ""
