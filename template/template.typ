#import "font.typ": *

#let wut(
    // 参考文献bib文件路径
) = {
    set page(
        paper: "a4",
        margin: (
            top: 2.54cm,
            bottom: 2.54cm,
            left: 3.17cm,
            right: 2.75cm
        ),
        footer: [
            #set align(center)
            #set text(font: font_family.songti, size: font_size.xiaowu)
            
            #counter(page).display("1")
        ],
        header: {
            set text(font: font_family.songti, size: font_size.xiaowu)
            set align(center)
            [武汉理工大学毕业设计（论文）]  
            line(length: 100%, stroke: 0.1pt)
        }
    )

    // 封面
    include "cover.typ"

    // 声明 
    include "declaration.typ"

    // 摘要 
    include "abstract.typ"

    // 目录 
    include "toc.typ"
    
    // 正文  
    include "body.typ"

    // 参考文献 
    include "reference.typ"

    //附录 
    include "appendix.typ"

    // 致谢 
    include "acknowledgement.typ"
}