#import "../../lib.typ": alpha-enum, cetz, ex

== Exercise 2.34 (The lexicographic cone and ordering)

#ex[
  The lexicographic cone is defined as
  $
    K_"lex" = {0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0, "for some" k, thick 0 <= k < n},
  $
  i.e., all vectors whose first nonzero coefficient (if any) is positive.

  #alpha-enum(
    [Verify that $K_"lex"$ is a cone, but not a proper cone.],
    [
      We define the lexicographic ordering on $RR^n$ as follows: $x scripts(<=)_"lex" y$ if and
      only if $y - x in K_"lex"$.
      (Since $K_"lex"$ is not a proper cone, the lexicographic ordering is not a
      generalized inequality.)
      Show that the lexicographic ordering is a linear ordering: for any $x, y in RR^n$,
      either $x scripts(<=)_"lex" y$ or $y scripts(<=)_"lex" x$.
      Therefore any set of vectors can be sorted with respect to the lexicographic cone,
      which yields the familiar sorting used in dictionaries.
    ],
    [Find $K_"lex"^*$.],
  )
]

*解答*:
#alpha-enum(
  [
    $K_"lex"$ が錐であることは明らか.
    $K_"lex" subset.eq RR^2$ 上の点列 ${(frac(1, i, style: "horizontal"), -1)^T}_i$ の収束先は $(0, -1)^T in.not K_"lex"$ であるから $K_"lex"$ は閉でなく,
    従って proper cone ではない (それ以外の条件は満たす. つまり $K_"lex"$ は凸であり, 空でない内部を持ち, pointed である).

    $n = 1$ の場合は $K_"lex"$ は proper cone であり,
    $n >= 2$ の場合は上記と同様の議論で閉でないことがわかり, $K_"lex"$ は proper cone ではない.
  ],
  [
    $K_"lex" union -K_"lex" = RR^n$ を示せばよい.
    $z in RR^n$ とする.
    - $z = 0$ の場合 $z in K_"lex"$.
    - $z$ の先頭が $0$ でない, つまり $z_1 eq.not 0$ の場合, $z_1 > 0$ なら $z in K_"lex"$, $z_1 < 0$ なら $z in -K_"lex"$
    - $z$ の先頭が $0$ かつ零ベクトルでない,
      つまりある $k$ ($1 <= k < n$) に対して $z_1 = dots.c = z_k = 0$, $z_(k+1) eq.not 0$ となる場合,
      $z_(k+1) > 0$ なら $z in K_"lex"$, $z_(k+1) < 0$ なら $z in -K_"lex"$.
    従って $K_"lex" union -K_"lex" = RR^n$ である.
  ],
  [
    $K_"lex"$ は次のように書ける:
    $
      K_"lex" = union.big_(k = 0)^(n-1) ({0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0})
    $
    上記の分解を $n = 3$ で図示すると次のようになる:

    #let ex34-n3-fig = cetz.canvas(length: 1cm, {
      import cetz.draw: *

      let ink = rgb(130, 130, 130)
      let c0 = rgb(65, 105, 225)
      let c1 = rgb(34, 139, 34)
      let c2 = rgb(230, 140, 0)
      let c-o = rgb(220, 20, 60)

      // 斜投影: x_1 は右, x_2 は奥, x_3 は上
      let p(x1, x2, x3) = (x1 + 0.5 * x2, 0.32 * x2 + x3)
      let (w, d, h) = (2.8, 2.2, 2.2)

      // k = 0: x_1 > 0 (可視な 3 面を描く)
      let face(..pts) = line(..pts.pos(), close: true, fill: c0.transparentize(86%), stroke: (
        paint: c0.transparentize(60%),
        thickness: 0.5pt,
      ))
      face(p(0, -d, -h), p(w, -d, -h), p(w, -d, h), p(0, -d, h)) // 手前
      face(p(0, -d, h), p(w, -d, h), p(w, d, h), p(0, d, h)) // 上
      face(p(w, -d, -h), p(w, d, -h), p(w, d, h), p(w, -d, h)) // 右

      // 超平面 x_1 = 0 (K_lex には含まれない部分)
      line(
        p(0, -d, -h),
        p(0, d, -h),
        p(0, d, h),
        p(0, -d, h),
        close: true,
        fill: luma(60%).transparentize(92%),
        stroke: (paint: c0, thickness: 1.0pt, dash: "dashed"),
      )

      // k = 1: x_1 = 0, x_2 > 0
      line(
        p(0, 0, -h),
        p(0, d, -h),
        p(0, d, h),
        p(0, 0, h),
        close: true,
        fill: c1.transparentize(76%),
        stroke: none,
      )
      // 切り取りの縁 (実線)
      line(
        p(0, 0, -h),
        p(0, d, -h),
        p(0, d, h),
        p(0, 0, h),
        stroke: (paint: c1, thickness: 1.0pt),
      )
      // x_2 = 0 かつ x_3 < 0 の部分は K_lex に含まれない
      line(p(0, 0, -h), p(0, 0, 0), stroke: (paint: c1, thickness: 1.0pt, dash: "dashed"))

      // 座標軸
      set-style(stroke: (paint: ink, thickness: 0.6pt), mark: (end: "straight", fill: ink, scale: 0.7))
      line(p(-1.2, 0, 0), p(w + 0.7, 0, 0))
      line(p(0, -d - 0.5, 0), p(0, d + 0.6, 0))
      line(p(0, 0, -h - 0.4), p(0, 0, h + 0.8))
      set-style(mark: (end: none))
      content(p(w + 0.9, 0, 0), anchor: "west", text(fill: ink, size: 0.85em)[$x_1$])
      content(p(0, d + 0.8, 0), anchor: "west", text(fill: ink, size: 0.85em)[$x_2$])
      content(p(0, 0, h + 1.0), anchor: "south", text(fill: ink, size: 0.85em)[$x_3$])

      // k = 1 の境界 (x_2 = 0) は含まれない
      line(p(0, 0, -h), p(0, 0, h), stroke: (paint: c1, thickness: 1.0pt, dash: "dashed"))

      // k = 2: x_1 = x_2 = 0, x_3 > 0
      line(p(0, 0, 0), p(0, 0, h), stroke: (paint: c2, thickness: 2.0pt))

      // 原点は含まれる
      circle(p(0, 0, 0), radius: 0.09, fill: c-o, stroke: none)

      content(p(1.6, -d, -h - 0.6), text(fill: c0, size: 0.85em)[$k = 0: thick x_1 > 0$])
      content(p(0, d + 0.3, h + 0.3), anchor: "west", text(
        fill: c1,
        size: 0.85em,
      )[$k = 1: thick x_1 = 0, thick x_2 > 0$])
      content(p(-1.3, 0, 1.4), anchor: "east", text(
        fill: c2,
        size: 0.85em,
      )[$k = 2: thick x_1 = x_2 = 0, thick x_3 > 0$])
      content(p(-0.25, 0, -0.25), anchor: "north-east", text(fill: c-o, size: 0.85em)[${0}$])
    })

    #figure(
      context if target() == "html" { html.frame(ex34-n3-fig) } else { ex34-n3-fig },
      caption: [開半空間 (青), 開半平面 (緑), 開半直線 (橙), 原点 (赤) の disjoint union.],
    )

    ここで各 ${0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0}$ を $K_"lex"^((k))$ と置けば $K_"lex"^((k))$ は錐であり,
    $K_"lex"^*$ は
    $
      K_"lex"^* = inter.big_(k=0)^(n-1) (K_"lex"^((k)))^*
    $
    である. 各 $(K_"lex"^((k)))^*$ は次のようになる:
    $
      (K_"lex"^((k)))^* = {y in RR^n mid(|) y_(k+1) >= 0, thick y_(k+2) = dots.c = y_n = 0}
    $
    従って $K_"lex"^*$ は
    $
      K_"lex"^* = {y in RR^n mid(|) y_1 >= 0, thick y_2 = y_3 = dots.c = y_n = 0}
    $
    である. $qed$
  ],
)
