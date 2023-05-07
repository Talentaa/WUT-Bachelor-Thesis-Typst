// 封面
#import "font.typ": *
#import "../contents/info.typ": *

#set page(
    header: none,
    footer: none
)
// 封面页码置0
#counter(page).update(0)

#align(center)[
  #v(70pt)
  
  #table(
    columns: (auto),
    rows: (auto, auto ,auto),
    stroke: none,
    gutter: 9pt,

    text(font: font_family.zhongsong, size: font_size.yihao)[武汉理工大学毕业设计（论文）]
    
  )

  #v(70pt)
  #text(font: font_family.heiti, size: font_size.erhao)[#title]
  

  #v(90pt)

  #let info_value(body) = {
    rect(
      width: 100%,
      stroke: (bottom: 1pt + black),
      text(font: font_family.zhongsong,size: font_size.sanhao)[#body]
    ) 
  }
  
  #let info_key(body) = {
    rect(
      width: 100%,
      stroke: none,
      text(font: font_family.zhongsong,size: font_size.sanhao)[#body]
    )
  }

  #grid(
    columns: (110pt, 170pt),
    rows : (45pt, 45pt),
    gutter: 4pt,
    info_key("学院（系）："),
    info_value(college),
    info_key("专业班级："),
    info_value(major),
    info_key("学生姓名："),
    info_value(student_name),
    info_key("指导老师："),
    info_value(advisor),
  )
]