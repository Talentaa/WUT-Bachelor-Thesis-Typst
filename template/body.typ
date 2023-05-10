#import "font.typ": *
#import "utils.typ": *

#pagebreak()
#counter(page).update(1)

// 章节计数器，记录公式层级
#let counter_chapter   = counter("chapter")
#let counter_equation  = counter(math.equation)
#let counter_image     = counter(figure.where(kind: image))
#let counter_table     = counter(figure.where(kind: table))

// 图片和表的格式
#show figure: it => [
    #set text(font: font_family.songti, size: font_size.xiaosi)
    #set align(center)

    #if not it.has("kind") {
      it
    } else if it.kind == image {
      it.body
      [
        #textbf("图")
        #locate(loc => {
          [#counter_chapter.at(loc).first().#counter_image.at(loc).first()]
        })
        #it.caption
      ]
    } else if it.kind == table {
      [
        #textbf("表")
        #locate(loc => {
          [#counter_chapter.at(loc).first().#counter_table.at(loc).first()]
        })
        #it.caption
      ]
      it.body
    } else {
      it.body
    }
]

// 设置公式格式
#set math.equation(
  numbering: (..nums) => locate( loc => {
      numbering("（1.1）", counter_chapter.at(loc).first(), ..nums)
  })
)

// 设置引用格式
#show ref: it => {
  locate(loc => {
  let elems = query(it.target, loc)

  if elems == () {
    super(it)
  } else {
    let elem = elems.first()
    let elem_loc = elem.location()

    if numbering != none {
      if elem.func() == math.equation {
        link(elem_loc, [#textbf("式")
          #counter_chapter.at(elem_loc).first().#counter_equation.at(elem_loc).first()
        ])
      } else if elem.func() == figure{
        if elem.kind == image {
          link(elem_loc, [#textbf("图")
            #counter_chapter.at(elem_loc).first().#counter_image.at(elem_loc).first()
          ])
        } else if elem.kind == table {
          link(elem_loc, [#textbf("表")
            #counter_chapter.at(elem_loc).first().#counter_table.at(elem_loc).first()
          ])
        }
      }
    } else {
      it
    }
  }
})
}


#set heading(numbering: (..nums) => {
  if nums.pos().len() == 1 {
    "第 " + numbering("1", ..nums) +  " 章"
  } else {
    numbering("1.1", ..nums)
}})


#let sized_heading(it, size) = [
  #set text(size, font: font_family.heiti)
  #v(0.5em)
  #if it.numbering != none {
    counter(heading).display()
  }
  #it.body
  #v(0.5em)
]


#show heading: it =>  {
  set par(first-line-indent: 0em)

  if it.level == 1 {
    set align(center)
    counter_chapter.step()
    counter_equation.update(())
    counter_image.update(())
    counter_table.update(())
    sized_heading(it, font_size.xiaoer)
  } else if it.level == 2 {
    sized_heading(it, font_size.sanhao)
  } else if it.level == 3 {
    sized_heading(it, font_size.sihao)
  } else {
    sized_heading(it, font_size.xiaosi)
  }
}

// 设置正文格式
#set align(left + top)
#set text(font: font_family.songti, size: font_size.xiaosi)
#set par(justify: true, leading: 10pt, first-line-indent: 2em)
#include "../contents/context.typ"