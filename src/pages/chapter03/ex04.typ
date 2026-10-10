#import "../../lib.typ": ex

== Exercise 3.4

#ex[
  [RV73, page 15]
  Show that a continuous function $f: RR^n -> RR$ is convex if and only if for every line segment,
  its average value on the segment is less than or equal to the average of its values at the endpoints of the segment:
  For every $x, y in RR^n$,
  $
    integral_0^1 f(x + lambda (y - x)) d lambda <= (f(x) + f(y)) / 2.
  $
]

*解答*: $f$ を凸関数とする. このとき $x, y in RR^n$ に対して
$
  integral_0^1 f(x + lambda (y - x)) d lambda & = integral_0^1 f(lambda y + (1 - lambda) x) d lambda \
                                              & <= integral_0^1 (lambda f(y) + (1 - lambda) f(x)) d lambda \
                                              & = (f(x) + f(y)) / 2
$
となる.

逆に $f$ が問題文中の条件を満たすとする.
背理法のため, $x, y in RR^n$, $theta_0 in (0, 1)$ で
$
  f(theta_0 x + (1 - theta_0) y) > theta_0 f(x) + (1 - theta_0) f(y)
$
を満たすものが存在するとする.
このとき $f$ の連続性から
$
  theta_1 & = sup { theta in [0, theta_0] mid(|) f(theta x + (1 - theta) y) <= theta f(x) + (1 - theta) f(y)} \
  theta_2 & = inf { theta in [theta_0, 1] mid(|) f(theta x + (1 - theta) y) <= theta f(x) + (1 - theta) f(y)}
$
が定義でき, $theta_0 in (theta_1, theta_2)$ であり,
$theta in (theta_1, theta_2) => f(theta x + (1 - theta) y) > theta f(x) + (1 - theta) f(y)$ が成り立つ.
更に
$
  f(theta_1 x + (1 - theta_1) y) & = theta_1 f(x) + (1 - theta_1) f(y) \
  f(theta_2 x + (1 - theta_2) y) & = theta_2 f(x) + (1 - theta_2) f(y)
$
が成り立つ.
ここで $u = theta_1 x + (1 - theta_1) y$, $v = theta_2 x + (1 - theta_2) y$ とおくと
$
  integral_0^1 f(u + lambda (v - u)) d lambda & = integral_0^1 f(((1 - lambda) theta_1 + lambda theta_2) x + (1 - ((1 - lambda) theta_1 + lambda theta_2)) y) d lambda \
  & > integral_0^1 (((1 - lambda) theta_1 + lambda theta_2) f(x) + (1 - ((1 - lambda) theta_1 + lambda theta_2)) f(y)) d lambda \
  & = (theta_1 + theta_2) / 2 f(x) + (1 - (theta_1 + theta_2) / 2) f(y)
$
を得る.
一方で $f$ は問題文中の条件を満たすため
$
  integral_0^1 f(u + lambda (v - u)) d lambda & <= (f(u) + f(v)) / 2 \
  & = (f(theta_1 x + (1 - theta_1) y) + f(theta_2 x + (1 - theta_2) y)) / 2 \
  & = (theta_1 f(x) + (1 - theta_1) f(y) + theta_2 f(x) + (1 - theta_2) f(y)) / 2 \
  & = (theta_1 + theta_2) / 2 f(x) + (1 - (theta_1 + theta_2) / 2) f(y)
$
が成り立ち
$
  (theta_1 + theta_2) / 2 f(x) + (1 - (theta_1 + theta_2) / 2) f(y) < integral_0^1 f(u + lambda (v - u)) d lambda <= (theta_1 + theta_2) / 2 f(x) + (1 - (theta_1 + theta_2) / 2) f(y)
$
を得るがこれは矛盾. $qed$
