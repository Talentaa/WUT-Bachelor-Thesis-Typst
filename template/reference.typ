#import "font.typ": *

#pagebreak()

// 支持的引文格式："apa", "chicago-author-date", "ieee", or "mla"
// [] TODO: DIY 国标引文格式
#let bibliography_file = "../reference/refs.bib"

#if bibliography_file != none {
  show bibliography: set text(font: font_family.songti, size: font_size.wuhao)
  show heading : it => {
    set align(center)
    set text(font:font_family.heiti, size: font_size.xiaoer)
    it
  }
  bibliography(bibliography_file,
      title: [参考文献],
      style: "ieee"
  )
}