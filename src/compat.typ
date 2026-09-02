// haita 0.4.0 の new-hamber.typ が見出し本文を to-string で文字列化するため,
// 見出し中の数式・強調・リンク等が HTML 出力で消える.
// https://github.com/wensimehrp/haita/blob/main/new-hamber.typ
//
// #show: rich-heading を, 対象の見出しより前に書く.
#let rich-heading(body) = {
  show heading: h => context if target() == "html" and h.level >= 2 {
    html.elem("h" + str(h.level + 1), h.body)
  } else {
    h
  }
  body
}
