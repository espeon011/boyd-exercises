#import "../../lib.typ": alpha-enum, ex

== Exercise 2.38 (Convex cones constructed from sets)

#ex[
  \[Roc70, pages 15, 61\]
  #alpha-enum(
    [
      The _barrier cone_ of a set $C$ is defined as the set of all vectors $y$ such that
      $y^T x$ is bounded above over $x in C$.
      In other words, a nonzero vector $y$ is in the barrier cone if and only if it is
      the normal vector of a halfspace ${x mid(|) y^T x <= alpha}$ that contains $C$.
      Verify that the barrier cone is a convex cone (with no assumptions on $C$).
    ],
    [
      The _recession cone_ (also called _asymptotic cone_) of a set $C$ is defined as
      the set of all vectors $y$ such that for each $x in C$, $x - t y in C$ for all $t >= 0$.
      Show that the recession cone of a convex set is a convex cone.
      Show that if $C$ is nonempty, closed, and convex, then the recession cone of $C$
      is the dual of the barrier cone.
    ],
    [
      The _normal cone_ of a set $C$ at a boundary point $x_0$ is the set of all vectors $y$
      such that $y^T (x - x_0) <= 0$ for all $x in C$
      (i.e., the set of vectors that define a supporting hyperplane to $C$ at $x_0$).
      Show that the normal cone is a convex cone (with no assumptions on $C$).
      Give a simple description of the normal cone of a polyhedron
      ${x mid(|) A x prec.eq b}$ at a point in its boundary.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    $C$ の barrier cone を $B_C$ と書く.
    $C$ が空なら $B_C = RR^n$ である. 以下 $C eq.not nothing$ とする.
    $y in B_C$ とし, $alpha = sup_(x in C) y^T x$ とする.
    $lambda >= 0$ のとき任意の $x in C$ に対して
    $
      (lambda y)^T x = lambda (y^T x) <= lambda alpha
    $
    より $(lambda y)^T x$ は $C$ 上, 上に有界であるため,
    $lambda y in B_C$ である.
    従って barrier cone は錐である.

    $y_1, y_2 in B_C$ とし, $alpha_i = sup_(x in C) y_i^T x$ とする.
    $theta in [0, 1]$ のとき任意の $x in C$ に対して
    $
      (theta y_1 + (1 - theta) y_2)^T x = theta (y_1^T x) + (1 - theta) (y_2^T x) <= theta alpha_1 + (1 - theta) alpha_2
    $
    より $(theta y_1 + (1 - theta) y_2)^T x$ は $C$ 上, 上に有界であるため,
    $theta y_1 + (1 - theta) y_2 in B_C$ である.
    従って barrier cone は凸である.
  ],
  [
    $C$ の recession cone を $R_C$ と書く.
    $y in R_C$ とし, $lambda >= 0$ とする.
    このとき任意の $x in C$ と任意の $t >= 0$ に対して
    $
      x - t (lambda y) = x - (t lambda) y in C
    $
    となる. よって recession cone は錐である.

    $C$ を凸集合とする.
    $y_1, y_2 in R_C$ とし, $theta in [0, 1]$ とする.
    このとき任意の $x in C$ と任意の $t >= 0$ に対して $C$ の凸性から
    $
      x - t (theta y_1 + (1 - theta) y_2) = theta (x - t y_1) + (1 - theta) (x - t y_2) in C
    $
    が成り立つ. 従って凸集合の recession cone は凸である.

    $R_C = B_C^*$ を示す.
    まず $z in R_C$ とする. このとき任意の $x in C$ に対して $x - RR_+ z subset.eq C$ が成り立つ.
    $y in B_C$ とすると $y^T x$ は $C$ 上, 上に有界であったから $C$ の部分集合である $x - RR_+ z$ 上でも上に有界である.
    つまり
    $
      sup_(t >= 0) (y^T x - t y^T z) < infinity.
    $
    よって $y^T z >= 0$ である.
    いま $y in B_C$ は任意であったから $z in B_C^*$ である.
    次に $z in B_C^*$ とし $z in R_C$ を示す.
    背理法のため, ある $x in C$ と $t >= 0$ が存在して $x - t z in.not C$ が成立したとする.
    ここで $C$ は凸かつ閉であるから強分離定理よりある $c eq.not 0$ と $b in RR$ が存在して
    $
      c^T (x - t z) & > b \
             c^T x' & < b quad (forall x' in C)
    $
    が成り立つ.
    特に 2 つ目の式から $c in B_C$ であり, 従って $c^T z >= 0$ である.
    更に $x in C$ より $c^T x < b$ であることに注意すると
    $
      b < c^T (x - t z) = c^T x - t c^T z < b - t c^T z <= b
    $
    となり, $b < b$ が導け矛盾する.
    従って任意の $x in C$, $t >= 0$ に対して $x - t z in C$ であり, $z in R_C$ である.
  ],
  [
    集合 $S$ に対して $RR_+ S = {lambda s mid(|) lambda in RR_+, thick s in S}$ と書くことにする.
    $C$ の $x_0$ における normal cone を $N_(C,x_0)$ と書くと,
    定義より $N_(C,x_0) = (RR_+ (x_0 - C))^*$ であるから $N_(C,x_0)$ は凸錐である(双対錐は元の錐が凸であるか否かに関わらず凸).

    また, $C = {x mid(|) A x prec.eq b}$ とその境界上の点 $x_0$ に対する normal cone $N_(C,x_0)$ は,
    $A$ から $A x_0 prec.eq b$ の等号が成り立つ行だけを取り出した行列 $A'$ を用いて ${A'^T y mid(|) y succ.eq 0}$ と書ける.
    まず, 下記が成り立つ:
    $
      RR_+ (x_0 - C) = {z mid(|) A' z succ.eq 0}.
    $
    左辺 $subset.eq$ 右辺は明らか.
    左辺 $supset.eq$ 右辺は次のように示す:
    $d = A x_0 - b$ とおく.
    $A x_0 prec.eq b$ の等号が成り立つ行が $i_1, dots, i_K$ 行であるとする.
    このとき $k = 1, dots, K$ に対して $d_(i_k) = 0$ であり, それ以外の $i$ に対して $d_i < 0$ である.
    $z$ を右辺の元とする.
    このとき $(A z)_(i_k) >= 0 = d_(i_k)$ が成り立つ.
    それ以外の $i$ に対して $(A z)_i >= d_i$ が成り立つとは限らないが,
    $epsilon > 0$ を次のように取ることで全ての $i$ に対して $(A (epsilon z))_i >= d_i$ とできる:
    $
      epsilon = min ({1} union {abs(d_i) / abs((A z)_i) mid(|) (A z)_i < d_i < 0}).
    $
    このとき $A (epsilon z) succ.eq d = A x_0 - b$ より $A (x_0 - epsilon z) prec.eq b$ となり,
    $x_0 - epsilon z in C$ より $z in RR_+ (x_0 - C)$ である.

    上記と #link(<ex-2-32>)[演習問題 2.32] を用いて
    $
      N_(C,x_0) = (RR_+ (x_0 - C))^* = {z mid(|) A' z succ.eq 0}^* = {A'^T y mid(|) y succ.eq 0}
    $
    と計算できる. $qed$
  ],
)
