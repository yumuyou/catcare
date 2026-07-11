#!/bin/bash
# 一键部署到 Vercel 生产环境
cd "$(dirname "$0")"
cp 新手养猫不慌手册.html index.html
vercel --prod
