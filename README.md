# XAUATthesis
## 总览
A LaTeX thesis template for Xi'an University of Architecture and Technology

西安建筑科技大学研究生学位论文模板 XAUATthesis

v1.1.1

## 在线编译平台
* [Overleaf](https://www.overleaf.com/latex/templates/xi-an-jian-zhu-ke-ji-da-xue-latexyan-jiu-sheng-xue-wei-lun-wen-mo-ban/hmpdycycnmqd)
* [TeXPage](https://www.texpage.com/template/e327e4b2-1bae-42da-961b-64213a7e8ebc)


## 主要参考资料
* 《西安建筑科技大学研究生学位论文撰写标准（西建大研〔2023〕7号）》
* [《关于启用新版博士、硕士学位论文封面的通知》](https://gs.xauat.edu.cn/info/1023/3446.htm)
* [LATEX2E for class and package writers](https://www.latex-project.org)
* [LATEX2E for authors](https://www.latex-project.org)
* The LaTeX Companion, Second Edition. by Frank Mittelbach, Michel Goossens, et al.
* [marquistj13/TongjiThesis 2020/07/18](https://github.com/marquistj13/TongjiThesis)

## 版本说明
* 本版本为XAUATthesis v1.1.1 `疏漏与错误`，有兴趣使用的同学发现问题请告知于我；
* 本模板原则上按照《西安建筑科技大学研究生学位论文撰写标准（西建大研〔2023〕7号）》、《关于启用新版博士、硕士学位论文封面的通知》编写，仅供参考。

## 使用说明
* 本模板包含`XAUATthesis.cls`（模板文件），`XAUATcover.cls`（模板文件），`XAUATthesis.cfg`（配置文件），`XAUATutils.sty`（引入宏包文件）及主文档`XAUATthesis.tex`和封面文档`XAUATcover.tex`；
* 章.tex文件在/data中，图片在/figures中，参考文献在/ref中；
* 采用`biber`后端编译参考文献；
* XAUATthesis 提供的选项包括：
  | Keyval     | Option             | Notes                                           |
  | ---------- | ------------------ | ----------------------------------------------- |
  | degree     | master/doctor      | 必选，硕士/博士                                  |
  | secret     | none/one/two/three | 必选，公开/保密1年/保密2年/保密3年                |
  | bibtype    | numeric/authoryear | 可选，默认为数字型引用                            |
* 关于选项中的保密选项，声明页的文本会`自动调整`；
* v1.1.1新增了`XAUATcover`，使用时编译`XAUATcover.tex`即可，数据将自动从`XAUATthesis.cfg`和`data/cover.tex`导入。

## 更新说明

* 2024-06-05 更新参考文献间距

### v1.1.1
* 2024-04-18 设计了XAUATcover

### v1.1.0
* 2024-04-16 按照《西安建筑科技大学研究生学位论文撰写标准（西建大研〔2023〕7号）》要求更新了封面和格式
### v1.0.1
* 2022-09-16 use *tabularray* package
* 2022-09-16 Remove *layout* package
### v1.0.0
* 2021-05-26 修复threeparttable字号问题
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