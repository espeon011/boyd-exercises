#import "../../lib.typ": ex

#let dom = math.op("dom")
#let epi = math.op("epi")
#let hypo = math.op("hypo")
#let int = math.op("int")
#let cl = math.op("cl")

== Exercise 3.12

#ex[
  Suppose $f : RR^n -> RR$ is convex, $g : RR^n -> RR$ is concave, $dom f = dom g = RR^n$, and for all $x$, $g(x) <= f(x)$.
  Show that there exists an affine function $h$ such that for all $x$, $g(x) <= h(x) <= f(x)$.
  In other words, if a concave function $g$ is an underestimator of a convex function $f$, then we can fit an affine function between $f$ and $g$.
]

*解答*: 凸関数は定義域の内部で連続であるため $f$ も $g$ も $RR^n$ で連続である.
まず, 以下を示す:
$
   int epi f & = {(x, y) in RR^n times RR mid(|) y > f(x)} \
  int hypo g & = {(x, y) in RR^n times RR mid(|) y < g(x)}
$
$f$ についてのみ示す. $g$ についても同様.
- ($supset.eq$) 右辺の集合は $(x, y) |-> y - f(x)$ による $RR_(++)$ の逆像であるため $f$ の連続性より開集合であり,
  その定義から $epi f$ に含まれる. $int epi f$ の最大性より右辺は左辺に含まれる.
- ($subset.eq$) $(x, y) in int epi f$ とするとある $epsilon > 0$ が存在して $B((x, y), epsilon) subset.eq epi f$ となり,
  従って $(x, y - epsilon) in epi f$ である. 従って $y - epsilon >= f(x)$ であり, $y > f(x)$ が成り立つ.

前提より $epi f$ と $hypo g$ は凸集合であり, その内部である $int epi f$ と $int hypo g$ も凸である.
また, $f$ の連続性から $epi f$ は閉集合であるため $cl int epi f subset.eq epi f$ であり,
上記表示より $int epi f != nothing$ であるため #link(<ex-2-39>)[演習問題 2.39] の解答の補足より $epi f subset.eq cl int epi f$ が成り立ち,
$cl int epi f = epi f$ が成り立つ.
$g$ についても同様に $cl int hypo g = hypo g$ が成り立つ.

$int epi f$ と $int hypo g$ について, $(x, y) in int epi f inter int hypo g subset.eq RR^n times RR$ のとき $y > f(x) >= g(x) > y$ となり矛盾するため $int epi f inter int hypo g = nothing$ である.
従って分離超平面定理から $int epi f$ と $int hypo g$ を分離する超平面 $a^T x + b y = c$ ($a in RR^n$, $b, c in RR$) が存在する.
また, このとき $b != 0$ である.
実際, $b = 0$ とすると $a != bold(0)$ であり, 半空間は ${(x, y) in RR^n times RR mid(|) a^T x <= c}$ と ${(x, y) in RR^n times RR mid(|) a^T x >= c}$ になるが,
任意の $x in RR^n$ に対して $(x, f(x) + 1) in int epi f$ であるから $int epi f$ はどちらにも含まれなくなり矛盾する.
超平面の式を $b$ で割り, 改めて $a$, $c$ と置きなおすことで分離超平面を定義する式は $y = - a^T x + c$ であるとしてよい.
このとき $f(x) >= g(x)$ という関係から不等号の向きがわかり
$
   int epi f & subset.eq { (x, y) in RR^n times RR mid(|) y >= -a^T x + c } \
  int hypo g & subset.eq { (x, y) in RR^n times RR mid(|) y <= -a^T x + c }
$
を得る.
右辺の半空間は閉集合であるため $int epi f$ の閉包である $epi f$ も含む.
$hypo g$ についても同様:
$
   epi f & subset.eq { (x, y) in RR^n times RR mid(|) y >= -a^T x + c } \
  hypo g & subset.eq { (x, y) in RR^n times RR mid(|) y <= -a^T x + c }
$
そして $(x, f(x)) in epi f$, $(x, g(x)) in hypo g$ より
$
  forall x in RR^n, thick g(x) <= -a^T x + c <= f(x)
$
が成り立つ.
よって $h(x) = -a^T x + c$ とすれば任意の $x$ に対して $g(x) <= h(x) <= f(x)$ が成り立つ.
$qed$
