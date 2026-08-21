#import "../../lib.typ": alpha-enum, ex

#let conv = math.op("conv")
#let cl = math.op("cl")
#let int = math.op("int")

== Exercise 2.37 (Nonnegative polynomials and Hankel LMIs)

#ex[
  Let $K_"pol"$ be the set of (coefficients of) nonnegative polynomials of degree
  $2k$ on $RR$:
  $
    K_"pol" = {x in RR^(2k+1) mid(|) x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k) >= 0 "for all" t in RR}.
  $

  #alpha-enum(
    [
      Show that $K_"pol"$ is a proper cone.
    ],
    [
      A basic result states that a polynomial of degree $2k$ is nonnegative on $RR$
      if and only if it can be expressed as the sum of squares of two polynomials of
      degree $k$ or less. In other words, $x in K_"pol"$ if and only if the polynomial
      $
        p(t) = x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k)
      $
      can be expressed as
      $
        p(t) = r(t)^2 + s(t)^2,
      $
      where $r$ and $s$ are polynomials of degree $k$.

      Use this result to show that
      $
        K_"pol" = {x in RR^(2k+1) mid(|) x_i = sum_(m+n=i+1) Y_(m n) "for some" Y in bold(S)_+^(k+1)}.
      $
      In other words, $p(t) = x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k)$ is
      nonnegative if and only if there exists a matrix $Y in bold(S)_+^(k+1)$ such that
      $
                x_1 & = Y_(1,1) \
                x_2 & = Y_(1,2) + Y_(2,1) \
                x_3 & = Y_(1,3) + Y_(2,2) + Y_(3,1) \
        dots.v quad & \
           x_(2k+1) & = Y_(k+1,k+1).
      $
    ],
    [
      Show that $K_"pol"^* = K_"han"$ where
      $
        K_"han" = {z in RR^(2k+1) mid(|) H(z) succ.eq 0}
      $
      and
      $
        H(z) = mat(
          z_1, z_2, z_3, dots.c, z_k, z_(k+1);
          z_2, z_3, z_4, dots.c, z_(k+1), z_(k+2);
          z_3, z_4, z_5, dots.c, z_(k+2), z_(k+3);
          dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
          z_k, z_(k+1), z_(k+2), dots.c, z_(2k-1), z_(2k);
          z_(k+1), z_(k+2), z_(k+3), dots.c, z_(2k), z_(2k+1);
        ).
      $
      (This is the Hankel matrix with coefficients $z_1, dots, z_(2k+1)$.)
    ],
    [
      Let $K_"mom"$ be the conic hull of the set of all vectors of the form
      $(1, t, t^2, dots, t^(2k))$, where $t in RR$.
      Show that $y in K_"mom"$ if and only if $y_1 >= 0$ and
      $
        y = y_1 (1, bold(E) u, bold(E) u^2, dots, bold(E) u^(2k))
      $
      for some random variable $u$.
      In other words, the elements of $K_"mom"$ are nonnegative multiples of the
      moment vectors of all possible distributions on $RR$.
      Show that $K_"pol" = K_"mom"^*$.
    ],
    [
      Combining the results of (c) and (d), conclude that $K_"han" = cl K_"mom"$.

      As an example illustrating the relation between $K_"mom"$ and $K_"han"$,
      take $k = 2$ and $z = (1, 0, 0, 0, 1)$.
      Show that $z in K_"han"$, $z in.not K_"mom"$.
      Find an explicit sequence of points in $K_"mom"$ which converge to $z$.
    ],
  )
]

*注意*: 原著では $H(z)$ の定義において $3$ 行 $k+1$ 列の添字がずれていたので修正したうえで転記した.

