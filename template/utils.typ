#import "font.typ": *

// zhnumbers 工具函数
// @param: num, level 1 的章节数字
// @return: zhnum, num 对应的汉语数字

#let zhnumbers(num) = {
    ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(int(num))
}


// textbf 工具函数
// @param: it, 要加粗的文本
// @return: text, 加粗的文本
#let textbf(it) = [
    #set text(weight: "semibold")
    #it
]


// textit 工具函数
// @param: it, 要斜体的文本
// @return: text, 斜体的文本
#let textit(it) = [
    #set text(style: "italic")
    #it
]