#import "../../lib.typ": ex

#let int = math.op("int")
#let bd = math.op("bd")

== Exercise 2.27 (Converse supporting hyperplane theorem)

#ex[
  Suppose the set $C$ is closed, has nonempty interior, and has a supporting
  hyperplane at every point in its boundary. Show that $C$ is convex.
]

*解答*: 背理法のため $C$ が凸でないと仮定する.
即ち $y_1, y_2 in C$ と $lambda in (0, 1)$ が存在し $y := lambda y_1 + (1 - lambda) y_2 in.not C$ となる.
$int C eq.not nothing$ より $z in int C$ を一つ取り,
連続写像 $f: [0, 1] -> RR^n$  を次のように定める:
$
  f(t) = t y + (1 - t) z
$
ここで $f(0) = z in C$ より $f^(-1) (C)$ は空でなく,
$f$ の連続性と $C$ が閉集合であることから $f^(-1) (C)$ も閉集合である.
さらに $f^(-1) (C)$ は $[0, 1]$ の部分集合であるから最大値 $t^* := max f^(-1) (C)$ が存在する.
$f(1) in.not C$ かつ $z in int C$ より $0< t^* < 1$ であることに注意する.
$x^* = f(t^*)$ とおく.
$x^* in C$ である一方で $t^* < t <= 1$ なる $t$ に対して $f(t) in.not C$ より $x^* in bd C$ である.
ここで $C$ の $x^*$ における支持超平面 $a_(x^*)^T x = a_(x^*)^T x^*$ ($a_(x^*) eq.not 0$) について考える.
$y_1, y_2 in C$ より $a_(x^*)^T y_1 <= a_(x^*)^T x^*$, $a_(x^*)^T y_2 <= a_(x^*)^T x^*$ であり,
従って $a_(x^*)^T y <= a_(x^*)^T x^*$.
この不等式を $t^*$ 倍して $a_(x^*)^T x^*$ から引き $1 - t^*$ で割ることで $a_(x^*)^T z >= a_(x^*)^T x^*$ を得るが,
$z in C$ より $a_(x^*)^T z <= a_(x^*)^T x^*$ でもあるため, $a_(x^*)^T z = a_(x^*)^T x^*$ とわかる.
一方で $z in int C$ であるため十分小さい $epsilon > 0$ に対して $z + epsilon a_(x^*) in C$ であるが
$
  a_(x^*)^T (z + epsilon a_(x^*)) = a_(x^*)^T z + epsilon norm(a_(x^*))_2^2 > a_(x^*)^T x^*
$
となり矛盾する.
従って $C$ は凸である. $qed$

*補足*: $C$ は境界上の点における支持超平面が定める半空間の共通部分として次のように書ける ($bd C = nothing$ の場合右辺の共通部分は $RR^n$ と解釈する):
$
  C = inter.big_(x_0 in bd C) {x in RR^n mid(|) a_(x_0)^T x <= a_(x_0)^T x_0}
$
証明は $subset.eq$ は明らか, $supset.eq$ は背理法により右辺の元で $C$ に属さない $y$ の存在を仮定して上記と同じ $f$, $t^*$, $x^*$ を構成すればよい.
