#import "../../lib.typ": alpha-enum, ex

#let conv = math.op("conv")
#let dom = math.op("dom")

== Exercise 2.17 (Image of polyhedral sets under perspective function) <ex-2-17>

#ex[
  In this problem we study the image of hyperplanes, halfspaces, and polyhedra
  under the perspective function $P(x, t) = frac(x, t, style: "horizontal")$,
  with $dom P = RR^n times RR_"++"$.
  For each of the following sets $C$, give a simple description of
  $
    P(C) = { frac(v, t, style: "horizontal") mid(|) (v, t) in C, t > 0 }.
  $

  #alpha-enum(
    [
      The polyhedron $C = conv {(v_1, t_1), dots, (v_K, t_K)}$
      where $v_i in RR^n$ and $t_i > 0$.
    ],
    [
      The hyperplane $C = {(v, t) mid(|) f^T v + g t = h}$
      (with $f$ and $g$ not both zero).
    ],
    [
      The halfspace $C = {(v, t) mid(|) f^T v + g t <= h}$
      (with $f$ and $g$ not both zero).
    ],
    [
      The polyhedron $C = {(v, t) mid(|) F v + g t prec.eq h}$.
    ],
  )
]

*解答*:
#alpha-enum(
  [
    $conv{ frac(v_1, t_1, style: "horizontal"), dots, frac(v_K, t_K, style: "horizontal")}$ になる.
    これを $D$ とおく. \
    ($P(C) subset D$): $theta_1, dots, theta_K in [0, 1]$ かつ $theta_1 + dots.c + theta_K = 1$ とする.
    このとき
    $
      P(sum_(i=1)^K theta_i (v_i, t_i))
      = P(sum_(i=1)^K theta_i v_i, sum_(i=1)^K theta_i t_i)
      = (sum_(i=1)^K theta_i v_i) / (sum_(i=1)^K theta_i t_i)
      = sum_(i=1)^K (theta_i t_i ) / (sum_(j=1)^K theta_j t_j) v_i / t_i.
    $
    ここで $theta'_i = frac(theta_i t_i, (sum_(j=1)^K theta_j t_j), style: "horizontal")$ と定めると $theta'_i in [0, 1]$ かつ $sum_(i=1)^K theta'_i = 1$ を満たす.
    従って $P(C)$ の元は $D$ の元である. \
    ($P(C) supset D$): perspective function は凸性を保つので $P(C)$ は凸である.
    また, $frac(v_i, t_i, style: "horizontal") in P(C)$ であることと $conv$ の最小性より $D subset P(C)$ である.
  ],
  [
    $f = 0$ の場合全空間か空集合.
    それ以外で $h = 0$ なら超平面, $h eq.not 0$ なら半空間となる.
    - $f = 0$ のとき仮定より $g eq.not 0$ であり, 条件式は $t = frac(h, g, style: "horizontal")$ となるため $C = {(v, frac(h, g, style: "horizontal")) mid(|) v in RR^n}$ である.
      $frac(h, g, style: "horizontal") > 0$ であれば $P(C) = RR^n$ であり, そうでなければ $C inter dom P = nothing$ であるため $P(C) = nothing$ である.
      以下 $f eq.not 0$ とする.
    - $h = 0$ の場合, $C = {(v, t) mid(|) f^T v + g t = 0}$ となる.
      よって $w in P(C)$ は $f^T w + g = 0$ を満たす.
      逆に $f^T w + g = 0$ であるような $w$ に対して $(w, 1) in C$ かつ $P(w, 1) = w$ であるため
      $
        P(C) = {w in RR^n mid(|) f^T w + g = 0}
      $
      である.
    - $h eq.not 0$ の場合, $C$ の条件式は $t (f^T (frac(v, t, style: "horizontal")) + g) = h$ と書ける.
      従って $f^T (frac(v, t, style: "horizontal")) + g$ と $h$ は同符号である.
      逆に $f^T w + g$ と $h$ が同符号であるとき, ある $t > 0$ が存在して $t (f^T w + g ) = h$ を満たす.
      このとき $(t w, t) in C$ かつ $P(t w, t) = w$ である.
      従って
      $
        P(C) = {w in RR^n mid(|) f^T w + g "and" h "have the same sign"} = {w in RR^n mid(|) h (f^T w + g) > 0}.
      $
  ],
  [
    $f = 0$ の場合全空間か空集合.
    それ以外で $h <= 0$ なら半空間, $h > 0$ なら全空間となる.
    - $f = 0$ の場合, $g eq.not 0$ であり, $C = RR^n times {t in RR mid(|) g t <= h}$ となる.
      ${t in RR mid(|) g t <= h}$ が正の元を持てば $P(C) = RR^n$, 持たなければ $P(C) = nothing$ である.
      ${t in RR mid(|) g t <= h}$ が正の元を持たないのは $g > 0$ かつ $h <= 0$ のときのみである.
      従って
      $
        P(C) = cases(
          RR^n quad & ("if" g <= 0 or h > 0),
          nothing quad & ("if" g > 0 and h <= 0).
        )
      $
      以下 $f eq.not 0$ とする.
    - $h = 0$ の場合, $C = {(v, t) mid(|) f^T (frac(v, t, style: "horizontal")) + g <= 0 }$ となる.
      よって $w in P(C)$ は $f^T w + g <= 0$ を満たす.
      逆に $w in RR^n$ が $f^T w + g <= 0$ を満たすとき, $(w, 1) in C$ かつ $P(w, 1) = w$  であるため
      $
        P(C) = {w in RR^n mid(|) f^T w + g <= 0}
      $
      である.
    - $h > 0$ の場合, 任意の $w in RR^n$ に対して, ある $t > 0$ が存在して $t (f^T w + g) <= h$ とできる.
      実際, $f^T w + g <= 0$ であれば $t = 1$ とすればよく, $f^T w + g > 0$ であっても $t > 0$ を十分小さくとれば $t (f^T w + g) <= h$ となる.
      このとき $(t w, t)$ は $f^T (t w) + g t <= h$ を満たすので $C$ の元であり, $P(t w, t) = w$ であるから
      $
        P(C) = RR^n
      $
      である.
    - $h < 0$ の場合, $t (f^T (frac(v, t, style: "horizontal")) + g) <= h < 0$ より $f^T (frac(v, t, style: "horizontal")) + g < 0$ である.
      逆に $w in RR^n$ が $f^T w + g < 0$ を満たすとき $t > 0$ を十分大きく取れば $t (f^T w + g) <= h$ とできる.
      このとき $(t w, t)$ は $f^T (t w) + g t <= h$ を満たすので $C$ の元であり, $P(t w, t) = w$ であるから
      $
        P(C) = {w in RR^n mid(|) f^T w + g < 0}
      $
      である.
  ],
  [
    以下, $h_i > 0$ の行と $F_i = 0$ の行は除いて考える.
    $h$ の成分が $0$ である部分だけ取り出したベクトルを $h_0$ とし, $g$ から対応する成分を取り出したベクトルを $g_0$, $F$ から対応する行を取り出した行列を $F_0$ とする.
    同様に $h$ の成分が負である部分だけ取り出したベクトルを $h_-$ とし, $g$ から対応する成分を取り出したベクトルを $g_-$, $F$ から対応する行を取り出した行列を $F_-$ とする.
    このとき
    $
      P(C) = {w in RR^n mid(|) F_0 w + g_0 prec.eq 0, thick F_- w + g_- prec 0}
    $
    である.
    実際, (c) を適用すれば $P(C)$ がこの条件を満たしていることがわかり,
    逆に $w in RR^n$ が上記条件を満たしているとき,
    $t$ を十分大きく (例えば$F_- (t w) + g_- t prec.eq h_-$ を満たすように) 取れば $(t w, t) in C$ であり, $P(t w, t) = w$ である. $qed$
  ],
)
