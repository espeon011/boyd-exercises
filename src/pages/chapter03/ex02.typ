#import "../../lib.typ": cetz, ex

== Exercise 3.2 (Level sets of convex, concave, quasiconvex, and quasiconcave functions)

#let fig-ex-3-2-a = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let c = luma(50%)
  set-style(stroke: 0.6pt + c)

  // f = 1
  catmull(
    (0.05, 0.5),
    (0.6, 0.38),
    (0.85, 0.15),
    (0.6, -0.1),
    (-0.2, -0.5),
    (-0.33, -0.35),
    (-0.3, 0.0),
    (-0.15, 0.35),
    close: true,
  )
  // f = 2
  catmull(
    (0.15, 1.0),
    (0.9, 0.6),
    (1.2, 0.25),
    (1.0, -0.2),
    (-0.6, -1.3),
    (-0.97, -1.1),
    (-0.9, -0.4),
    (-0.6, 0.5),
    close: true,
  )
  // f = 3
  catmull(
    (0.1, 1.45),
    (1.2, 1.0),
    (1.8, 0.3),
    (1.4, -0.4),
    (-0.75, -1.65),
    (-1.4, -1.2),
    (-1.28, -0.4),
    (-0.8, 0.75),
    close: true,
  )

  for (y, l) in ((0.55, [1]), (1.05, [2]), (1.5, [3])) {
    content((0.05, y), anchor: "south", text(9pt, fill: c, l))
  }
})

#let fig-ex-3-2-b = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let c = luma(50%)
  set-style(stroke: 0.6pt + c)

  let curves = (
    ((0.0, 0.3), (0.4, 1.6), (1.0, 2.8), (2.0, 3.8), (3.62, 4.35)),
    ((0.33, 0.3), (0.75, 1.6), (1.3, 2.7), (2.2, 3.65), (3.62, 4.22)),
    ((0.75, 0.3), (1.2, 1.5), (1.8, 2.6), (2.6, 3.4), (3.62, 4.02)),
    ((1.38, 0.3), (1.7, 1.2), (2.2, 2.1), (2.9, 3.05), (3.62, 3.6)),
    ((2.24, 0.3), (2.4, 1.1), (2.8, 1.9), (3.2, 2.4), (3.62, 2.65)),
    ((3.4, 0.3), (3.3, 0.9), (3.4, 1.35), (3.62, 1.55)),
  )
  for (i, pts) in curves.enumerate() {
    catmull(..pts)
    content((pts.first().at(0), 0.15), anchor: "north", text(9pt, fill: c)[#(i + 1)])
  }
})

#ex[
  Some level sets of a function $f$ are shown below.
  The curve labeled 1 shows ${x mid(|) f(x) = 1}$, etc.

  #figure(
    context if target() == "html" { html.frame(fig-ex-3-2-a) } else { fig-ex-3-2-a },
  )

  Could $f$ be convex (concave, quasiconvex, quasiconcave)? Explain your answer.
  Repeat for the level curves shown below.

  #figure(
    context if target() == "html" { html.frame(fig-ex-3-2-b) } else { fig-ex-3-2-b },
  )
]

*解答*: 1 つ目の図では ${x mid(|) f(x) = 3}$ 上の 2 点を適切にとればそれらを結ぶ線分が ${x mid(|) f(x) = 1}$ と交わるようにできる.
従って $3$-superlevel set ${x mid(|) f(x) >= 3}$ は凸でないため, 準凹ではない.
従って凹にもなり得ない.
凸にはなり得る.

2 つ目の図でも同様に ${x mid(|) f(x) = 1}$ 上の 2 点を適切に取ってそれらを結ぶ線分が ${x mid(|) f(x) = 2}$ を交わるようにできるため $1$-sublevel set ${x mid(|) f(x) <= 1}$ は凸ではない.
従って $f$ は準凸ではなく, ゆえに凸でもない.
凹にはなり得る.
$qed$
