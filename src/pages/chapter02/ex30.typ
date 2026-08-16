#import "../../lib.typ": ex

#let int = math.op("int")

== Exercise 2.30 (Properties of generalized inequalities)

#ex[
  Prove the properties of (nonstrict and strict) generalized inequalities listed
  in $section$2.4.1.
]

*解答*:

*nonstrict*

- *$scripts(prec.eq)_K$ is preserved under addition*:
  $x scripts(prec.eq)_K y$ かつ $u scripts(prec.eq)_K v$ とする.
  このとき $y + v - (x + u) = (y - x) + (v - u) in K$ より $x + u scripts(prec.eq)_K y + v$.
- *$scripts(prec.eq)_K$ is transitive*:
  $x scripts(prec.eq)_K y$ かつ $y scripts(prec.eq)_K z$ とする.
  このとき $z - x = (z - y) + (y - x) in K$ より $x scripts(prec.eq)_K z$.
- *$scripts(prec.eq)_K$ is preserved under nonnegative scaling*:
  $x scripts(prec.eq)_K y$ かつ $alpha >= 0$ とする.
  このとき $alpha y - alpha x = alpha (y - x) in K$ より $alpha x scripts(prec.eq)_K alpha y$
- *$scripts(prec.eq)_K$ is reflexive*:
  $x - x = 0 in K$ より $x scripts(prec.eq)_K x$.
- *$scripts(prec.eq)_K$ is antisymmetric*:
  $x scripts(prec.eq)_K y$ かつ $y scripts(prec.eq)_K x$ とする.
  このとき $y - x in K$ かつ $x - y in K$ かつ $K$ が pointed であることから $x = y$.
- *$scripts(prec.eq)_K$ is preserved under limits*:
  点列 ${x_i}_i$, ${y_i}_i$ が $lim_(i -> infinity) x_i = x$, $lim_(i -> infinity) y_i = y$ と $x_i scripts(prec.eq)_K y_i$ ($forall i$) を満たすとする.
  このとき $y - x = lim_(i -> infinity) (y_i - x_i)$ かつ任意の $i$ に対して $y_i - x_i in K$ であり $K$ が閉であることより $y - x in K$.
  従って $x scripts(prec.eq)_K y$.

*strict*

- *if $x scripts(prec)_K y$ then $x scripts(prec.eq)_K y$*:
  $y - x in int K subset.eq K$ より $x scripts(prec.eq)_K y$.
- *if $x scripts(prec)_K y$ and $u scripts(prec.eq)_K v$ then $x + u scripts(prec)_K y + v$*:
  $y - x in int K$ より十分小さい $epsilon > 0$ が存在して $B(y - x, epsilon) subset.eq K$.
  よって $v - u in K$ から $B(y - x + v - u, epsilon) subset.eq K$ であり, 従って $x + u scripts(prec)_K y + v$.
- *if $x scripts(prec)_K y$ and $alpha > 0$ then $alpha x scripts(prec)_K alpha y$*:
  $y - x in int K$ より十分小さい $epsilon > 0$ が存在して $B(y - x, epsilon) subset.eq K$.
  よって $B(alpha (y - x), alpha epsilon) subset.eq K$ であり, 従って $alpha x scripts(prec)_K alpha y$.
- *$x scripts(prec.not)_K x$*:
  $0 in K$ だが $0 in int K$ ではない.
  実際, ある $epsilon > 0$ が存在して $B(0, epsilon) subset.eq K$ とすると $K$ は直線を含み pointed ではなくなってしまう.
  従って $x - x in.not int K$ であり $x scripts(prec.not)_K x$ である.
- *if $x scripts(prec)_K y$, then for $u$ and $v$ small enough, $x + u scripts(prec)_K y + v$*:
  $y - x in int K$ であることから十分小さい $epsilon > 0$ に対して $B(y - x, epsilon) subset.eq K$.
  このとき任意の $u, v in int B(0, frac(epsilon, 2, style: "horizontal"))$ に対して
  $
    norm(((y + v) - (x + u)) - (y - x)) = norm(v - u) <= norm(v) + norm(u) < epsilon
  $
  より $(y + v) - (x + u) in int B(y - x, epsilon) subset.eq int K$ である.
  ゆえに $x + u scripts(prec)_K y + v$. $qed$
