#import "../../lib.typ": alpha-enum, ex

== Exercise 2.34 (The lexicographic cone and ordering)

#ex[
  The lexicographic cone is defined as
  $
    K_"lex" = {0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0, "for some" k, thick 0 <= k < n},
  $
  i.e., all vectors whose first nonzero coefficient (if any) is positive.

  #alpha-enum(
    [Verify that $K_"lex"$ is a cone, but not a proper cone.],
    [
      We define the lexicographic ordering on $RR^n$ as follows: $x scripts(<=)_"lex" y$ if and
      only if $y - x in K_"lex"$.
      (Since $K_"lex"$ is not a proper cone, the lexicographic ordering is not a
      generalized inequality.)
      Show that the lexicographic ordering is a linear ordering: for any $x, y in RR^n$,
      either $x scripts(<=)_"lex" y$ or $y scripts(<=)_"lex" x$.
      Therefore any set of vectors can be sorted with respect to the lexicographic cone,
      which yields the familiar sorting used in dictionaries.
    ],
    [Find $K_"lex"^*$.],
  )
]

*解答*:
#alpha-enum(
  [
    $K_"lex"$ が錐であることは明らか.
    $K_"lex" subset.eq RR^2$ 上の点列 ${(frac(1, i, style: "horizontal"), -1)^T}_i$ の収束先は $(0, -1)^T in.not K_"lex"$ であるから $K_"lex"$ は閉でなく,
    従って proper cone ではない (それ以外の条件は満たす. つまり $K_"lex"$ は凸であり, 空でない内部を持ち, pointed である).

    $n = 1$ の場合は $K_"lex"$ は proper cone であり,
    $n >= 2$ の場合は上記と同様の議論で閉でないことがわかり, $K_"lex"$ は proper cone ではない.
  ],
  [
    $K_"lex" union -K_"lex" = RR^n$ を示せばよい.
    $z in RR^n$ とする.
    - $z = 0$ の場合 $z in K_"lex"$.
    - $z$ の先頭が $0$ でない, つまり $z_1 eq.not 0$ の場合, $z_1 > 0$ なら $z in K_"lex"$, $z_1 < 0$ なら $z in -K_"lex"$
    - $z$ の先頭が $0$ かつ零ベクトルでない,
      つまりある $k$ ($1 <= k < n$) に対して $z_1 = dots.c = z_k = 0$, $z_(k+1) eq.not 0$ となる場合,
      $z_(k+1) > 0$ なら $z in K_"lex"$, $z_(k+1) < 0$ なら $z in -K_"lex"$.
    従って $K_"lex" union -K_"lex" = RR^n$ である.
  ],
  [
    $K_"lex"$ は次のように書ける:
    $
      K_"lex" = union.big_(k = 0)^(n-1) ({0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0})
    $
    ここで各 ${0} union {x in RR^n mid(|) x_1 = dots.c = x_k = 0, thick x_(k+1) > 0}$ を $K_"lex"^((k))$ と置けば $K_"lex"^((k))$ は錐であり,
    $K_"lex"^*$ は
    $
      K_"lex"^* = inter.big_(k=0)^(n-1) (K_"lex"^((k)))^*
    $
    である. 各 $(K_"lex"^((k)))^*$ は次のようになる:
    $
      (K_"lex"^((k)))^* = {y in RR^n mid(|) y_(k+1) >= 0, thick y_(k+2) = dots.c = y_n = 0}
    $
    従って $K_"lex"^*$ は
    $
      K_"lex"^* = {y in RR^n mid(|) y_1 >= 0, thick y_2 = y_3 = dots.c = y_n = 0}
    $
    である. $qed$
  ],
)
