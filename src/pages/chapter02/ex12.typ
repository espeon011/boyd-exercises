#import "../../lib.typ": alpha-enum, cetz, ex

#let dist = math.op("dist")

== Exercise 2.12

#ex[
  Which of the following sets are convex?

  #alpha-enum(
    [
      A _slab_, i.e., a set of the form ${x in RR^n mid(|) alpha <= a^T x <= beta}$.
    ],
    [
      A _rectangle_, i.e., a set of the form
      ${x in RR^n mid(|) alpha_i <= x_i <= beta_i, i = 1, dots, n}$.
      A rectangle is sometimes called a _hyperrectangle_ when $n > 2$.
    ],
    [
      A _wedge_, i.e., ${x in RR^n mid(|) a_1^T x <= b_1, a_2^T x <= b_2}$.
    ],
    [
      The set of points closer to a given point than a given set, i.e.,

      $ { x mid(|) norm(x - x_0)_2 <= norm(x - y)_2 "for all" y in S } $

      where $S subset.eq RR^n$.
    ],
    [
      The set of points closer to one set than another, i.e.,

      $ { x mid(|) dist(x, S) <= dist(x, T) }, $

      where $S, T subset.eq RR^n$, and

      $ dist(x, S) = inf { norm(x - z)_2 mid(|) z in S }. $
    ],
    [
      \[HUL93, volume 1, page 93\] The set ${ x mid(|) x + S_2 subset.eq S_1 }$,
      where $S_1, S_2 subset.eq RR^n$ with $S_1$ convex.
    ],
    [
      The set of points whose distance to $a$ does not exceed a fixed fraction
      $theta$ of the distance to $b$, i.e., the set
      ${ x mid(|) norm(x - a)_2 <= theta norm(x - b)_2 }$.
      You can assume $a eq.not b$ and $0 <= theta <= 1$.
    ],
  )
]

