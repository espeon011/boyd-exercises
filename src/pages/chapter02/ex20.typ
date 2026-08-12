#import "../../lib.typ": ex

#let rank = math.op("rank")

== Exercise 2.20 (Strictly positive solution of linear equations)

#ex[
  Suppose $A in RR^(m times n)$, $b in RR^m$, with $b in cal(R)(A)$.
  Show that there exists an $x$ satisfying
  $
    x succ 0, quad A x = b
  $
  if and only if there exists no $lambda$ with
  $
    A^T lambda succ.eq 0, quad A^T lambda eq.not 0, quad b^T lambda <= 0.
  $
  _Hint._ First prove the following fact from linear algebra: $c^T x = d$ for all
  $x$ satisfying $A x = b$ if and only if there is a vector $lambda$ such that
  $c = A^T lambda$, $d = b^T lambda$.
]

*解答*: Hint の内容は一旦仮定する. つまり次が成立する:
$
  forall x in RR^n, A x = b => c^T x = d quad <==> quad exists lambda in RR^m, c = A^T lambda, d = b^T lambda.
$

($arrow.b.double$): 対偶を示す. $lambda in RR^m$ が存在して $A^T lambda succ.eq 0$, $A^T lambda eq.not 0$, $b^T lambda <= 0$ が成り立つとする.
背理法のため $A x = b$ かつ $x succ 0$ であるとする.
このとき
$
  lambda^T A x = lambda^T b
$
だが $A^T lambda succ.eq 0$ かつ $A^T lambda eq.not 0$ かつ $x succ 0$ より左辺は正であり, $b^T lambda <= 0$ より右辺は非正である.
これは矛盾である. 従って $A x = b$ と $x succ 0$ は両立しない.

($arrow.t.double$): 対偶を示す. ${x in RR^n mid(|) x succ 0}$ と ${x in RR^n mid(|) A x = b}$ が互いに素であるとする.
これらは両方凸であるから separating hyperplane theorem より $c in RR^n$ ($c eq.not 0$), $d in RR$ が存在し次が成り立つ:
$
  c^T x & >= d quad "on" quad {x in RR^n mid(|) x succ 0} \
  c^T x & <= d quad "on" quad {x in RR^n mid(|) A x = b}
$
まず $d <= 0$ である. 何故なら ${x in RR^n mid(|) x succ 0}$ 上 $c^T x >= d$ でなければならないが $x$ の各成分を十分小さく取ることで $c^T x$ を $0$ に限りなく近づけることができるからである.
次に $c succ.eq 0$ である. 何故なら $c$ に負の成分がある場合, $x$ の対応する成分以外を $1$ に固定したまま $x$ の対応する成分を正の無限大に発散させることで $c^T x$ を負の無限大に発散させられるからである. \
${x in RR^n mid(|) A x = b}$ の元は $A x_0 = b$ なる $x_0 in RR^n$ を 1 つ取って $x_0 + {x in RR^n mid(|) A x = 0}$ と表せることから ${x in RR^n mid(|) A x = 0}$ 上 $c^T x <= d - c^T x_0$ である.
一方で線形形式 $c^T x$ が有界であるためには常に $0$ でなければならない.
従って $A x = 0$ ならば $c^T x = 0$ である.
言い換えれば $A x = b$ ならば $c^T x = c^T x_0$ である.
$d' = c^T x_0$ とおく. $d' <= d$ に注意する.
このとき Hint から $lambda in RR^m$ が存在して $c = A^T lambda$, $d' = b^T lambda$ となる.
$c succ.eq 0$ より $A^T lambda succ.eq 0$.
$c eq.not 0$ より $A^T lambda eq.not 0$.
$d <= 0$ より $b^T lambda = d' <= d <= 0$ である. $qed$

*Hint の証明*: 下記の方向だけ証明する. 逆は明らか:
$
  forall x in RR^n, A x = b => c^T x = d quad ==> quad exists lambda in RR^m, c = A^T lambda, d = b^T lambda.
$
また, $b in cal(R)(A)$ とする. そうでなければこの主張は成立しない.

$A x_0 = b$ なる $x_0 in RR^n$ を 1 つ取る.
このとき仮定より $cal(N)(A)$ 上 $c^T x = d - c^T x_0$.
$cal(N)(A)$ 上で $c^T x$ が定数であることから $x = 0$ を代入すれば $c^T x = 0$ とわかる.
従って $c in cal(N)(A)^bot$ である.
ところで $cal(R)(A^T) subset.eq cal(N)(A)^bot$ かつ両者の次元が
$
    dim cal(R)(A^T) & = rank A^T          & = rank A \
  dim cal(N)(A)^bot & = n - dim cal(N)(A) & = rank A
$
と等しいことから $cal(R)(A^T) = cal(N)(A)^bot$ であり,
従ってある $lambda in RR^m$ が存在して $c = A^T lambda$ が成り立つ.
このとき $b^T lambda = lambda^T A x_0 = c^T x_0 = d$ となる. $qed$
