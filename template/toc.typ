#import "font.typ": *

#set page(
  header: none,
  footer: none
)

// 目录
#v(1.5em)
#align(center)[
    #text(font: font_family.heiti, size: font_size.xiaoer, "目    录")
]

#parbreak();
#show outline: it => {
  set text(font: font_family.songti, size: font_size.xiaosi)
  set par(leading: 1.2em )
  it
}

#outline(
  title: none,
  indent : true,
)