#import "../../lib.typ": ex

#let kl = math.op($D_"kl"$)
#let diag = math.op("diag")

== Exercise 3.13 (Kullback-Leibler divergence and the information inequality)

#ex[
  Let $kl$ be the Kullback-Leibler divergence, as defined in (3.17).
  Prove the _information inequality_: $kl(u, v) >= 0$ for all $u, v in RR_(++)^n$.
  Also show that $kl(u, v) = 0$ if and only if $u = v$.
  _Hint_. The Kullback-Leibler divergence can be expressed as
  $
    kl(u, v) = f(u) - f(v) - nabla f(v)^T (u - v),
  $
  where $f(v) = sum_(i=1)^n v_i log v_i$ is the negative entropy of $v$.
]

*解答*: Hint の式が成立するのは計算することで確かめられる.
更に $f$ が凸であることより first-order condition から
$
  kl(u, v) & = f(u) - f(v) - nabla f(v)^T (u - v) \
           & = f(u) - (f(v) + nabla f(v)^T (u - v)) \
           & >= f(u) - f(u) = 0
$
を得る.

また, $f(u)$ の Hesse 行列は
$
  nabla^2 f(u) = diag (1/u_1, dots, 1/u_n) succ 0
$
となるため $f$ は $RR^n_(++)$ 上で狭義凸関数である.
狭義凸関数の first-order condition より $u != v$ のとき
$
  f(u) > f(v) + nabla f(v)^T (u - v).
$
従って
$
  kl(u, v) = f(u) - f(v) - nabla f(v)^T (u - v) > 0
$
を得る.
従って $u != v$ ならば $kl(u, v) > 0$ である.
対偶を取れば $kl(u, v) = 0 => u = v$ を得る.
逆は明らか.
$qed$