*解答*:
#alpha-enum(
  [
    $v(t) = (1, t, dots, t^(2k))^T in RR^(2k+1)$ と書き, $p_x (t) = x^T v(t) = x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k)$ と書く.
    集合 $S$ に対して $RR_+ S = { lambda s mid(|) lambda >= 0, thick s in S}$ と書くこととし,
    $S$ が 1 元集合 ${s}$ のときは中括弧を省略して $RR_+ s$ と書く.
    このとき
    $
      K_"pol" & = {x in RR^(2k+1) mid(|) x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k) >= 0 "for all" t in RR} \
              & = inter.big_(t in RR) {x in RR^(2k+1) mid(|) x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k) >= 0} \
              & = inter.big_(t in RR) (RR_+ v(t))^*
    $
    であり, 各 $(RR_+ v(t))^*$ は閉凸錐であるからその共通部分である $K_"pol"$ も閉凸錐である.
    次に $x, -x in K_"pol"$ とする.
    このとき任意の $t in RR$ に対して $x_1 + x_2 t + x_3 t^2 + dots.c + x_(2k+1) t^(2k) = 0$ となり,
    従って $x_1 = dots.c = x_(2k+1) = 0$ である ($t$ に異なる $2k+1$ 個の値を代入した連立 1 次方程式を解けばよい).
    ゆえに $x = 0$ であり $K_"pol"$ は pointed である.
    次に $K_"pol"$ は空でない内部をもつ事を示す.
    $x' in RR^(2k+1)$ を次のように定義する:
    $
      x'_i = cases(
        k + 1 & "if" i = 1,
        2 & "if" i ":odd and" eq.not 1,
        0 & "if" i ":even",
      )
    $
    $y in B(x', 1)$ のとき各 $y_i$ は $abs(y_i - x'_i) <= 1$ であることに注意する.
    $abs(t) >= 1$ のとき
    $
      p_y (t) & = y_1 + sum_(i=1)^(k) (y_(2i) t^(2i-1) + y_(2i+1) t^(2i)) \
              & >= y_1 + sum_(i=1)^(k) (y_(2i+1) abs(t)^(2i) - abs(y_(2i)) abs(t)^(2i-1)) \
              & >= y_1 + sum_(i=1)^(k) (abs(t)^(2i) - abs(t)^(2i-1)) \
              & >= y_1 >= 0.
    $
    $abs(t) <= 1$ のとき
    $
      p_y (t) & = y_1 + sum_(i=1)^(k) (y_(2i) t^(2i-1) + y_(2i+1) t^(2i)) \
              & >= y_1 + sum_(i=1)^(k) y_(2i) t^(2i-1) \
              & >= y_1 - sum_(i=1)^k abs(t)^(2i-1) \
              & >= k - k >= 0
    $
    となり, $B(x', 1) subset.eq K_"pol"$ である.
    ゆえに $x' in int K_"pol"$ である.
  ],
  [
    $x in K_"pol"$ とする. このとき $r, s in RR^(k+1)$ が存在して $p_x (t) = p_r (t)^2 + p_s (t)^2$ が成り立つ.
    ここで $p_r (t)^2 = v(t)^T (r r^T) v(t)$ であることに注意すると
    $
      p_x (t) & = p_r (t)^2 + p_s (t)^2 \
              & = v(t)^T (r r^T + s s^T) v(t).
    $
    ここで $Y = r r^T + s s^T$ とおくと $Y succ.eq 0$ であり
    $
      p_x (t) & = v(t)^T (r r^T + s s^T) v(t) \
              & = sum_(m=1)^(k+1) sum_(n=1)^(k+1) (r_m r_n + s_m s_n) t^(m+n-2) \
              & = sum_(i=1)^(2k+1) (sum_(m+n=i+1) (r_m r_n + s_m s_n)) t^(i-1) \
              & = sum_(i=1)^(2k+1) sum_(m+n=i+1) Y_(m n) t^(i-1)
    $
    より $x_i = sum_(m+n=i+1) Y_(m n)$ である.

    逆にある $Y in bold(S)_+^(k+1)$ が存在して $x_i = sum_(m+n=i+1) Y_(m n)$ が成立したとする.
    このとき任意の $t in RR$ に対して
    $
      p_x (t) & = sum_(i=1)^(2k+1) x_i t^(i-1) \
              & = sum_(i=1)^(2k+1) sum_(m+n=i+1) Y_(m n) t^(i-1) \
              & = v(t)^T Y v(t) >= 0
    $
    となり, 従って $x in K_"pol"$ である.
  ],
  [
    $z in RR^(2k+1)$ に対して ${z^T x mid(|) x in K_"pol"}$ が $RR_+$ に含まれるような $z$ の全体が $K_"pol"^*$ である.
    ここで
    $
      {z^T x mid(|) x in K_"pol"} & = {sum_(i=1)^(2k+1) x_i z_i mid(|) x in K_"pol"} \
                                  & = {sum_(i=1)^(2k+1) (sum_(m+n=i+1) Y_(m n)) z_i mid(|) Y in bold(S)_+^(k+1)} \
                                  & = {sum_(i=1)^(2k+1) sum_(m+n=i+1) Y_(m n) z_(m+n-1) mid(|) Y in bold(S)_+^(k+1)} \
                                  & = {sum_(i=1)^(2k+1) sum_(m+n=i+1) Y_(m n) H(z)_(m n) mid(|) Y in bold(S)_+^(k+1)} \
                                  & = {sum_(m=1)^(k+1) sum_(n=1)^(k+1) Y_(m n) H(z)_(m n) mid(|) Y in bold(S)_+^(k+1)} \
                                  & = {chevron.l Y, H(z) chevron.r mid(|) Y in bold(S)_+^(k+1)}.
    $
    よって $forall x in K_"pol", z^T x >= 0$ は $forall Y in bold(S)_+^(k+1), chevron.l Y, H(z) chevron.r >= 0$ と同値である.
    従って
    $
      z in K_"pol"^* <=> H(z) in (bold(S)_+^(k+1))^* = bold(S)_+^(k+1)
    $
    である.
    ゆえに $K_"pol"^* = {z in RR^(2k+1) mid(|) H(z) succ.eq 0}$ となる.
  ],
  [
    $K_"mom" = RR_+ conv {v(t) mid(|) t in RR}$ であることに注意すると
    $
      K_"mom"^* & = (RR_+ conv {v(t) mid(|) t in RR})^* \
      & = {x in RR^(2k+1) mid(|) forall lambda >=0, forall z in conv {v(t) mid(|) t in RR}, thick x^T (lambda z) >= 0} \
      & = {x in RR^(2k+1) mid(|) forall z in conv {v(t) mid(|) t in RR}, thick x^T z >= 0} \
      & = {x in RR^(2k+1) mid(|) forall t in RR, thick x^T v(t) >= 0} = K_"pol"
    $
    である.

    $y in K_"mom"$ とする. このとき $lambda >= 0$ と $t_1, dots, t_n in RR$ と和が $1$ となる $theta_1, dots, theta_n in [0, 1]$ が存在して
    $
      y = lambda sum_(i=1)^n theta_i v(t_i)
    $
    と書ける.
    ここで離散確率分布 $u$ を確率 $theta_i$ で $t_i$ を取るものと定義すると
    $
      y = lambda sum_(i=1)^n theta_i v(t_i) = lambda (1, bold(E) u, dots, bold(E) u^(2k))^T
    $
    となる.

    逆に確率変数 $u$ を用いて $y = y_1 (1, bold(E) u, dots, bold(E) u^(2k))^T$ と書けるとき $y in K_"mom"$ であることを示す.
    $y_1 = 0$ のとき明らかに $y in K_"mom"$.
    $y_1 > 0$ の場合は $y_1 = 1$ としても一般性を失わないため以降 $y = (1, bold(E) u, dots, bold(E) u^(2k))^T$ とする.
    背理法のため $y in.not K_"mom"$ とする.
    このとき分離超平面定理より $c in RR^(2k+1) without {0}$ で
    $
      c^T y <= c^T z quad (forall z in K_"mom")
    $
    を満たすものが存在する.
    このとき $K_"mom"$ は非負のスカラー倍で閉じているため,
    右辺の下限は $0$ か $-infinity$ であるが下に有界なため $0$ である.
    従って
    $
      c^T y <= 0, quad quad c^T z >= 0 quad (forall z in K_"mom")
    $
    が成り立つ.
    このことから $c in K_"mom"^* = K_"pol"$ より任意の $t in RR$ に対して $p_c (t) >= 0$ である.
    一方で
    $
      0 >= c^T y = bold(E) p_c (u) >= inf_(t in RR) p_c (t) >= 0
    $
    より $bold(E) p_c (u) = 0$ である.
    一方で $p_c (t)$ は常に非負であり, $p_c (u)$ の期待値が $0$ であるから $p_c (u)$ はほとんど至る所で $0$ である.
    しかし $c eq.not 0$ より $p_c (t)$ の根は高々 $2k$ 個しかないため, $u$ は測度零集合での差を除いて離散確率変数である.
    その取り得る値を $t_1, dots, t_n$ として確率を $theta_1, dots, theta_n$ とすれば $sum_i theta_i = 1$ であり,
    $
      y = (1, bold(E) u, dots, bold(E) u^(2k))^T & = (1, sum_(i=1)^(n) theta_i t_i, dots, sum_(i=1)^(n) theta_i t_i^(2k))^T \
                                                 & = sum_(i=1)^n theta_i (1, t_i, dots, t_i^(2k))^T in K_"mom"
    $
    となる.
  ],
  [
    $K_"mom"$ が凸錐包として定義されていたことより $K_"han" = K_"pol"^* = K_"mom"^(**) = cl K_"mom"$ となる.

    $z = (1, 0, 0, 0, 1)$ に対して
    $
      H(z) = mat(1, 0, 0; 0, 0, 0; 0, 0, 1)
    $
    であり, その固有値は $1$, $0$, $1$ であるから $H(z) succ.eq 0$. 従って $z in K_"han"$ である.
    また, $z$ が $K_"mom"$ の元であるとすると $lambda >= 0$ と $t_1, dots, t_n$ と和が $1$ である $theta_1, dots, theta_n > 0$ で $lambda sum_i theta_i v(t_i)$ と書けなければならないが,
    $z$ の第 1 成分が $1$ であるため $lambda = 1$,
    $z$ の第 3 成分が $0$ であるため $t_1 = dots.c = t_n = 0$ だが,
    $z$ の第 5 成分が $1$ であるため矛盾してしまう.
    従って $z in.not K_"mom"$ である.

    確率変数列 ${u_n}_n$ を
    $
      P(u_n = t) = cases(
        1 - frac(1, n^4, style: "horizontal") & "if" t = 0,
        frac(1, (2n^4), style: "horizontal") & "if" t in {n, -n},
        0 & "otherwise"
      )
    $
    と定める.
    このときモーメントベクトルは
    $
      K_"mom" in.rev (1, bold(E) u_n, bold(E) u_n^2, bold(E) u_n^3, bold(E) u_n^4)^T = (1, 0, frac(1, n^2, style: "horizontal"), 0, 1)^T -> (1, 0, 0, 0, 1)^T
    $
    となり, これが $z$ に収束する $K_"mom"$ 内の点列であるとわかる.
    $qed$
  ],
)
