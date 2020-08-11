# XAUATthesis
## 总览
A LaTeX thesis template for Xi'an University of Architecture and Technology

西安建筑科技大学研究生学位论文模板 XAUATthesis

v1.0.0 Beta

## 主要参考资料
* [西安建筑科技大学2017级研究生手册](http://gs.xauat.edu.cn)（或见/attachments）
* [LATEX2E for class and package writers](https://www.latex-project.org)
* [LATEX2E for authors](https://www.latex-project.org)
* The LaTeX Companion, Second Edition. by Frank Mittelbach, Michel Goossens, et al.
* [marquistj13/TongjiThesis 2020/07/18](https://github.com/marquistj13/TongjiThesis)

## 版本说明
* 本版本为XAUATthesis v1.0，可能存在`疏漏与错误`，有兴趣使用的同学发现问题请告知于我；或提出建议，笔者将不胜感激；
* 本模板原则上按照[西安建筑科技大学2017级研究生手册](http://gs.xauat.edu.cn)中`《学位论文撰写标准》`一章进行编写，但是该章`缺乏维护`，许多详尽要求未给出，甚至存在过时要求，式样落后等；笔者在局部位置作了调整；
* 未引入cleveref宏包，目前`CTeX`与`hyperref`、`cleveref `似乎还有不兼容之处，见[ctex, hyperref, cleveref 宏包冲突](https://gitmemory.com/issue/CTeX-org/ctex-kit/524/648526619)；
* XAUATthesis在win 10系统，TeXlive 2020、MikTeX 20.6.29发行版可正常编译，在此感谢飘大王。

## 使用说明
* 本模板包含`XAUATthesis.cls`（模板文件），`XAUATthesis.cfg`（配置文件），`XAUATutils.sty`（引入宏包文件）及主文档`XAUATthesis.tex`;
* 章.tex文件在/data中，图片在/figures中，参考文献在/ref中；
* 采用`biber`后端编译参考文献；
* XAUATthesis 提供的选项包括：
  | Keyval     | Option             | Notes                                           |
  | ---------- | ------------------ | ----------------------------------------------- |
  | degree     | master/doctor      | 必选，硕士/博士                                  |
  | secret     | none/one/two/three | 必选，公开/保密1年/保密2年/保密3年                |
  | bibtype    | numeric/authoryear | 可选，默认为数字型引用                            |
  | electronic |                    | 可选，电子版（打印时删除）                        |
  | pifootnote |                    | 脚注标记中使用 \pkg{pifont} 的带圈数字，默认已打开 |
* 关于选项中的保密选项，声明页的文本会`自动调整`。

## 更新说明
* 未来更新将作说明。
