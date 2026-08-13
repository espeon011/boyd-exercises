#import "../../lib.typ": alpha-enum, ex

#let sign = math.op("sign")

== Exercise 2.24 (Supporting hyperplanes)

#ex[
  #alpha-enum(
    [
      Express the closed convex set ${x in RR_+^2 mid(|) x_1 x_2 >= 1}$
      as an intersection of halfspaces.
    ],
    [
      Let $C = {x in RR^n mid(|) norm(x)_infinity <= 1}$,
      the $ell_infinity$-norm unit ball in $RR^n$,
      and let $hat(x)$ be a point in the boundary of $C$.
      Identify the supporting hyperplanes of $C$ at $hat(x)$ explicitly.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    次のように書ける:
    $
      {x in RR_+^2 mid(|) x_1 x_2 >= 1} = inter.big_(a in RR_(++)) {x in RR^2 mid(|) 1 / a x_1 + a x_2 >= 2}
    $
    実際, $x$ を左辺の元とすると相加相乗平均の大小関係より任意の $a in RR_(++)$ に対して $(frac(1, a, style: "horizontal")) x_1 + a x_2 >= 2 sqrt(x_1 x_2) >= 2$ となり右辺の元であり,
    $x$ を右辺の元としたとき $a$ を $0$ か $infinity$ に限りなく近づけることで $x$ の各成分は正であることがわかり,
    $a = sqrt(frac(x_1, x_2, style: "horizontal"))$ とおけば $x_1 x_2 >= 1$ が成り立ち, 左辺の元であることがわかる.
  ],
  [
    次の条件を満たす $a in RR^n without {0}$ を用いた ${x in RR^n mid(|) a^T x = a^T hat(x)}$ は全て支持超平面となる:
    $
      cases(
        -1 < hat(x)_i < 1 ==> a_i = 0,
        hat(x)_i = 1 ==> a_i >= 0,
        hat(x)_i = -1 ==> a_i <= 0,
      )
    $
    この条件を満たす $a$ が $C$ 上 $a^T x <= a^T hat(x)$ を満たすことは次のように確認できる:
    $
      a^T x = sum_(i = 1, dots, n \ hat(x)_i = 1) a_i x_i + sum_(i = 1, dots, n \ hat(x)_i = -1) a_i x_i <= sum_(i = 1, dots, n \ hat(x)_i = 1) a_i - sum_(i = 1, dots, n \ hat(x)_i = -1) a_i = a^T hat(x).
    $
    逆に $a$ が上記条件のうちどれかでも破っていれば $C$ は $a^T x <= a^T hat(x)$ が定義する半空間に含まれない.
    実際, $-1 < hat(x)_i < 1$ であるような $i$ に対して $a_i eq.not 0$ であれば $hat(x)$ から $i$ 成分を $hat(x)_i + sign(a_i) epsilon$ で置き換えた $y$ は $a^T y > a^T hat(x)$ を満たす.
    $hat(x)_i = 1$ や $hat(x)_i = -1$ のときも同様. $qed$
  ],
)
