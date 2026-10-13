#import "../../lib.typ": ex

#let dom = math.op("dom")

== Exercise 3.8 (Second-order condition for convexity)

#ex[
  Prove that a twice differentiable function $f$ is convex if and only if its
  domain is convex and $nabla^2 f(x) succ.eq 0$ for all $x in dom f$.
  _Hint._ First consider the case $f : RR -> RR$. You can use the first-order
  condition for convexity (which was proved on page 70).
]

*解答*: まず 1 変数のケースを示す.
$f$ を凸関数とする.
$x, y in dom f$ とし, $x < y$ とする.
このとき first-order condition より
$
  f(y) & >= f(x) + f'(x) (y - x) \
  f(x) & >= f(y) + f'(y) (x - y).
$
この 2 式を足し, 移項すると $(y - x) (f'(y) - f'(x)) >= 0$ を得,  $y - x$ で割ることで $f'(y) - f'(x) >= 0$ を得る.
$f'$ が微分可能で単調増加のため $f''$ は常に非負である.
逆に $f$ の定義域が凸で $f''$ が定義域内で常に非負であるとする.
$x, y in dom f$ とし, $x eq.not y$ とする.
このとき $f'$ は単調増加であるから $x < y$ のときは
$
  f(y) & = f(x) + integral_x^y f'(t) d t \
       & >= f(x) + integral_x^y f'(x) d t \
       & = f(x) + f'(x) (y - x),
$
$x > y$ のときは
$
  f(y) & = f(x) + integral_x^y f'(t) d t \
       & >= f(x) - integral_y^x f'(x) d t \
       & = f(x) + f'(x) (y - x),
$

となり first-order condition を得る.
従って $f$ は凸である.

一般のケースに拡張する.
$nabla^2 f (x) succ.eq 0$ は任意の $v in RR^n$ に対して $v^T nabla^2 f (x) v >= 0$ であることと等しい.
これは $g_(x,v) (t) := f(x + t v)$ が $g_(x,v) '' (0) >= 0$ を満たすことと等しい ($dom g_(x,v) = {t in RR mid(|) x + t v in dom f}$).
実際,
$
   g_(x,v) '(t) & = nabla f (x + t v)^T v \
  g_(x,v) ''(t) & = v^T nabla^2 f (x + t v) v
$
であるから $t = 0$ を代入すれば $g_(x,v) ''(0) = v^T nabla^2 f(x) v$ を得る.
更に任意の $x in dom f$ に対して $nabla^2 f (x) succ.eq 0$ であれば任意の $t in dom g_(x,v)$ に対して $g_(x,v) '' (t) >= 0$ もわかる.
従って任意の $x in dom f$ に対して $nabla^2 f (x) succ.eq 0$ であることは $f$ を直線に制限した任意の 1 変数関数 $g$ が全ての点 $t in dom g$ で $g'' >= 0$ を満たすことと同値.
上で示した 1 変数のケースよりこれは $g$ が凸であることと同値であり,
$f$ を直線に制限した関数が全て凸であることは $f$ が凸であることと同値であるから $nabla^2 f (x) succ.eq 0$ (かつ $dom f$ が凸) が $f$ が凸 であることと同値だとわかる.
$qed$
