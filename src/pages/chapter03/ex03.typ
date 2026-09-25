#import "../../lib.typ": ex

== Exercise 3.3 (Inverse of an increasing convex function)

#ex[
  Suppose $f : RR -> RR$ is increasing and convex on its domain $(a, b)$.
  Let $g$ denote its inverse, i.e., the function with domain $(f(a), f(b))$
  and $g(f(x)) = x$ for $a < x < b$.
  What can you say about convexity or concavity of $g$?
]

*解答*: $f$ の逆関数 $g$ は凹関数になることを示す.
まず, 一般に単調増加関数の逆関数は単調増加である.
$y_1, y_2 in (f(a), f(b))$, $theta in [0, 1]$ とする.
このとき $g$ の定義と $f$ の凸性から
$
  f g (theta y_1 + (1 - theta) y_2) & = theta y_1 + (1 - theta) y_2 \
                                    & = theta f g (y_1) + (1 - theta) f g (y_2) \
                                    & >= f (theta g (y_1) + (1 - theta) g (y_2))
$
となり, 両辺に $g$ をかければ $g$ は単調増加であるから
$
  g (theta y_1 + (1 - theta) y_2) >= theta g (y_1) + (1 - theta) g (y_2)
$
を得る.
従って $g$ は凹関数である.
$qed$
