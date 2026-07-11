# 新手养猫不慌手册 · CatCare

西红门镇新手养猫 AI 管家 —— 2026 西红门镇产业创新黑客松 · 宠物经济赛道作品。

**一句话**：录入猫咪档案 → 自动生成专属养护时间线 → 异常时 AI 问诊分诊 → 需要就医时直接推荐镇内医院（含 24 小时急诊）→ 医嘱回流变成时间线待办。

## 本地运行

单文件应用，无需构建。首次打开时通过 URL 参数配置 API（之后会存入 localStorage，直接打开即可）：

```
# 官方 Anthropic API：
open "index.html?key=sk-ant-xxx"

# 组委会中转（Opendev 等）：
open "index.html?key=你的key&base=https://中转地址"

# 可选换模型：
&model=claude-sonnet-4-6

# 高德地图（不配则医院页显示内置示意图，不影响演示）：
&amap=高德JSKey&amapsec=高德安全密钥
```

高德 key 申请：console.amap.com → 应用管理 → 创建应用 → 添加 Key，服务平台选 **Web端(JS API)**。2021 年后申请的 key 会同时给一个"安全密钥"，两个都要填。本地 file:// 打开时高德域名白名单不生效，建议部署到 Vercel 后再验证真地图。

接口不通时自动使用预置演示数据，时间线页会显示"⚡ 当前为预置演示数据"角标。

## 部署到 Vercel

```bash
# 1. 推到 GitHub（在 github.com 上先建一个空仓库 catcare）
git add -A
git commit -m "feat: catcare hackathon MVP"
git remote add origin https://github.com/<你的用户名>/catcare.git
git push -u origin main

# 2. 到 vercel.com → Add New Project → 选这个仓库 → 直接 Deploy
#    （纯静态 index.html，无需任何构建配置）

# 3. 部署完成后首次访问带上 key：
#    https://你的域名.vercel.app/?key=xxx&base=xxx
```

邀请队友协作：GitHub 仓库页 → Settings → Collaborators → Add people。

## 文档

- `PRD_西红门养宠AI管家.md` — 产品需求文档 v1.0
- `功能优先级清单_0711讨论.md` — 7/11 团队讨论整理出的改进清单与范围决策
- `新手养猫不慌手册.html` — 与 index.html 相同（保留中文名便于本地识别）

## 注意

- 演示数据均为本地 state，刷新即重置（符合 PRD 单机 demo 范围）
- 医院数据为硬编码，录 demo 前请按 PRD §F4 用高德核实营业状态
- AI 分诊仅供参考，紧急情况请直接就医
