#import "../../lib.typ": alpha-enum, ex

== Exercise 2.2

#ex[
  Show that a set is convex if and only if its intersection with any line is convex.
  Show that a set is affine if and only if its intersection with any line is affine.
]

*解答*:
(convex, $arrow.r.double$) 凸集合同士の共通部分は凸であるため任意の直線との共通部分は凸. \
(convex, $arrow.l.double$) $C$ を $RR^n$ の部分集合とし, 任意の直線との共通部分が凸であるとする.
任意の $x_1, x_2 in C$ に対し, $x_1$ と $x_2$ を結ぶ直線を $L$ とすれば $L inter C$ は仮定より凸である.
$x_1, x_2 in L inter C$ より任意の $theta in [0, 1]$ に対し
$
  theta x_1 + (1 - theta) x_2 in L inter C subset C
$
であり, 従って $C$ は凸である. \
(affine, $arrow.r.double$) $C subset RR^n$ を affine 集合とし, $L subset RR^n$ を任意の直線とする.
$L inter C$ が空集合か 1 点集合である場合, それは明らかに affine である.
$L inter C$ が 2 つ以上の要素を持つとし, それを $x_1, x_2$ とおく.
$L$ は $x_1, x_2$ を通る直線であり, $C$ が affine であることの定義から $C$ 内の異なる 2 点を通る直線は $C$ に含まれるため $L inter C = L$ である.
$L$ は直線であるから affine である. \
(affine, $arrow.l.double$) $C$ を $RR^n$ の部分集合とする.
$x_1, x_2$ を $C$ 内の任意の異なる 2 点とし, $x_1, x_2$ を通る直線を $L$ とする.
仮定より $C inter L$ は affine であり, 従って $C inter L$ 内の異なる 2 点を通る直線は必ず $C inter L$ に含まれる.
従って $L subset C$ であり $C$ 自身も affine である. $qed$
