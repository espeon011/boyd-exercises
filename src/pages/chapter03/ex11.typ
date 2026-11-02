#import "../../lib.typ": ex

#let dom = math.op("dom")

== Exercise 3.11 (Monotone mappings)

#ex[
  A function $psi : RR^n -> RR^n$ is called _monotone_ if for all $x, y in dom psi$,
  $
    (psi(x) - psi(y))^T (x - y) >= 0.
  $
  (Note that 'monotone' as defined here is not the same as the definition given in §3.6.1. Both definitions are widely used.)
  Suppose $f : RR^n -> RR$ is a differentiable convex function.
  Show that its gradient $nabla f$ is monotone.
  Is the converse true, i.e., is every monotone mapping the gradient of a convex function?
]

*解答*: 凸関数の first-order condition より
$
  (nabla f(x) - nabla f(y))^T (x - y) & = nabla f(x)^T (x - y) - nabla f(y)^T (x - y) \
                                      & = - (nabla f(x)^T (y - x) + nabla f(y)^T (x - y)) \
                                      & >= f(x) - f(y) + f(y) - f(x) \
                                      & = 0
$
を得る. 従って微分可能凸関数 $f$ に対して $nabla f$ は上記の意味で単調である.

逆に $psi$ が上記の意味で単調であったとしても凸関数の勾配であるとは限らない.
行列 $A$ を
$
  A = mat(1, -1; 1, 1)
$
として $psi (x) = A x$ とする.
このとき
$
  (psi(x) - psi(y))^T (x - y) = (x - y)^T A^T (x - y) = (x_1 - y_1)^2 + (x_2 - y_2)^2 >= 0
$
より $psi$ は単調である.
一方である関数 $f$ が存在して $nabla f = psi$ が成立したとすると $nabla^2 f = D psi = A$ とならなければならないが,
$A$ は対称行列ではないのでこれは矛盾.
従って $psi$ は関数の勾配にはなり得ない.
$qed$

*補足*: 上記ではどのような関数の勾配にもならない単調写像を構成した.
単調写像がある関数の勾配に等しいとき, その関数は凸であることを示すことができる.
単調写像 $psi$ の定義域が開凸集合であるとし, 同じ定義域をもつ関数 $f$ が存在して $nabla f = psi$ であるとする.
$x, y in dom psi$ とし, $f$ を直線上に制限した
$
  g(t) = f(x + t (y - x))
$
を考える.
$t_1 < t_2$ に対して $z_i = x + t_i (y - x)$ と定めると
$
  (g'(t_2) - g'(t_1)) (t_2 - t_1) = (nabla f (z_2) - nabla f (z_1))^T (z_2 - z_1) >= 0
$
が成り立ち,
$g'$ が通常の意味での単調増加関数であることがわかり,
従って $g$ は凸関数である.
$g$ は $f$ を任意の直線上に制限したものであったから $f$ も凸である.
