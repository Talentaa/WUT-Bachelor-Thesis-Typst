#import "font.typ": *
#import "../contents/info.typ": *
#import "../contents/abstract.typ": *



#show heading: it => {
    set align(center)
    set text(font: font_family.heiti, size: font_size.xiaoer)
    it
    par(leading: 1.5em)[#text(size: 0.0em)[#h(0.0em)]]
}

// 页眉页脚格式
#set page(
    header: none,
    footer: [
        #set align(center)
        #set text(font: font_family.songti, size: font_size.xiaowu) 
        #counter(page).display("I")
    ]
)

// 摘要页码
#pagebreak()
#counter(page).update(1)


#v(2em)
#align(center)[
    #text(font: font_family.heiti, size: font_size.xiaoer)[摘  要]
]

#v(1.5em)
#par(justify: false,leading: 1em,first-line-indent: 2em)[
    #text(font: font_family.songti, size: font_size.xiaosi)[#abstract_zh]
]

#v(2em)
#par(first-line-indent: 0em)[
    #text(weight: "bold", font: font_family.heiti, size: font_size.sihao)[关键词：]
    #text(font: font_family.songti, size: font_size.xiaosi)[#keywords_zh.join("；") ]
]

#pagebreak() 

//英文摘要页
#v(2em)
#align(center)[
    #text(weight: "bold", font: font_family.heiti, size: font_size.xiaoer)[Abstract]
]

#v(1.5em)
#par(justify: false, leading: 1em, first-line-indent: 2em)[
    #text(font: font_family.songti, size: font_size.xiaosi)[#abstract_en]
]
    
#v(2em)
#par(first-line-indent: 0em)[
    #text(weight: "bold", font: font_family.heiti, size: font_size.sihao)[Key words: ]
    #text(font: font_family.heiti, size: font_size.xiaosi)[#keywords_en.join("; ") ]
]

