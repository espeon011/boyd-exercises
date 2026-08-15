#import "../../lib.typ": ex

#let conv = math.op("conv")

== Exercise 2.22 <ex-2-22>

#ex[
  Finish the proof of the separating hyperplane theorem in §2.5.1:
  Show that a separating hyperplane exists for two disjoint convex sets $C$ and $D$.
  You can use the result proved in §2.5.1, i.e., that a separating hyperplane
  exists when there exist points in the two sets whose distance is equal to the
  distance between the two sets. \
  _Hint._ If $C$ and $D$ are disjoint convex sets, then the set
  ${x - y mid(|) x in C, y in D}$ is convex and does not contain the origin.
]

*解答*:
$E = {x - y mid(|) x in C, y in D}$ とおく.
$C inter D = nothing$ であるから $0 in.not E$ である.
さらに $E$ は凸である.
実際, $z_1, z_2 in E$, $theta in [0, 1]$ とすると
$x_1, x_2 in C$, $y_1, y_2 in D$ が存在して $z_1 = x_1 - y_1$, $z_2 = x_2 - y_2$ となり,
$C$ と $D$ が凸であることから
$
  theta z_1 + (1 - theta) z_2 & = theta x_1 + (1 - theta) x_2 - theta y_1 - (1 - theta) y_2 \
                              & = (theta x_1 + (1 - theta) x_2) - (theta y_1 + (1 - theta) y_2) in E
$
である. 従って $E$ は凸である.

次に $E$ はある半空間に含まれることを示す.
$w in E$ に対して単位球面 $S^(n-1)$ の閉部分集合 $K_w$ を次のように定める.
$
  K_w = {a in S^(n-1) mid(|) a^T w <= 0}
$
この時任意の有限部分集合 $F subset E$ に対して
$
  inter.big_(w in F) K_w eq.not nothing
$
が成り立つ.
実際 $F$ が空でなければ
- $conv F$ は凸集合.
- $conv F subset E$ より $0 in.not conv F$. 従って ${0} inter conv F = nothing$.
- $conv F$ は閉集合であるからノルムが最小である点 $v_F in conv F$ が存在する.
より $section$2.5.1 の結果から ${0}$ と $conv F$ を分離する超平面 ${x mid(|) a_F^T x = b_F}$ が存在する ($a_F eq.not 0$, $a_F^T 0 >= b_F$, $a_F^T w <= b_F thick (forall w in conv F)$).
このとき $w in conv F$ に対して $a_F^T w <= 0$ である.
$hat(a)_F = frac(a_F, norm(a_F), style: "horizontal")$ とおけば $hat(a)_F in inter.big_(w in F) K_w$ である.
$S^(n-1)$ はコンパクトであることから有限交叉性より
$
  inter.big_(w in E) K_w eq.not nothing
$
が成り立つ.
この集合の要素を 1 つ取って $a$ とおくと $a eq.not 0$ であり,
任意の $z in E$ に対して $a^T z <= 0$ となる.

このとき $forall x in C$, $forall y in D$ に対して $a^T (x - y) <= 0$ より
$
  sup_(x in C) a^T x <= inf_(y in D) a^T y.
$
よって $sup a^T x$ 以上 $inf a^T y$ 以下の実数 $b$ を 1 つ取れば
$
  cases(
    thick x in C ==> a^T x <= b,
    thick y in D ==> a^T y >= b,
  )
$
となる. ${x mid(|) a^T x = b}$ は $C$ と $D$ を分離する超平面である. $qed$
