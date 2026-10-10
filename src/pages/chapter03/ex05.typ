#import "../../lib.typ": ex

#let dom = math.op("dom")

== Exercise 3.5 (Running average of a convex function)

#ex[
  [RV73, page 22]
  Suppose $f: RR -> RR$ is convex, with $RR_+ subset.eq dom f$.
  Show that its running average $F$, defined as
  $
    F(x) = 1 / x integral_0^x f(t) d t, quad dom F = RR_(++),
  $
  is convex.
  _Hint._ For each $s$, $f(s x)$ is convex in $x$, so $integral_0^1 f(s x) d s$ is convex.
]

*解答*: $g(x, s) = f(s x)$ と定めると $section$3.2.2 より $g$ は $x$ について凸.
このとき $section$3.2.1 より
$
  F(x) = 1 / x integral_0^x f(t) d t = integral_0^1 g(x, s) d s
$
は凸.
$qed$
