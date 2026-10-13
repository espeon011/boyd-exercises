#import "../../lib.typ": ex

#let dom = math.op("dom")

== Exercise 3.7

#ex[
  Suppose $f: RR^n -> RR$ is convex with $dom f = RR^n$, and bounded above on $RR^n$.
  Show that $f$ is constant.
]

*解答*: 背理法のため $f$ が定数関数でないとする.
このときある $a, b in RR^n$ が $f(a) < f(b)$ を満たす.
関数 $g: RR -> RR$ を
$
  g(t) = f(a + t (b - a))
$
と定めると $g$ は $RR$ 全域で定義された上に有界な凸関数であり, $g(0) < g(1)$ を満たす.
このとき $t >= 1$ に対して
$
  1 = 1/t dot.c t + (1 - 1/t) dot.c 0
$
に Jensen の不等式を適用することで
$
  g(1) & <= 1/t g(t) + (1 - 1/t) g(0)
$
を得, 分母を払って移項することで
$
  g(t) & >= g(0) + t (g(1) - g(0))
$
を得る.
$g(0) < g(1)$ より $g(0) + t (g(1) - g(0))$ は $t -> infinity$ で正の無限大に発散する.
従って $t -> infinity$ のとき $g(t) -> infinity$ となる.
これは $f$ が上に有界という条件に反する.
よって任意の $a, b in RR^n$ に対して $f(a) = f(b)$ であり, $f$ は定数関数である.
$qed$
