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
    screenshots/              # 本服务器实际运行项目后的浏览器截图
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
