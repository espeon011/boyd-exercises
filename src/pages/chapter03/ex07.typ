#import "../../lib.typ": ex

#let dom = math.op("dom")

== Exercise 3.7

#ex[
  Suppose $f: RR^n -> RR$ is convex with $dom f = RR^n$, and bounded above on $RR^n$.
  Show that $f$ is constant.
]

*解答*: 背理法のため $f$ が定数関数でないとする.
このときある $a, b in RR^n$ が $f(a) < f(b)$ を満たすとする.
関数 $g: RR -> RR$ を
$
  g(t) = f(a + t (b - a))
$
と定めると $g$ は凸関数であり, $g(0) < g(1)$ を満たす.
このとき $t >= 1$ に対して
$
  g(t) >= g(0) + t (g(1) - g(0))
$
が成り立つ.
実際, $g(s) < g(0) + s (g(1) - g(0))$ なる $s > 1$ が存在すると
$
  g(1) & <= g(0) + 1/s (g(s) - g(0)) \
       & < g(0) + 1/s (s (g(1) - g(0))) \
       & = g(1)
$
となり矛盾する.
$g(0) < g(1)$ より $g(0) + t (g(1) - g(0))$ は $t -> infinity$ で正の無限大に発散する.
従って $t -> infinity$ のとき $g(t) -> infinity$ となる.
これは $f$ が上に有界という条件に反する.
よって任意の $a, b in RR^n$ に対して $f(a) = f(b)$ であり, $f$ は定数関数である.
$qed$
