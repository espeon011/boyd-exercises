#import "../../lib.typ": ex

== Exercise 2.26 (Support function)

#ex[
  The _support function_ of a set $C subset.eq RR^n$ is defined as
  $
    S_C (y) = sup {y^T x mid(|) x in C}.
  $
  (We allow $S_C (y)$ to take on the value $+infinity$.) Suppose that $C$ and $D$
  are closed convex sets in $RR^n$. Show that $C = D$ if and only if their
  support functions are equal.
]

*解答*:
$C = D$ であれば $S_C = S_D$ であることは明らか.
$C eq.not D$ とし, $C without D eq.not nothing$ とする.
$D without C eq.not nothing$ である場合は $C$ と $D$ を入れ替えればよい.
$z in C without D$ を取る.
$section$2.5.1 Example 2.20 より ${z}$ と $D$ は超平面 $a^T x = b$ によって強分離することができる:
$
  x in D ==> a^T x < b \
  a^T z > b
$
このとき次のように $S_D (a) < S_C (a)$ とわかる:
$
  S_D (a) = sup {a^T x mid(|) x in D} <= b < a^T z <= sup {a^T x mid(|) x in C} = S_C (a).
$
従って $S_C eq.not S_D$ である. $qed$
