#import "@preview/cetz:0.5.2"

// (a), (b), (c), ... で番号づけする enum 関数
#let alpha-enum(..items, start: 1) = context {
  if target() == "html" {
    html.elem(
      "ol",
      attrs: (style: "list-style: none; padding: 0; margin: 0.5em 0 0.5em 1.5em;"),
      items
        .pos()
        .enumerate()
        .map(((i, body)) => html.elem(
          "li",
          attrs: (style: "display: flex; align-items: baseline; margin: 0.4em 0; padding: 0;"),
          {
            html.elem(
              "span",
              attrs: (style: "flex: none; margin: 0 0.5em 0 0; padding: 0;"),
              numbering("(a)", i + start),
            )
            html.elem("div", attrs: (style: "margin: 0; padding: 0; min-width: 0;"), body)
          },
        ))
        .join(),
    )
  } else {
    enum(numbering: "(a)", start: start, ..items)
  }
}

#let quote-mark() = html.elem(
  "span",
  attrs: (
    "aria-hidden": "true",
    "data-pagefind-ignore": "",
    style: "font-family: Georgia, 'Times New Roman', serif; font-size: 2.2em; line-height: 0; vertical-align: -0.45em; color: #f97316; margin-right: 0.08em;",
  ),
  "\u{201C}",
)

#let ex(body) = context if target() == "html" {
  html.elem(
    "blockquote",
    attrs: (
      cite: "https://web.stanford.edu/~boyd/cvxbook/",
      lang: "en",
      style: "border-inline-start-color: #f97316; font-style: normal; quotes: none;",
    ),
    {
      html.elem("div", quote-mark() + body)
      html.elem(
        "footer",
        attrs: (style: "margin-top: 0.6em; font-size: 0.82em; opacity: 0.7;"),
        {
          "— Boyd and Vandenberghe, "
          html.elem("cite", attrs: (style: "font-style: normal;"), "Convex Optimization")
        },
      )
    },
  )
} else {
  block(
    width: 100%,
    inset: (left: 0.9em, top: 0.2em, bottom: 0.2em),
    stroke: (left: 2pt + rgb("#f97316")),
    {
      text(fill: luma(45%), lang: "en")[#text(fill: rgb("#f97316"), size: 2.2em, weight: "bold")[“]#body]
      linebreak()
      text(size: 0.82em, fill: luma(55%), lang: "en")[— Boyd and Vandenberghe, _Convex Optimization_]
    },
  )
}
