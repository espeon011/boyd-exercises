#import "../../lib.typ": alpha-enum, ex

== Exercise 2.1

#ex[
  Let $C subset RR^n$ be a convex set, with $x_1, dots, x_k in C$, and $theta_1, dots, theta_k in RR$ satisfy $theta_i >= 0$, $theta_1 + dots + theta_k = 1$.
  Show that $theta_1 x_1 + dots + theta_k x_k in C$. (The definition of convexity is that this holds for $k = 2$; you must show it for arbitrary $k$. ) _Hint_. Use induction on $k$.
]

*解答*:
$k$ に関する帰納法で示す.
$k = 2$ のとき定義から明らか.
$k = ell$ のとき成り立つとして $k = ell + 1$ のとき成立することを示す.
$theta_(ell + 1) = 1$ の場合 $theta_1 x_1 + dots + theta_(ell + 1) x_(ell + 1) = x_(ell + 1) in C$ となるため $theta_(ell + 1) < 1$ であるとする.
このとき $theta_1 + dots + theta_ell = 1 - theta_(ell + 1)$ であることから
$
  y := theta_1 / (1 - theta_(ell + 1)) x_1 + dots + theta_ell / (1 - theta_(ell + 1)) x_ell in C
$
が成り立ち, 凸集合の定義から $(1 - theta_(ell + 1)) y + theta_(ell + 1) x_(ell + 1) in C$ が成り立ち,
従って $theta_1 x_1 + dots + theta_(ell + 1) x_(ell + 1) in C$ が成り立つ. $qed$
