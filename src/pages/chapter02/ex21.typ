#import "../../lib.typ": ex

== Exercise 2.21 (The set of separating hyperplanes)

#ex[
  Suppose that $C$ and $D$ are disjoint subsets of $RR^n$.
  Consider the set of $(a, b) in RR^(n+1)$ for which $a^T x <= b$ for all $x in C$,
  and $a^T x >= b$ for all $x in D$.
  Show that this set is a convex cone (which is the singleton ${0}$ if there is no
  hyperplane that separates $C$ and $D$).
]

*解答*:
問題の集合を $X$ とおく:
$
  X = {(a, b) mid(|) a in RR^n, quad b in RR, quad x in C => a^T x <= b, quad x in D => a^T x >= b}
$
任意の $(a_1, b_1), (a_2, b_2) in X$, $theta_1, theta_2 in RR_+$ を取る.
$x in C$ のとき
$
  (theta_1 a_1 + theta_2 a_2)^T x = theta_1 a_1^T x + theta_2 a_2^T x <= theta_1 b_1 + theta_2 b_2.
$
$x in D$ のとき
$
  (theta_1 a_1 + theta_2 a_2)^T x = theta_1 a_1^T x + theta_2 a_2^T x >= theta_1 b_1 + theta_2 b_2.
$
より $theta_1 (a_1, b_1) + theta_2 (a_2, b_2) in X$ であり, $X$ は凸錐である.

次に $C$ と $D$ を分離する超平面が存在しないとき $X = {0}$ であることを示す.
ここでは $C$ と $D$ は共に空でないと仮定する.
まず $0 in RR^(n+1)$ は必ず $X$ の元である.
$C$ と $D$ を分離する超平面が存在しないとき, $(a, b) in X => a = 0$ であるため $X subset.eq {0} times RR$ である.
$C$ と $D$ は空でないため $x in C$ と $y in D$ が取れて $X$ の定義から $a^T x <= b$ と $a^T y >= b$ が成り立つ.
従って $b = 0$ であり, $X = {0}$ とわかる. $qed$
