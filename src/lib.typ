#import "@preview/cetz:0.5.2"

// (a), (b), (c), ... で番号づけする enum 関数
#let alpha-enum(..items, start: 1) = context {
  if target() == "html" {
    html.elem(
      "ol",
      attrs: (
        role: "list",
        start: str(start),
        style: "list-style: none; padding: 0; margin: 0.5em 0;",
      ),
      items
        .pos()
        .enumerate(start: start)
        .map(((i, body)) => html.elem(
          "li",
          attrs: (style: "padding-left: 2em;"),
          html.elem(
            "span",
            attrs: (style: "display: inline-block; width: 2em; margin: 0 0 0 -2em; color: var(--en-prose-counters);"),
            numbering("(a)", i),
          )
            + body,
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
        attrs: (style: "margin-top: 0.6em; font-size: 0.82em; opacity: 0.7; text-align: right;"),
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
      text(lang: "en")[#text(fill: rgb("#f97316"), size: 1.3em, weight: "bold")[“]#body]
      // linebreak()
      // text(size: 0.82em, fill: luma(55%), lang: "en")[— Boyd and Vandenberghe, _Convex Optimization_]
      block(below: 0em, width: 100%, align(right, text(size: 0.82em, fill: luma(55%), lang: "en")[
        — Boyd and Vandenberghe, _Convex Optimization_
      ]))
    },
  )
}

// 進捗バー 1 行分.
#let progress-row(name, solved, total) = context {
  let ratio = if total > 0 { solved / total } else { 0.0 }
  let pct = calc.round(ratio * 100, digits: 1)
  let count = str(solved) + " / " + str(total)

  if target() == "html" {
    html.elem(
      "div",
      attrs: (
        style: "display: grid; grid-template-columns: 1fr 8em 4.5em; align-items: center; gap: 0.8em; margin: 0.5em 0;",
      ),
      {
        html.elem("span", name)
        html.elem(
          "div",
          attrs: (
            style: "background: color-mix(in srgb, currentColor 15%, transparent); height: 0.5em; border-radius: 0.25em; overflow: hidden;",
          ),
          html.elem(
            "div",
            attrs: (style: "background: #16a34a; width: " + str(pct) + "%; height: 100%; border-radius: inherit;"),
            [],
          ),
        )
        html.elem(
          "span",
          attrs: (style: "font-variant-numeric: tabular-nums; opacity: 0.7; text-align: right;"),
          count,
        )
      },
    )
  } else {
    grid(
      columns: (1fr, 8em, 4.5em),
      align: (left + horizon, left + horizon, right + horizon),
      column-gutter: 0.8em,
      name,
      box(
        width: 100%,
        height: 0.5em,
        radius: 0.25em,
        fill: luma(85%),
        align(left, rect(width: ratio * 100%, height: 100%, radius: 0.25em, fill: rgb("#16a34a"))),
      ),
      text(fill: luma(45%), count),
    )
  }
}
