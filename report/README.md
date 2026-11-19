# 《软件工程 1》课程设计报告 LaTeX 源码

本目录存放第十组项目 **“轻量级外卖服务平台”**（代码仓库：`https://github.com/Fwlyii/lightweight-takeout-platform.git`）的《软件工程 1》课程设计报告 LaTeX 源码与图表资源。

## 目录结构

```text
report/
  tjumain.tex                 # 报告主入口文件
  tjumain.pdf                 # 编译后的报告（包含本服务器补充截图）
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
    Tjulogo.png               # 封面校徽
    srs/                      # 复用的SRS系统建模图（上下文、用例、类图、状态机、时序图、部署图）
    report/                   # 复用的四端实景截图与过程协作截图
    cross/                    # 复用的跨组交叉验收与边界测试截图
    screenshots/              # 本服务器实际运行项目后的浏览器截图
```

## 本地编译

在仓库根目录执行以下命令。XeLaTeX 工具链需包含 ctex、Fandol 字体和常用宏包。目录、长表列宽和交叉引用稳定前需要重复编译。

```bash
cd report
xelatex -interaction=nonstopmode -halt-on-error tjumain.tex
xelatex -interaction=nonstopmode -halt-on-error tjumain.tex
xelatex -interaction=nonstopmode -halt-on-error tjumain.tex
```

正文采用 Fandol 宋体，宋体加粗强度与数模参考稿一致。西文优先使用 Times New Roman，缺少该字体时使用 TeX Gyre Termes。构建结果为 `tjumain.pdf`。

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

## 已补充截图与验证范围

2026 年 11 月 16 日，使用用户目录中的 Node.js 22.16.0、OpenJDK 17.0.21 和独立 MySQL 8.0.46 实例直接启动原项目，通过 Playwright 操作服务器已有的 Chrome 截图，全程无需 Docker。原先的 4 处占位符均已替换为实际运行证据，并额外补充了图片模型未配置状态。测试运行信息和截图来源见 `evidence/2026-11-16/`。

| 文件名（位于 `figures/screenshots/`） | 对应章节 | 实际内容与验证范围 |
| --- | --- | --- |
| `ui-assets-preferences.png` | 第2章 | `demo_user` 的钱包、积分、优惠券和薄荷青主题页面，两张实际页面截图拼接。 |
| `ui-amap-picker.png` | 第2章 | 地图选址弹窗及“地图服务尚未配置，仍可填写地址”的真实提示；不表示地图加载或 POI 搜索成功。 |
| `test-terminal-results.png` | 第5章 | 实际执行前端 235 项、后端 340 项测试后的日志摘要，经浏览器排版截图；原始输出与统计随文归档。 |
| `ui-ai-assistant.png` | 第6章 | 输入“鸡腿饭”和预算 30 元后，由本地规则与真实菜单返回的候选商品；未调用外部大模型。 |
| `ui-ai-media-unconfigured.png` | 第6章 | 图片识菜服务未配置时，上传入口禁用且显示明确提示的实际状态。 |

当前不需要用户为上述 4 处重新截图。若需要展示高德地图正常搜索、DeepSeek 对话或 DashScope 图片/语音识别成功结果，仍需先配置有效服务密钥，再执行相应验收；这些成功路径尚未在本次环境中验证。高德选址依赖后端读取的 `AMAP_WEB_KEY`、`AMAP_JS_KEY`、`AMAP_SECURITY_CODE`，仅设置前端构建变量不能满足当前选址实现的全部配置要求。

## 提交打包提醒

依据 `guide/软件工程大作业要求(1).docx` 要求，编译生成 PDF 后请将软件代码及实验报告文档统一打包压缩提交，注意核对封面所有成员学号与姓名（3024244438 范文丽、3024232129 李承文、3024244137 赵紫怡、3024244140 仲禹潼）及压缩包命名规范（`学号+姓名`）。
