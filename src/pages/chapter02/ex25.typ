#import "../../lib.typ": cetz, ex

#let conv = math.op("conv")

== Exercise 2.25 (Inner and outer polyhedral approximations)

#ex[
  Let $C subset.eq RR^n$ be a closed convex set, and suppose that
  $x_1, dots, x_K$ are on the boundary of $C$.
  Suppose that for each $i$, $a_i^T (x - x_i) = 0$ defines a supporting
  hyperplane for $C$ at $x_i$, i.e., $C subset.eq {x mid(|) a_i^T (x - x_i) <= 0}$.
  Consider the two polyhedra
  $
    P_"inner" = conv {x_1, dots, x_K}, quad
    P_"outer" = {x mid(|) a_i^T (x - x_i) <= 0, thick i = 1, dots, K}.
  $
  Show that $P_"inner" subset.eq C subset.eq P_"outer"$.
  Draw a picture illustrating this.
]

*解答*:
$P_"inner"$ は $x_1, dots, x_K$ を要素に持つ最小の凸集合 (#link(<ex-2-4>)[演習問題 2.4]) であり, $C$ はこれらを要素に持つ凸集合であるから $P_"inner" subset.eq C$ である.
また, $P_"outer"$ は $C$ を含む半空間の共通部分であるから $C subset.eq P_"outer"$ である.
図を描くと次のようになる. $qed$

#let ex25-fig = cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let (a, b) = (3.0, 2.0)
  let ts = (20deg, 95deg, 160deg, 235deg, 300deg)

  let ink = rgb(130, 130, 130)
  let inner-color = rgb(65, 105, 225)
  let c-color = rgb(34, 139, 34)
  let outer-color = rgb(220, 20, 60)

  // 楕円周上の点
  let pt(t) = (a * calc.cos(t), b * calc.sin(t))
  // 角 t1, t2 における接線同士の交点
  let corner(t1, t2) = {
    let h = calc.cos((t1 - t2) / 2)
    (
      a * calc.cos((t1 + t2) / 2) / h,
      b * calc.sin((t1 + t2) / 2) / h,
    )
  }

  let inner = ts.map(pt)
  let outer = ts
    .enumerate()
    .map(((i, t)) => {
      let t2 = if i + 1 < ts.len() { ts.at(i + 1) } else { ts.at(0) + 360deg }
      corner(t, t2)
    })

  // P_outer
  line(
    ..outer,
    close: true,
    fill: outer-color.transparentize(88%),
    stroke: (paint: outer-color, thickness: 1.2pt),
  )
  // C
  circle(
    (0, 0),
    radius: (a, b),
    fill: c-color.transparentize(85%),
    stroke: (paint: c-color, thickness: 1.2pt),
  )
  // P_inner
  line(
    ..inner,
    close: true,
    fill: inner-color.transparentize(80%),
    stroke: (paint: inner-color, thickness: 1.2pt),
  )

  // 接点
  for (i, t) in ts.enumerate() {
    // circle(pt(t), radius: 0.075, fill: c-color, stroke: none)
    circle(pt(t), radius: 0.075, fill: ink, stroke: none)
    content(
      (1.2 * a * calc.cos(t), 1.2 * b * calc.sin(t)),
      text(size: 0.9em, fill: ink)[$x_#(i + 1)$],
    )
  }

  // 領域ラベル
  content((0, 0), text(size: 0.95em, fill: inner-color)[$P_"inner"$])
  content(pt(340deg).map(v => v * 0.92), text(size: 0.95em, fill: c-color)[$C$])
  content(
    outer.at(0).map(v => v * 1.12),
    text(size: 0.95em, fill: outer-color)[$P_"outer"$],
  )
})

#figure(
  context if target() == "html" { html.frame(ex25-fig) } else { ex25-fig },
  caption: [$P_"inner"$ (青) $subset.eq C$ (緑) $subset.eq P_"outer"$ (赤)],
)
