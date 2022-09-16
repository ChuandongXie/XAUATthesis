# XAUATthesis
## 总览
A LaTeX thesis template for Xi'an University of Architecture and Technology

西安建筑科技大学研究生学位论文模板 XAUATthesis

v1.0.0

## 主要参考资料
* [西安建筑科技大学2017级研究生手册](http://gs.xauat.edu.cn)（或见/attachments）
* [LATEX2E for class and package writers](https://www.latex-project.org)
* [LATEX2E for authors](https://www.latex-project.org)
* The LaTeX Companion, Second Edition. by Frank Mittelbach, Michel Goossens, et al.
* [marquistj13/TongjiThesis 2020/07/18](https://github.com/marquistj13/TongjiThesis)

## 重要说明
* `XAUATthesis v1.0.0 `主要根据研究生手册论文要求编写，可能还有些内容需要完善。目前本人正在进行论文写作，cls文件一直处于完善状态，最新的cls文件会更新到patch-1。

## 版本说明
* 本版本为XAUATthesis v1.0.0 `疏漏与错误`，有兴趣使用的同学发现问题请告知于我；或提出建议，笔者将不胜感激；
* 本模板原则上按照[西安建筑科技大学2017级研究生手册](http://gs.xauat.edu.cn)中`《学位论文撰写标准》`一章进行编写，但是该章`缺乏维护`，许多详尽要求未给出，甚至存在过时要求，式样落后等；笔者在局部位置作了调整；
* 封面`西安建筑科技大学`采用华文行楷字体；
* XAUATthesis在TeXlive 2022、MikTeX 20.6.29发行版可正常编译。

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
* 关于选项中的保密选项，声明页的文本会`自动调整`。

## 更新说明
* 2021-05-26 修复threeparttable字号问题;
* 2021-05-26 解决警告"Font FandolSong-Regular does not contain requested(fontspec) Script"
* 2021-07-20 引入cleveref包
* 2021-11-16 删除pifootnote
* 2021-11-16 subsubsection缩进2\ccwd
* 2021-11-17 float，锁定浮动体位置
* 2021-11-25 caption 居中
* 2021-11-25 cleveref 公式
* 2022-01-02 use subcaption
* 2022-01-05 重新编排.cls
* 2022-01-06 引入wrapfig包
* 2022-09-16 使用TexLive 2022