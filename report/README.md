# 《软件工程 1》课程设计报告 LaTeX 源码

本目录存放第十组项目 **“轻量级外卖服务平台”**（代码仓库：`https://github.com/Fwlyii/lightweight-takeout-platform.git`）的《软件工程 1》课程设计报告 LaTeX 源码与图表资源。

## 目录结构

```text
report/
  tjumain.tex                 # 报告主入口文件
  tjumain.pdf                 # 编译后的报告（保留待补截图占位符）
  setup/                      # 封面、页眉页脚、宏包与自定义命令配置
  body/
    ch1_team.tex              # 第1章 团队建立（角色、任务分配、培训大纲）
    ch2_definition.tex        # 第2章 定义项目（愿景、Backlog、架构、22张表、接口、UI）
    ch3_process.tex           # 第3章 过程管理（CMM3+Scrum、立项组会、三大Sprint日志与燃尽图）
    ch4_management.tex        # 第4章 项目管理（WBS、PERT工时估算、甘特图、整体燃尽图、风险闭环）
    ch5_delivery.tex          # 第5章 项目交付（测试文档与575项单测统计、Docker与本地部署）
    ch6_ai_empowerment.tex    # 第6章 AI赋能专题（研发全流程AI赋能 + 运行时多模态AI边界治理）
    ch7_retrospective.tex     # 第7章 总结回顾（项目组总结 + 4位成员各自贡献与体会）
  figures/
    Tjulogo.png               # 封面校徽
    srs/                      # 复用的SRS系统建模图（上下文、用例、类图、状态机、时序图、部署图）
    report/                   # 复用的四端实景截图与过程协作截图
    cross/                    # 复用的跨组交叉验收与边界测试截图
    screenshots/              # 【预留目录】本地补充浏览器截图放置位置
```

## 本地编译方式

无需 Docker 或管理员权限，也可以把 Tectonic 独立编译器下载到用户目录或项目外的工具目录，再使用其完整路径执行编译。编译器首次运行会联网下载所需宏包与 Fandol 中文字体，并自动重复编译以更新目录和交叉引用：

```bash
cd report
/path/to/tectonic --keep-logs tjumain.tex
```

在本服务器上，编译器放置于 `/home/wenli/.local/share/course-report-tools/tectonic/tectonic`。工具链与下载缓存不提交到仓库，生成的 `tjumain.pdf` 提交到本目录；中间文件由 `.gitignore` 排除。

如果已有完整的 XeLaTeX 工具链，也可以使用以下方式：

请在安装了 TeX Live / MacTeX / MiKTeX（含 XeLaTeX 与中文支持包）的环境中，将工作目录切换到 `report/` 后执行两遍编译以生成目录与交叉引用：

```bash
cd report
xelatex tjumain.tex
xelatex tjumain.tex
```

> 说明：报告正文中的 `setup/commands.tex` 为本地待补截图命令 `\placeholderfig` 内置了 `\IfFileExists` 判断。即使暂未放入补充截图，文档亦可直接通过编译，并在对应位置显示带操作指引的蓝色占位框；放入对应图片后重新执行 `xelatex` 即可自动嵌入实景图。

## 本地待补充截图清单（放入 `figures/screenshots/`）

由于当前生成环境未运行前后端服务且无本地 Node/Maven/Docker 守护进程权限，以下 4 张增量界面/运行截图已预留标准占位符，可在本地启动 `lightweight-takeout-platform` 后按表补齐：

| 预期文件名（位于 `figures/screenshots/`） | 对应章节 | 建议操作与截图内容 |
| --- | --- | --- |
| `ui-assets-preferences.png` | 第2章 2.7.3 | 使用 `demo_user` 登录，打开“我的 → 钱包与优惠”（`/assets`）与“偏好与外观”（`/preferences`，切换深海夜色或薄荷青主题），拼图或截取页面。 |
| `ui-amap-picker.png` | 第2章 2.7.3 | 本地配置 `VUE_APP_AMAP_KEY` 后，在新增/编辑收货地址弹窗打开高德选址并搜索地点，截取含 POI 列表与地图标记的界面。 |
| `test-terminal-results.png` | 第5章 5.1.2 | 在项目根目录运行 `npm --prefix elmclient test` 与 `cd elm_bk && ./mvnw test`，截取终端输出 `235` 项前端通过与 `340` 项后端通过的汇总画面。 |
| `ui-ai-assistant.png` | 第6章 6.3.4 | 登录 `demo_user` 后点击首页右下角“AI 点餐”进入 `/ai-chat`，演示发送一次点餐询问（展示可点击候选商品卡片）或识菜/语音入口。 |

## 提交打包提醒

依据 `guide/软件工程大作业要求(1).docx` 要求，编译生成 PDF 后请将软件代码及实验报告文档统一打包压缩提交，注意核对封面所有成员学号与姓名（3024244438 范文丽、3024232129 李承文、3024244137 赵紫怡、3024244140 仲禹潼）及压缩包命名规范（`学号+姓名`）。
