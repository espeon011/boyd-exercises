#import "../../lib.typ": alpha-enum, ex

== Exercise 2.3 (Midpoint convexity)

#ex[
  A set $C$ is *_midpoint convex_* if whenever two points $a, b$ are in $C$,
  the average or midpoint $frac((a + b), 2, style: "horizontal")$ is in $C$.
  Obviously a convex set is midpoint convex.
  It can be proved that under mild conditions midpoint convexity implies convexity.
  As a simple case prove that if $C$ is closed and midpoint convex, then $C$ is convex.
]

*解答*: $C subset RR^n$ を midpoint convex set とし, 閉集合であるとする.
$x_1, x_2$ を $C$ 内の任意の異なる 2 点とする.
このとき任意の実数 $theta in [0, 1]$ に対して $theta x_1 + (1 - theta) x_2 in C$ を示せばよい. \
$f: [0, 1] -> RR^n$ を $f(t) = (1 - t) x_1 + t x_2$ と定義する.
$theta_"l"^((0)) = 0$, $theta_"r"^((0)) = 1$ とおくと $f(theta_"l"^((0))) = x_1 in C$, $f(theta_"r"^((0))) = x_2 in C$ である.
$C$ は midpoint convex であるから $f$ の定義より
$
  f(frac((theta_"l"^((0)) + theta_"r"^((0))), 2, style: "horizontal")) = frac(( f(theta_"l"^((0))) + f(theta_"r"^((0))) ), 2, style: "horizontal") = frac(( x_1 + x_2 ), 2, style: "horizontal") in C
$
である.
$theta_"l"^((1))$, $theta_"r"^((1))$ を次のように定める.
$
  theta <= (theta_"l"^((0)) + theta_"r"^((0))) / 2 => cases(
    theta_"l"^((1)) = theta_"l"^((0)),
    theta_"r"^((1)) = (theta_"l"^((0)) + theta_"r"^((0))) / 2,
  ) \
  theta > (theta_"l"^((0)) + theta_"r"^((0))) / 2 => cases(
    theta_"l"^((1)) = (theta_"l"^((0)) + theta_"r"^((0))) / 2,
    theta_"r"^((1)) = theta_"r"^((0)),
  )
$
このとき $f(theta_"l"^((1))) in C$ かつ $f(theta_"r"^((1))) in C$ である.
任意の $k in NN$ に対しても同様に $theta_"l"^((k)), theta_"r"^((k))$ から $theta_"l"^((k + 1)), theta_"r"^((k + 1))$ を定めると任意の $k$ に対して $f(theta_"l"^((k))) in C$ かつ $f(theta_"r"^((k))) in C$ であり, 次のようになる.
$
  theta_"l"^((0)) <= theta_"l"^((1)) <= dots <= theta_"l"^((k)) <= dots <= theta <= dots <= theta_"r"^((k)) <= dots <= theta_"r"^((1)) <= theta_"r"^((0))
$
更に点列 ${theta_"l"^((k))}_(k=1)^infinity$, ${theta_"r"^((k))}_(k=1)^infinity$ は共に $theta$ に収束する.
$f$ が連続である事から $lim_(k -> infinity) f(theta_"l"^((k))) = f(theta)$ であり,
$C$ が閉集合であることから $f(theta) in C$ である.
従って $C$ は凸集合である. $qed$
