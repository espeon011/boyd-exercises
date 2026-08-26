#import "../../lib.typ": alpha-enum, cetz, ex

#let dom = math.op("dom")

== Exercise 3.1

#ex[
  Suppose $f : RR -> RR$ is convex, and $a, b in dom f$ with $a < b$.

  #alpha-enum(
    [
      Show that
      $
        f(x) <= (b - x) / (b - a) f(a) + (x - a) / (b - a) f(b)
      $
      for all $x in [a, b]$.
    ],
    [
      Show that
      $
        (f(x) - f(a)) / (x - a) <= (f(b) - f(a)) / (b - a) <= (f(b) - f(x)) / (b - x)
      $
      for all $x in (a, b)$. Draw a sketch that illustrates this inequality.
    ],
    [
      Suppose $f$ is differentiable. Use the result in (b) to show that
      $
        f'(a) <= (f(b) - f(a)) / (b - a) <= f'(b).
      $
      Note that these inequalities also follow from (3.2):
      $
        f(b) >= f(a) + f'(a)(b - a), quad f(a) >= f(b) + f'(b)(a - b).
      $
    ],
    [
      Suppose $f$ is twice differentiable. Use the result in (c) to show that
      $f''(a) >= 0$ and $f''(b) >= 0$.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    $theta$ を次のようにおく:
    $
      theta = (b - x) / (b - a).
    $
    このとき $theta in [0, 1]$ であり,
    $x = theta a + (1 - theta) b$ である.
    従って
    $
      f(x) & = f(theta a + (1 - theta) b) \
           & <= theta f(a) + (1 - theta) f(b) \
           & = (b - x) / (b - a) f(a) + (x - a) / (b - a) f(b).
    $
  ],
  [
    (a) の両辺から $f(a)$ を引くと
    $
                  f(x) - f(a) & <= ((b - x) / (b - a) - 1) f(a) + (x - a) / (b - a) f(b) \
                              & = (x - a) / (b - a) (f(b) - f(a)) \
      (f(x) - f(a)) / (x - a) & <= (f(b) - f(a)) / (b - a)
    $
    とわかる. もう 1 つの不等式も同様.

    #let f(t) = 0.15 * t * t - 0.4 * t + 0.5

    #let fig-ex-3-1-b = cetz.canvas({
      import cetz.draw: *

      let a = 0.5
      let x = 3.0
      let b = 5.5

      // 明暗どちらの背景でも視認できる中間トーン
      let c-ax = rgb("#4c8dff").transparentize(15%)
      let c-ab = rgb("#2fb573").transparentize(15%)
      let c-xb = rgb("#ff7a45").transparentize(15%)
      let c-line = luma(50%)

      let pt(t) = (t, f(t))

      // 2 点 (t1, f(t1)), (t2, f(t2)) を通る直線を ext だけ延長して描く
      let chord(t1, t2, ext, color) = {
        let s = (f(t2) - f(t1)) / (t2 - t1)
        let g(u) = (u, f(t1) + s * (u - t1))
        line(g(t1 - ext), g(t2 + ext), stroke: 1pt + color)
      }

      set-style(stroke: 0.6pt + c-line)

      // 座標軸
      line((-0.4, 0), (6.6, 0), mark: (end: "stealth", fill: c-line, stroke: none))
      line((0, -0.4), (0, 5.0), mark: (end: "stealth", fill: c-line, stroke: none))

      // y = f(x)
      line(..range(0, 64).map(i => pt(i / 10)), stroke: 1pt + c-line)
      content((6.3, f(6.3) + 0.3), anchor: "south", text(8pt, fill: c-line, $f$))

      // 3 本の割線
      chord(a, x, 0.5, c-ax)
      chord(a, b, 0.5, c-ab)
      chord(x, b, 0.5, c-xb)

      // 3 点と補助線
      for (t, name) in ((a, $a$), (x, $x$), (b, $b$)) {
        line((t, 0), pt(t), stroke: (dash: "dashed", paint: c-line, thickness: 0.5pt))
        circle(pt(t), radius: 2.4pt, fill: c-line, stroke: none)
        content((t, -0.18), anchor: "north", text(9pt, fill: c-line, name))
      }

      // 凡例 (傾き)
      let legend(y, color, body) = {
        line((0.35, y), (1.05, y), stroke: 1pt + color)
        content((1.25, y), anchor: "west", text(8pt, fill: color, body))
      }
      legend(4.5, c-ax, $(f(x) - f(a)) / (x - a)$)
      legend(3.9, c-ab, $(f(b) - f(a)) / (b - a)$)
      legend(3.3, c-xb, $(f(b) - f(x)) / (b - x)$)
    })

    #figure(
      context if target() == "html" {
        html.frame(fig-ex-3-1-b)
      } else {
        fig-ex-3-1-b
      },
      caption: [平均変化率が増加する様子],
    )
  ],
  [
    $f$ が微分可能であることから $x$ を右から $a$ に近づければ
    $
      f'(a) <= (f(b) - f(a)) / (b - a)
    $
    を得, 左から $b$ に近づければ
    $
      (f(b) - f(a)) / (b - a) <= f'(b)
    $
    を得る.
  ],
  [
    (c) より $f'(b) >= f'(a)$ である. $a < b$ は任意であったから $f'$ は単調増加である.
    従って任意の $x in RR$ に対して $f''(x) >= 0$.
    $qed$
  ],
)
