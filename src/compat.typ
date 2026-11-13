// 以下に対応するためのパッチ
// - 見出し中の数式・強調・リンク等が HTML 出力で消える (Haita 0.4.0 現在)
// - H3 に id が付かない
//
// #show: rich-heading を, 対象の見出しより前に書く.

// "Exercise N.M" の見出し (level 2 以下) に id="ex-N-M" を付ける (Pagefind のサブ結果とディープリンク用).
#let rich-heading(body) = {
  show heading: h => context if target() == "html" and h.level >= 2 {
    let head = h.body.at("children", default: (h.body,)).first()
    let m = head.at("text", default: "").match(regex("^Exercise (\d+)\.(\d+)"))
    let attrs = if m == none { (:) } else { (id: "ex-" + m.captures.join("-")) }
    html.elem("h" + str(h.level + 1), attrs: attrs, h.body)
  } else {
    h
  }
  body
}
