#import "../../lib.typ": alpha-enum, cetz, ex

// 頂点 origin, 角度 start 〜 stop の 2 次元凸錐を扇形として描く
#let cone(start, stop, r: 3.0, origin: (0, 0), paint: blue, samples: 48) = {
  import cetz.draw: line
  let (ox, oy) = origin
  let pt(t) = (ox + r * calc.cos(t), oy + r * calc.sin(t))
  let arc-pts = range(samples + 1).map(i => pt(start + (stop - start) * i / samples))
  line(origin, ..arc-pts, close: true, fill: paint.transparentize(85%), stroke: none)
  line(pt(start), origin, pt(stop), stroke: (paint: paint, thickness: 1.1pt))
}

// 角度 a, b の 2 方向が直交することを示す記号
#let right-angle(a, b, s: 0.5, paint: luma(45%)) = {
  import cetz.draw: line
  let (ax, ay) = (s * calc.cos(a), s * calc.sin(a))
  let (bx, by) = (s * calc.cos(b), s * calc.sin(b))
  line((ax, ay), (ax + bx, ay + by), (bx, by), stroke: (paint: paint, thickness: 0.6pt))
}

== Exercise 2.29 (Cones in $RR^2$)

#ex[
  Suppose $K subset.eq RR^2$ is a closed convex cone.

  #alpha-enum(
    [
      Give a simple description of $K$ in terms of the polar coordinates of its
      elements ($x = r (cos phi, sin phi)$ with $r >= 0$).
    ],
    [
      Give a simple description of $K^*$, and draw a plot illustrating the
      relation between $K$ and $K^*$.
    ],
    [
      When is $K$ pointed?
    ],
    [
      When is $K$ proper (hence, defines a generalized inequality)?
      Draw a plot illustrating what $x prec.eq_K y$ means when $K$ is proper.
    ],
  )
]

*解答*: 以下 $K eq.not nothing$ とする.
#alpha-enum(
  [
    $K = RR^2$ または $K = RR v$ ($exists v in RR^2$) または $K = {0}$ の場合を除けば $l in [0, 2 pi]$, $theta in [0, pi]$ を用いて
    $
      K = {0} union {r (cos phi, sin phi) mid(|) r > 0, quad l <= phi <= l + theta}
    $
    と表せる.
  ],
  [
    $K = RR^2$ の場合は $K^* = {0}$.
    $K = RR v$ ($exists v in RR^2$) のときは $v$ と直交するベクトル $w eq.not 0$ を用いて $K^* = RR w$.
    $K = {0}$ の場合は $K^* = RR^2$.
    それ以外の場合では $K$ を上記のように表したとして次のように書ける:
    $
      K^* = {0} union {r (cos phi, sin phi) mid(|) r > 0, quad l + theta - pi / 2 <= phi <= l + pi / 2}
    $

    図示すると次のようになる.

    #let ex29-dual-fig = cetz.canvas(length: 1cm, {
      import cetz.draw: *

      let (l, u) = (20deg, 80deg)
      let r = 3.0
      let ink = rgb(130, 130, 130)
      let k-color = rgb(65, 105, 225)
      let dual-color = rgb(220, 20, 60)
      let pt(t, k) = (k * calc.cos(t), k * calc.sin(t))

      // 座標軸
      set-style(stroke: (paint: ink, thickness: 0.6pt), mark: (end: "straight", fill: ink, scale: 0.7))
      line((-2.6, 0), (3.4, 0))
      line((0, -1.4), (0, 3.4))
      set-style(mark: (end: none))

      cone(u - 90deg, l + 90deg, r: r, paint: dual-color)
      cone(l, u, r: r, paint: k-color)

      right-angle(u, u - 90deg, paint: ink)
      right-angle(l + 90deg, l, paint: ink)

      // 境界のラベル
      content(pt(l, 3.5), text(size: 9pt, fill: k-color)[$phi = l$])
      content(pt(u - 5deg, 3.4), text(size: 9pt, fill: k-color)[$phi = l + theta$])
      content(pt(u - 90deg, 4), text(size: 9pt, fill: dual-color)[$phi = l + theta - pi / 2$])
      content(pt(l + 90deg, 3.4), text(size: 9pt, fill: dual-color)[$phi = l + pi / 2$])

      // 領域ラベル
      content(pt(50deg, 1.1), text(size: 10pt, fill: k-color)[$K$])
      content(pt(100deg, 1.9), text(size: 10pt, fill: dual-color)[$K^*$])

      circle((0, 0), radius: 0.07, fill: ink, stroke: none)
      content((0, 0), anchor: "north-east", padding: 3pt, text(size: 9pt, fill: ink)[$0$])
    })

    #figure(
      context if target() == "html" { html.frame(ex29-dual-fig) } else { ex29-dual-fig },
      caption: [$K$ (青) とその双対錐 $K^*$ (赤). ],
    )

    $theta$ が大きいほど $K^*$ は狭くなる.
    $theta = pi$ のとき $K^*$ は半直線であり,
    $theta = 0$ のとき $K^*$ は半平面である.
  ],
  [
    $K$ が pointed であることは $K = {0}$ であるか角度表記で表した上で $theta < pi$ と同値.
  ],
  [
    $K$ は pointed として $K$ が内部を持つためには $K eq.not {0}$ かつ $theta > 0$ であることが必要十分.
    従って $K$ が proper であることは角度表記した上で
    $
      0 < theta < pi
    $
    と同値.

    $x prec.eq_K y$ であることを図示すると次のようになる.

    #let ex29-order-fig = cetz.canvas(length: 1cm, {
      import cetz.draw: *

      let (l, u) = (20deg, 80deg)
      let ink = rgb(130, 130, 130)
      let k-color = rgb(65, 105, 225)
      let pt-color = rgb(34, 139, 34)
      let x = (0, -1)
      let shift(p, t, k) = (p.at(0) + k * calc.cos(t), p.at(1) + k * calc.sin(t))

      // 参照用の K
      cone(l, u, r: 1.4, origin: (-3, -1.8), paint: k-color)
      circle((-3, -1.8), radius: 0.07, fill: ink, stroke: none)
      content((-3, -1.8), anchor: "north-east", padding: 3pt, text(size: 9pt, fill: ink)[$0$])
      content(shift((-3, -1.8), 50deg, 0.85), text(size: 10pt, fill: k-color)[$K$])

      // x + K
      cone(l, u, r: 4.5, origin: x, paint: k-color)
      content(shift(x, 62deg, 3.1), text(size: 10pt, fill: k-color)[$x + K$])

      let point(p, label, anchor) = {
        circle(p, radius: 0.075, fill: pt-color, stroke: none)
        content(p, anchor: anchor, padding: 4pt, text(size: 9pt, fill: pt-color, label))
      }

      point(x, $x$, "north-east")
      point(shift(x, 50deg, 2.4), $y$, "west")
      point((-1.8, 1.2), $z$, "east")

      content((2.5, -1.0), text(size: 9pt, fill: ink)[$x prec.eq_K y <==> y in x + K$])
      content((-1.2, 1.5), text(size: 9pt, fill: ink)[$x prec.eq.not_K z$])
    })

    #figure(
      context if target() == "html" { html.frame(ex29-order-fig) } else { ex29-order-fig },
      caption: [$x prec.eq_K y$ なる点全体は $x$ を頂点とする錐 $x + K$. ],
    )
  ],
)
