#import "../../lib.typ": alpha-enum, ex

#let int = math.op("int")
#let cl = math.op("cl")
#let conv = math.op("conv")
#let aff = math.op("aff")

== Exercise 2.31 (Properties of dual cones)

#ex[
  Let $K^*$ be the dual cone of a convex cone $K$, as defined in (2.19).
  Prove the following.

  #alpha-enum(
    [
      $K^*$ is indeed a convex cone.
    ],
    [
      $K_1 subset.eq K_2$ implies $K_2^* subset.eq K_1^*$.
    ],
    [
      $K^*$ is closed.
    ],
    [
      The interior of $K^*$ is given by
      $int K^* = {y mid(|) y^T x > 0 "for all" x in cl K}$.
    ],
    [
      If $K$ has nonempty interior then $K^*$ is pointed.
    ],
    [
      $K^(**)$ is the closure of $K$.
      (Hence if $K$ is closed, $K^(**) = K$.)
    ],
    [
      If the closure of $K$ is pointed then $K^*$ has nonempty interior.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    $y, z in K^*$ とし, $theta_1, theta_2 in RR_+$ とする.
    このとき任意の $x in K$ に対し
    $
      x^T (theta_1 y + theta_2 z) = theta_1 x^T y + theta_2 x^T z >= 0
    $
    より $theta_1 y + theta_2 z in K^*$ であり, $K^*$ は凸錐である.
  ],
  [
    $K_1 subset.eq K_2$ とし, $y in K_2^*$ を取る.
    このとき任意の $x in K_2$ に対して $x^T y >= 0$ より任意の $x in K_1$ に対しても $x^T y >= 0$ であり,
    $y in K_1^*$ である.
    従って $K_2^* subset.eq K_1^*$.
  ],
  [
    $K^*$ 内の収束列 ${y_i}_i$ を任意に取る.
    このとき任意の $x in K$ に対して $x$ と内積を取る $RR^n$ 上の関数 $f_x (y) = x^T y$ を考える.
    $f_x$ は $K^*$ の元 $y$ に対して $f_x (y) >= 0$ を満たし, 連続であることから
    $
      f_x (lim_(i -> infinity) y_i) = lim_(i -> infinity) f_x (y_i) >= 0.
    $
    ここで $x in K$ は任意であったから $lim_(i -> infinity) y_i in K^*$.
    従って $K^*$ は閉である.
  ],
  [
    問題文のままだと成立しないので下記を証明する:
    $
      int K^* = {y mid(|) y^T x > 0 "for all" x in cl K without {0}}
    $
    また, $K = {0}, nothing$ の場合は自明なので $K supset.neq {0}$ であるとする.

    ($subset.eq$): まず, $z in K^*$ は任意の $x in cl K$ に対し $x^T z >= 0$ を満たす.
    実際, $x$ に収束する $K$ 上の点列 ${x_i}_i$ を取れば任意の $i$ に対して $x_i^T z >= 0$ であることから $x^T z >= 0$ である.
    $y in int K^*$ とする. このとき $epsilon > 0$ が存在して $v in B(0, epsilon) => y + v in K^*$ が成り立つ.
    任意の $x in cl K without {0}$ に対し $v = -epsilon frac(x, norm(x), style: "horizontal") in B(0, epsilon)$ とすれば $y + v in K^*$ であり
    $
      x^T (y + v) & >= 0 \
            x^T y & >= epsilon norm(x) > 0
    $
    より $y^T x > 0$ である. 従って $y$ は右辺の元である.

    ($supset.eq$): 右辺の集合は次のように記述できる:
    $
      {y mid(|) y^T x > 0 "for all" x in cl K without {0}} = {y mid(|) y^T x > 0 "for all" x in cl K, norm(x) = 1}
    $
    なぜなら $cl K$ は錐であり, $cl K$ の $0$ 以外の任意の元は ${x in cl K mid(|) norm(x) = 1}$ の元の正の定数倍で得られるからである.
    また, ${x in cl K mid(|) norm(x) = 1}$ はコンパクトである.
    よってこれを $S$ とおくと
    $
      {y mid(|) y^T x > 0 "for all" x in cl K, norm(x) = 1} = {y mid(|) min_(x in S) y^T x > 0}
    $
    と書ける.
    また, 任意の $epsilon > 0$ に対して連続関数 $f: S times B(0, epsilon) -> RR: (x, y) |-> x^T y$ は最小値 $-epsilon$ を持つ:
    $
      min_((x, y) in S times B(0, epsilon)) x^T y = min_(x in S) x^T (-epsilon x) = -epsilon
    $
    さて, $y in {y mid(|) y^T x > 0 "for all" x in cl K without {0}}$ とする.
    このとき $q = min_(x in S) y^T x$ とおけば $q > 0$ である.
    このとき $z in B(y, q)$, $x in K$ に対して,
    $
           x = 0 & ==> x^T z && = 0 \
      x eq.not 0 & ==> x^T z && = norm(x) (x / norm(x))^T (y + (z - y)) \
                 &           && = norm(x) ((x / norm(x))^T y + (x / norm(x))^T (z - y)) \
                 &           && >= norm(x) (q - q) = 0
    $
    となり, $z in K^*$ である.
    よって $B(y, q) subset.eq K^*$ であり, 従って $y in int K^*$ である.
  ],
  [
    $x in int K$, $y, -y in K^*$ とする.
    このとき $x^T y >= 0$ かつ $x^T (-y) >= 0$ より $x^T y = 0$ である.
    $x in int K$ より $epsilon > 0$ が存在して $B(x, epsilon) subset.eq K$ となる.
    ここで $y eq.not 0$ とすると $x - (frac(epsilon, norm(y), style: "horizontal")) y in K$ であり
    $
      0 <= (x - (frac(epsilon, norm(y), style: "horizontal")) y)^T y = - epsilon norm(y) <= 0
    $
    となって $norm(y) = 0$ となり矛盾する. 従って $y = 0$ である.
    ゆえに $K^*$ は pointed である.
  ],
  [
    $K^(**) = cl K$ を示す.
    また, $K = nothing$ のとき成立しないので $K eq.not nothing$ とする.

    ($subset.eq$): $x_0 in.not cl K$ とする.
    $cl K$ は閉凸集合であるから Example 2.20 より ${x_0}$ と $cl K$ を強分離する超平面 $a^T x + b = 0$ が存在する.
    $a^T x_0 + b > 0$ かつ $cl K$ 上 $a^T x + b < 0$ とする.
    $0 in cl K$ であることから $b < 0$ である. よって $a^T x_0 > - b > 0$ である.
    次に $cl K$ 上 $a^T x <= 0$ である.
    これはもし $a^T x > 0$ なる $x in cl K$ が存在した場合に十分大きい正の定数倍を施すことで $a^T x + b > 0$ とできてしまうことから従う.
    従って $-a in (cl K)^*$ であり, (b) より $(cl K)^* subset.eq K^*$ であるから $-a in K^*$ である.
    一方で $(-a)^T x_0 < 0$ であるから $x_0 in.not K^(**)$ であり, ゆえに $K^(**) subset.eq cl K$ である.

    ($supset.eq$): $x in K$ であれば $K^*$ の定義から任意の $y in K^*$ に対して $x^T y >= 0$ であるから $x in K^(**)$ である.
    従って $K subset.eq K^(**)$ であるが, (c) より $K^(**)$ は閉であるから $K^(**) supset.eq cl K$ である.
  ],
  [
    対偶を示す.
    まず, 一般の凸集合 $C subset.eq RR^n$ について $int C eq.not nothing$ と $aff C = RR^n$ は同値であることに注意する.
    $int K^* = nothing$ とすると $aff K^*$ は $RR^n$ より真に小さい $0$ を含む affine 集合であるため,
    $RR^n$ の低次元線形部分空間であり, 従ってある超平面 ${x mid(|) a^T x = 0}$ ($a eq.not 0$) に含まれる.
    このとき $a, -a in K^(**) = cl K$ であり, $cl K$ は pointed でない.
    $qed$
  ],
)