*解答*:
この中で凸でないのは (e) のみである.
#alpha-enum(
  [
    線形不等式系の解集合であるため多面体であり, 従って凸である.
  ],
  [
    線形不等式系の解集合であるため多面体であり, 従って凸である.
  ],
  [
    線形不等式系の解集合であるため多面体であり, 従って凸である.
  ],
  [
    これは凸集合の共通部分であるため凸である. 実際,
    $
      {x mid(|) norm(x - x_0)_2 <= norm(x - y)_2 "for all" y in S} = inter.big_(y in S) {x mid(|) norm(x - x_0)_2 <= norm(x - y)_2}
    $
    であり, 各 ${x mid(|) norm(x - x_0)_2 <= norm(x - y)_2}$ は #link(<ex-2-7>)[演習問題 2.7] より半空間であり, 凸である.
  ],
  [
    これは一般には凸にはならない.
    $S = {x in RR^2 mid(|) x_2 = 0}$, $T = {(0, 1)^T}$ とする.
    このとき
    $
      { x mid(|) dist(x, S) <= dist(x, T) } & = {x mid(|) x_2^2 <= x_1^2 + (x_2 - 1)^2} \
                                            & = {x mid(|) x_2 <= (x_1^2 + 1) / 2}
    $
    これは平面を下向きの放物線で区切った時の下側の集合であるため凸でない.
    例えば $(1, 1)^T$ と $(-1, 1)^T$ は両方この集合に属するがその中点である $(0, 1)$ は属さない.

    #let non-convex-figure = cetz.canvas(length: 1cm, {
      import cetz.draw: *

      let f(x) = (x * x + 1) / 2
      let (xmin, xmax) = (-2.8, 2.8)
      let (ymin, ymax) = (-1.6, 4.6)
      let samples = 100
      let parabola = range(samples + 1).map(i => {
        let x = xmin + (xmax - xmin) * i / samples
        (x, f(x))
      })

      let ink = rgb(130, 130, 130)
      let set-color = rgb(65, 105, 225)
      let src-color = rgb(34, 139, 34)
      let pt-color = rgb(220, 20, 60)

      // 集合 {x | dist(x, S) <= dist(x, T)} = {x | x_2 <= (x_1^2 + 1) / 2}
      line(
        ..parabola,
        (xmax, ymin),
        (xmin, ymin),
        close: true,
        fill: set-color.transparentize(78%),
        stroke: none,
      )

      // 座標軸
      set-style(stroke: (paint: ink, thickness: 0.6pt), mark: (end: "straight", fill: ink, scale: 0.7))
      line((xmin - 0.4, 0), (xmax + 0.5, 0))
      line((0, ymin - 0.3), (0, ymax + 0.3))
      set-style(mark: (end: none))
      content((xmax + 0.6, 0), anchor: "west", text(fill: ink, size: 0.85em)[$x_1$])
      content((0, ymax + 0.4), anchor: "south", text(fill: ink, size: 0.85em)[$x_2$])

      // 境界の放物線
      line(..parabola, stroke: (paint: set-color, thickness: 1.2pt))
      content(
        (0.25, -1.25),
        anchor: "west",
        text(fill: set-color, size: 0.9em)[$x_2 <= (x_1^2 + 1) \/ 2$],
      )

      // S = {x | x_2 = 0}
      line((xmin - 0.2, 0), (xmax + 0.2, 0), stroke: (paint: src-color, thickness: 1.6pt))
      content((xmin - 0.1, 0.25), anchor: "east", text(fill: src-color, size: 0.9em)[$S$])

      let point(pos, label, anchor: "south-west", color: black) = {
        circle(pos, radius: 0.075, fill: color, stroke: none)
        content(pos, anchor: anchor, padding: 4pt, text(fill: color, size: 0.9em, label))
      }

      // 線分の両端は集合に属する
      line((-1, 1), (1, 1), stroke: (paint: pt-color, thickness: 1.2pt, dash: "dashed"))
      point((-1, 1), $mat(-1; 1)$, anchor: "north-east", color: pt-color)
      point((1, 1), $mat(1; 1)$, anchor: "north-west", color: pt-color)

      // 中点 (0, 1)^T は集合に属さない
      circle((0, 1), radius: 0.14, fill: white, stroke: (paint: pt-color, thickness: 1.2pt))
      circle((0, 1), radius: 0.075, fill: src-color, stroke: none)
      content((0, 1.2), anchor: "south", text(fill: pt-color, size: 0.85em)[中点 $mat(0; 1)$])
      content((0, 2), anchor: "south", text(fill: src-color, size: 0.9em)[$T = {mat(0; 1)}$])
    })

    #figure(
      context if target() == "html" { html.frame(non-convex-figure) } else { non-convex-figure },
      caption: [$dist(x, S) <= dist(x, T)$ を満たす点全体 (青色領域) は凸でない],
    )
  ],
  [
    $C = {x mid(|) x + S_2 subset.eq S_1}$ とおく. $C$ が凸であることを示す.
    $x, y in C$ とし, $theta in [0, 1]$ とする. $z = theta x + (1 - theta) y$ が $C$ に属することを示す.
    任意の $v in S_2$ に対し,$x + v in S_1$, $y + v in S_1$ かつ $S_1$ が凸であることから,
    $
      z + v = theta (x + v) + (1 - theta) (y + v) in S_1
    $
    である. 従って $z + S_2 subset.eq S_1$ であり, $z in C$ である. ゆえに $C$ は凸である.
  ],
  [
    $theta = 1$ のときこれは #link(<ex-2-7>)[演習問題 2.7] より半空間であるため凸である.
    $theta < 1$ としてこの集合が凸であることを示す.
    条件式を同値変形すると
    $
      norm(x - a)_2 <= theta norm(x - b)_2 & <=> norm(x - a)_2^2 <= theta^2 norm(x - b)_2^2 \
      & <=> sum_(i=1)^n (x_i - a_i)^2 <= theta^2 sum_(i=1)^n (x_i - b_i)^2 \
      & <=> sum_(i=1)^n ((1 - theta^2) x_i^2 -2 (a_i - theta^2 b_i) x_i + a_i^2 - theta^2 b_i^2) <= 0 \
      & <=> sum_(i=1)^n (x_i^2 -2 (a_i - theta^2 b_i) / (1 - theta^2) x_i + (a_i^2 - theta^2 b_i^2) / (1 - theta^2)) <= 0 \
      & <=> sum_(i=1)^n (x_i - (a_i - theta^2 b_i) / (1 - theta^2))^2 <= theta^2 / (1 - theta^2)^2 sum_(i=1)^n (a_i - b_i)^2
    $
    となる. これが表す集合は球体であり, 凸である. $qed$
  ],
)
