#import "../../lib.typ": alpha-enum, ex

== Exercise 2.10 (Solution set of a quadratic inequality) <ex-2-10>

#ex[
  Let $C subset RR^n$ be the solution set of a quadratic inequality,

  $ C = { x in RR^n mid(|) x^T A x + b^T x + c <= 0 }, $

  with $A in bold(S)^n$, $b in RR^n$, and $c in RR$.

  #alpha-enum(
    [
      Show that $C$ is convex if $A succ.eq 0$.
    ],
    [
      Show that the intersection of $C$ and the hyperplane defined by $g^T x + h = 0$
      (where $g eq.not 0$) is convex if $A + lambda g g^T succ.eq 0$ for some $lambda in RR$.
    ],
  )

  Are the converses of these statements true?
]

*解答*: $f(x) = x^T A x + b^T x + c$ とおく.
#alpha-enum(
  [
    $A succ.eq 0$ とする.
    $x, y in C$ とし, $theta in [0, 1]$ とする.
    $z = theta x + (1 - theta) y$ とすると

    $z^T A z + b^T z + c & = (theta x + (1 - theta) y)^T A (theta x + (1 - theta) y) + b^T (theta x + (1 - theta) y) + c \
    & = theta^2 x^T A x + theta b^T x + theta c + (1 - theta)^2 y^T A y + (1 - theta) b^T y + (1 - theta) c + 2 theta (1 - theta) y^T A x \
    & = theta (x^T A x + b^T x + c) + (1 - theta) (y^T A y + b^T y + c) - theta (1 - theta) (x^T A x - 2 y^T A x + y^T A y) \
    & = theta f(x) + (1 - theta) f(y) - theta (1 - theta) (x^T A x - 2 y^T A x + y^T A y) \
    & = theta f(x) + (1 - theta) f(y) - theta (1 - theta) (x - y)^T A (x - y) \
    & <= theta f(x) + (1 - theta) f(y) <= 0$

    従って $z in C$ である.

    逆は一般には成立しない.
    $n = 1$ で反例を示す.
    $C = {x in RR mid(|) - x^2 <= 0}$ とおくと $C = RR$ は凸だが $A = -1$ は半正定値ではない.
  ],
  [
    条件を満たす $lambda in RR$ を 1 つとり, 次のように定める.
    $
      D & = {x in RR^n mid(|) x^T (A + lambda g g^T) x + b^T x + (c - lambda h^2) <= 0} \
      L & = {x in RR^n mid(|) g^T x + h = 0}
    $
    $A + lambda g g^T succ.eq 0$ かつ (a) の結果より $D$ は凸である.
    $L$ は affine であるため凸であり従って $D inter L$ も凸である.
    $x in L$ とする. このとき $(g^T x)^2 = h^2$ であることに注意すると
    $
      f(x) & = x^T A x + b^T x + c \
           & = x^T A x + b^T x + c + lambda (g^T x)^2 - lambda h^2 \
           & = x^T (A + lambda g g^T) x + b^T x + (c - lambda h^2)
    $
    であり, 従って $x in L$ であるとき $x in C <=> x in D$ である.
    つまり $C inter L = D inter L$ である.
    ゆえに $C inter L$ は凸である.

    逆は一般には成り立たない.
    $n = 2$ で反例を示す.
    $
      A = mat(-1, 0; 0, -1), quad b = 0, quad c = 0, quad g = mat(0; 1), quad h = 0
    $
    とおくと $C = RR^2$ である, $L$ は $x_1$ 軸に等しい.
    従って $C inter L = L = {x in R^2 mid(|) x_2 = 0}$ であり凸である.
    一方で任意の $lambda in RR$ に対して
    $
      A + lambda g g^T = mat(-1, 0; 0, lambda - 1)
    $
    となり, $A + lambda g g^T$ は必ず固有値 $-1$ をもつ. $qed$
  ],
)
