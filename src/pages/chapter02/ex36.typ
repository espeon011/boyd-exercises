#import "../../lib.typ": ex

== Exercise 2.36 (Euclidean distance matrices)

#ex[
  Let $x_1, dots, x_n in RR^k$. The matrix $D in bold(S)^n$ defined by
  $D_(i j) = norm(x_i - x_j)_2^2$ is called a _Euclidean distance matrix_.
  It satisfies some obvious properties such as $D_(i j) = D_(j i)$, $D_(i i) = 0$,
  $D_(i j) >= 0$, and (from the triangle inequality)
  $D_(i k)^frac(1, 2, style: "horizontal") <= D_(i j)^frac(1, 2, style: "horizontal") + D_(j k)^frac(1, 2, style: "horizontal")$.
  We now pose the question: When is a matrix $D in bold(S)^n$ a Euclidean distance
  matrix (for some points in $RR^k$, for some $k$)?
  A famous result answers this question: $D in bold(S)^n$ is a Euclidean distance
  matrix if and only if $D_(i i) = 0$ and $x^T D x <= 0$ for all $x$ with
  $bold(1)^T x = 0$. (See $section$8.3.3.)

  Show that the set of Euclidean distance matrices is a convex cone.
]

*解答*: 行列の内積を $chevron.l A, B chevron.r = tr (A^T B)$ と書く.
$section$8.3.3 より Euclidean distance matrix の全体を $K$ とおくと
$
  K & = {D in bold(S)^n mid(|) forall i, thick D_(i i) = 0, thick forall x in RR^n " with " bold(1)^T x = 0, thick x^T D x <= 0} \
  & = {D in bold(S)^n mid(|) forall i, thick D_(i i) = 0} inter {D in bold(S)^n mid(|) forall x in RR^n " with " bold(1)^T x = 0, thick chevron.l - x x^T, D chevron.r >= 0}
$
と書ける. ここで
$
  L = {- x x^T mid(|) x in RR^n, thick bold(1)^T x = 0}
$
とおけば
$
  K & = {D in bold(S)^n mid(|) forall i, thick D_(i i) = 0} inter {D in bold(S)^n mid(|) forall X in L, thick chevron.l X, D chevron.r >= 0} \
  & = {D in bold(S)^n mid(|) forall i, thick D_(i i) = 0} inter L^*
$
となる.
双対錐は必ず閉凸錐になるため $L^*$ は閉凸錐であり, ${D in bold(S)^n mid(|) forall i, thick D_(i i) = 0}$ も閉凸錐である.
従ってその共通部分も閉凸錐であり, $K$ は (閉) 凸錐である.
$qed$
