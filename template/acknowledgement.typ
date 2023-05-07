#import "font.typ" : *

#pagebreak()

#show heading : it => {
  v(0.5em)
  set align(center)
  set text(font: font_family.heiti, size: font_size.xiaoer)
  it
  v(1em)
  par(leading: 20pt)[#text(size:0.0em)[#h(0.0em)]]
}

#heading(level: 1)[致 谢]

// 设置段落格式
#set align(left + top)
#set text(font: font_family.songti, size: font_size.xiaosi)
#set par(justify: true, leading: 10pt, first-line-indent: 2em)
#include "../contents/acknowledgement.typ"