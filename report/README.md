# 《软件工程 1》课程设计报告 LaTeX 源码

本目录存放第十组项目 **“轻量级外卖服务平台”**（代码仓库：`https://github.com/Fwlyii/lightweight-takeout-platform.git`）的《软件工程 1》课程设计报告 LaTeX 源码与图表资源。

## 目录结构

```text
report/
  tjumain.tex                 # 报告主入口文件
  tjumain.pdf                 # 编译后的报告
  build.sh                    # 更新目录与引用并生成 PDF
  evidence/                   # 测试日志、运行信息与截图来源记录
  setup/                      # 封面、页眉页脚、宏包与自定义命令配置
  body/
    ch1_team.tex              # 团队建立与培训
    ch2_definition.tex        # 项目范围、架构与功能设计
    ch3_process.tex           # 过程管理与三轮 Sprint
    ch4_management.tex        # 计划、工时、进度与风险
    ch5_delivery.tex          # 测试、交叉验收与部署
    ch6_ai_empowerment.tex    # 研发协作与运行时 AI
    ch7_retrospective.tex     # 交付回顾与成员体会
    appendix_*.tex            # 附录分组及各章移入的查阅材料
    ch2_db_specs.tex          # 附录 B 的 23 张数据库表和关键字段索引
    ch2_api_specs.tex         # 附录 C 的 135 个接口索引
    ch5_test_tables.tex       # 附录 D 的自动化用例索引，完整输出见 evidence/
  figures/
    template/cover-background.pdf  # 天津大学矢量封面底版
    srs/                      # 复用的SRS系统建模图（上下文、用例、类图、状态机、时序图、部署图）
    report/                   # 复用的四端实景截图与过程协作截图
    cross/                    # 复用的跨组交叉验收与边界测试截图
    screenshots/              # 本服务器实际运行项目后的浏览器截图
```

## 本地编译

在仓库根目录运行以下命令。使用包含 ctex、Fandol 和常用宏包的 XeLaTeX 工具链，并在本机启用 Times New Roman、Songti SC 及其粗体。

```bash
sh report/build.sh
```

正文沿用《论文_关键词修订版》的 Fandol 宋体和 Times New Roman，正文 12 bp、基线间距 18 bp，中文加粗参数为 `AutoFakeBold=2.5`。空心三角列表沿用 Songti SC，图表题注为 10.5 bp、基线间距 12.6 bp。`tjumain.tex` 配置字族，`setup/format.tex` 配置字号和行距。脚本编译三遍后更新 `report/tjumain.pdf`。缺少原图时，编译会指出相应的文件路径。

## 附录导航

| 附录 | 查阅内容 |
| --- | --- |
| A | 工程基线、用户故事及状态映射 |
| B | 数据库表、关键字段与增量迁移 |
| C | 响应规范与接口索引 |
| D | 自动化测试索引、交叉验收、缺陷记录与部署配置 |
| E | 四端页面路由与主题规范 |
| F | 团队协作、Sprint 记录、工作分解与风险台账 |
| G | AI 研发复核、运行配置与后续演进 |

## 运行截图与测试证据

2026 年 11 月 16 日的报告证据来自项目快照 `6ddb219`。前端使用 Node.js 22.16.0，后端使用 OpenJDK 17.0.21，页面走查连接独立的 MySQL 8.0.46。截图由 Playwright 操作 Chrome 获得。测试运行信息和截图来源见 [证据说明](evidence/2026-11-16/README.md)。

| 文件名（位于 `figures/screenshots/`） | 对应章节 | 实际内容与验证范围 |
| --- | --- | --- |
| `ui-assets-preferences.png` | 第2章 | `demo_user` 的钱包、积分、优惠券和薄荷青主题页面，两张实际页面截图拼接。 |
| `ui-amap-picker.png` | 第2章 | 高德地图服务未配置时的选址提示及手填地址入口。 |
| `test-terminal-results.png` | 第5章 | 前端 235 项、后端 340 项测试的日志摘录。原始输出与统计见证据目录。 |
| `ui-ai-assistant.png` | 第6章 | 输入“鸡腿饭”和 30 元预算后，本地筛选从演示菜单返回的候选商品。 |
| `ui-ai-media-unconfigured.png` | 第6章 | 图片识菜服务未配置时，上传入口禁用且显示明确提示的实际状态。 |

本轮归档的运行验证覆盖本地菜单筛选、地图手填地址及图片和语音服务未配置时的页面反馈。地图检索、DeepSeek 对话与 DashScope 识别的成功路径需要在配置有效凭证后复测。高德选址由后端读取 `AMAP_WEB_KEY`、`AMAP_JS_KEY`、`AMAP_SECURITY_CODE`。

## 提交打包提醒

依据 `guide/软件工程大作业要求(1).docx` 要求，编译生成 PDF 后请将软件代码及实验报告文档统一打包压缩提交，注意核对封面所有成员学号与姓名（3024244438 范文丽、3024232129 李承文、3024244137 赵紫怡、3024244140 仲禹潼）及压缩包命名规范（`学号+姓名`）。
