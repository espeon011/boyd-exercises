#import "../../lib.typ": alpha-enum, ex

#let dom = math.op("dom")
#let hfrac(a, b) = math.frac(a, b, style: "horizontal")

== Exercise 2.19 (Linear-fractional functions and convex sets)

#ex[
  Let $f: RR^m -> RR^n$ be the linear-fractional function
  $
    f(x) = (A x + b) / (c^T x + d), quad dom f = {x mid(|) c^T x + d > 0}.
  $
  In this problem we study the inverse image of a convex set $C$ under $f$, i.e.,
  $
    f^(-1)(C) = {x in dom f mid(|) f(x) in C}.
  $
  For each of the following sets $C subset.eq RR^n$, give a simple description of $f^(-1)(C)$.

  #alpha-enum(
    [
      The halfspace $C = {y mid(|) g^T y <= h}$ (with $g eq.not 0$).
    ],
    [
      The polyhedron $C = {y mid(|) G y prec.eq h}$.
    ],
    [
      The ellipsoid ${y mid(|) y^T P^(-1) y <= 1}$ (where $P in bold(S)_(+ +)^n$).
    ],
    [
      The solution set of a linear matrix inequality,
      $C = {y mid(|) y_1 A_1 + dots.c + y_n A_n prec.eq B}$,
      where $A_1, dots, A_n, B in bold(S)^p$.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    開半空間と閉半空間の共通部分となる:
    $
      f^(-1)(C) & = {x in RR^m mid(|) c^T x + d > 0, thick g^T (A x + b) / (c^T x + d) <= h} \
                & = {x in RR^m mid(|) c^T x + d > 0, thick (A^T g - h c )^T x <= h d - g^T b}
    $
  ],
  [
    開半空間と多面体の共通部分となる:
    $
      f^(-1)(C) & = {x in RR^m mid(|) c^T x + d > 0, thick G (A x + b) / (c^T x + d) prec.eq h} \
                & = {x in RR^m mid(|) c^T x + d > 0, thick G (A x + b) prec.eq h (c^T x + d)} \
                & = {x in RR^m mid(|) c^T x + d > 0, thick (G A - h c^T) x prec.eq d h - G b}
    $
  ],
  [
    開半空間と「affine 写像による second order cone の逆像」の共通部分となる:
    $
      f^(-1)(C) & = {x in RR^m mid(|) c^T x + d > 0, thick ((A x + b) / (c^T x + d))^T P^(-1) ((A x + b) / (c^T x + d)) <= 1} \
                & = {x in RR^m mid(|) c^T x + d > 0, thick norm(P^(- 1 / 2) (A x + b))_2 <= c^T x + d}.
    $
    この ${x in RR^m mid(|) norm(P^(- hfrac(1, 2)) (A x + b))_2 <= c^T x + d}$ の部分は
    $
      Q := mat(P^(- 1 / 2) A thick, P^(- 1 / 2) b; c^T, d)
    $
    を用いた affine 写像 $x |-> Q dot.c (x, 1)^T$ による second order cone ${(u, t) in RR^(n+1) mid(|) norm(u)_2 <= t}$ の逆像である.
    また, 次のようにも書け, ($A^T P^(-1) A - c c^T eq.not 0$ でなければ) 開半空間と 2 次不等式の解集合の共通部分でもあるとわかる:
    $
      f^(-1)(C) = {x in RR^m mid(|) c^T x + d > 0, thick x^T (A^T P^(-1) A - c c^T) x + 2 (b^T P^(-1) A - d c^T) x + b^T P^(-1) b - d^2 <= 0}
    $
  ],
  [
    開半空間と「affine 写像による positive semidefinite cone の逆像」の共通部分となる:
    $A = (a_(i,j))_(i,j)$ と書くことにすれば
    $
      f^(-1) (C) & = {x in RR^m mid(|) c^T x + d > 0, thick sum_(i=1)^n ((A x)_i + b_i) A_i prec.eq (c^T x + d) B} \
                 & = {x in RR^m mid(|) c^T x + d > 0, thick sum_(j=1)^m x_j E_j + F succ.eq 0}
    $
    ここで
    $
      E_j = c_j B - sum_(i=1)^n a_(i,j) A_i, quad F = d B - sum_(i=1)^n b_i A_i
    $
    とおいた.
    このとき ${x in RR^m mid(|) sum_(j=1)^m x_j E_j + F succ.eq 0}$ の部分は $RR^m$ から $bold(S)^p$ への affine 写像
    $
      x |-> sum_(j=1)^m x_j E_j + F
    $
    による positive semidefinite cone $bold(S)_+^p$ の逆像である. $qed$
  ],
)
