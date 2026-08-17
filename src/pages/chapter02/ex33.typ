#import "../../lib.typ": alpha-enum, ex

== Exercise 2.33 (The monotone nonnegative cone)

#ex[
  We define the monotone nonnegative cone as
  $
    K_"m+" = {x in RR^n mid(|) x_1 >= x_2 >= dots.c >= x_n >= 0}.
  $
  i.e., all nonnegative vectors with components sorted in nonincreasing order.

  #alpha-enum(
    [Show that $K_"m+"$ is a proper cone.],
    [
      Find the dual cone $K_"m+"^*$.
      _Hint._ Use the identity
      $
        sum_(i=1)^n x_i y_i = & (x_1 - x_2) y_1 + (x_2 - x_3) (y_1 + y_2)
                                + (x_3 - x_4) (y_1 + y_2 + y_3) + dots.c \
                              & + (x_(n-1) - x_n) (y_1 + dots.c + y_(n-1)) + x_n (y_1 + dots.c + y_n).
      $
    ],
  )
]

*解答*:
#alpha-enum(
  [
    $K_"m+"$ が錐であることは明らか.
    次の線形写像 $f: RR^n -> RR^n$ を考える:
    $
      f vec(x_1, dots.v, dots.v, x_n) = vec(x_1 - x_2, dots.v, x_(n-1) - x_n, x_n)
      quad quad (f^(-1) vec(y_1, dots.v, dots.v, y_n) = vec(sum_(i=1)^n y_i, dots.v, y_(n-1) + y_n, y_n))
    $
    このとき $K_"m+" = f^(-1)(RR_+^n)$ であり, 従って閉集合である.
    また, $f^(-1)(RR_(++)^n) subset.eq K_"m+"$ より $K_"m+"$ は空でない内部を持つ.
    $x, -x in K_"m+"$ とすれば
    $
      x_1 >= dots.c >= x_n >= 0 \
      x_1 <= dots.c <= x_n <= 0
    $
    が成り立つことから $x = 0$ とわかるため $K_"m+"$ は pointed である.
    そして $section$2.3.2 より凸集合の affine 写像による像・逆像は凸であるため $K_"m+" = f^(-1)(RR_+^n)$ も凸である.
    よって $K_"m+"$ は proper cone である.
  ],
  [
    $g: RR^n -> RR^n$ を次で定義する:
    $
      g vec(y_1, dots.v, dots.v, y_n) = vec(y_1, y_1 + y_2, dots.v, sum_(i=1)^n y_i)
    $
    Hint より下記が成り立つ.
    $
      x^T y = f(x)^T g (y)
    $
    特に $f$ が同型であることから $x$ が $K_"m+"$ 全体を動くとき $f(x)$ は $RR_+^n$ 全体を動く.
    従って
    $
      K_"m+"^* & = {y in RR^n mid(|) x^T y >= 0 thick forall x in K_"m+"} \
               & = {y in RR^n mid(|) f(x)^T g (y) >= 0 thick forall x in K_"m+"} \
               & = {y in RR^n mid(|) x^T g (y) >= 0 thick forall x in RR_+^n} \
               & = {y in RR^n mid(|) g (y) in (RR_+^n)^*} \
               & = {y in RR^n mid(|) g (y) succ.eq 0} \
               & = {y in RR^n mid(|) sum_(i=1)^j y_i >= 0 thick (forall j = 1, dots, n)} qed
    $
  ],
)
