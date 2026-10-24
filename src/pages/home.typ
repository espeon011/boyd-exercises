#import "../lib.typ": progress-row
#set cite(style: "alphanumeric")

#title[About] <home>

ここは #cite(<BV04>, form: "prose") の演習問題を解いた結果を置いておく場所です.
本解答は個人が作成したものであり, 原著および著者らとは無関係です.

ソースコードは https://github.com/espeon011/boyd-exercises にあります.
Typst パッケージの #link("https://typst.app/universe/package/haita")[Haita] を用いています.

#context if target() == "html" {
  [#link("./cvxex-myans.pdf")[PDF 版]もあります. ]
} else {
  [#link("https://espeon011.github.io/boyd-exercises/")[Web 版]もあります. ]
}

= Progress

*Part I Theory*

#progress-row("Chapter 2: Convex sets", 39, 39)
#progress-row("Chapter 3: Convex functions", 9, 60)
#progress-row("Chapter 4: Convex optimization problems", 0, 65)
#progress-row("Chapter 5: Duality", 0, 44)

*Part II Applications*

#progress-row("Chapter 6: Approximation and fitting", 0, 14)
#progress-row("Chapter 7: Statistical estimation", 0, 13)
#progress-row("Chapter 8: Geometric problems", 0, 30)

*Part III Algorithms*

#progress-row("Chapter 9: Unconstrained minimization", 0, 32)
#progress-row("Chapter 10: Equality constrained minimization", 0, 16)
#progress-row("Chapter 11: Interior-point methods", 0, 24)

#text(lang: "en")[
  #bibliography("../refs.yaml")
]
