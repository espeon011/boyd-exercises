#import "../../lib.typ": alpha-enum, ex

#let dom = math.op("dom")
#let rank = math.op("rank")

== Exercise 3.9 (Second-order conditions for convexity on an affine set)

#ex[
  Let $F in RR^(n times m)$, $hat(x) in RR^n$.
  The restriction of $f: RR^n -> RR$ to the affine set $\{F z + hat(x) mid(|) z in RR^m\}$ is defined as the function $tilde(f): RR^m -> RR$ with
  $
    tilde(f)(z) = f(F z + hat(x)), quad
    dom tilde(f) = \{z mid(|) F z + hat(x) in dom f\}.
  $
  Suppose $f$ is twice differentiable with a convex domain.

  #alpha-enum[
    Show that $tilde(f)$ is convex if and only if for all $z in dom tilde(f)$
    $
      F^T nabla^2 f(F z + hat(x)) F succ.eq 0.
    $
  ][
    Suppose $A in RR^(p times n)$ is a matrix whose nullspace is equal to the range of $F$, i.e., $A F = 0$ and $rank A = n - rank F$.
    Show that $tilde(f)$ is convex if for all $z in dom tilde(f)$ there exists a $lambda in RR$ such that
    $
      nabla^2 f(F z + hat(x)) + lambda A^T A succ.eq 0.
    $
    _Hint._ Use the following result: If $B in bold("S")^n$ and $A in RR^(p times n)$, then $x^T B x >= 0$ for all $x in cal(N)(A)$ if there exists a $lambda$ such that $B + lambda A^T A succ.eq 0$.
  ]
]

*解答*: まず, $dom tilde(f)$ は凸開集合である.
実際, $z_1, z_2 in dom tilde(f)$ と $theta in [0, 1]$ に対して $dom f$ の凸性より
$
  F (theta z_1 + (1 - theta) z_2) + hat(x) = theta (F z_1 + hat(x)) + (1 - theta) (F z_2 + hat(x)) in dom f
$
で $theta z_1 + (1 - theta) z_2 in dom tilde(f)$ となる.
開集合であることは affine 写像による開集合 $dom f$ の逆像であることからわかる (Appendix A.4.1 において, differentiable といったときは定義域が開集合であることを含意するとしている).
また, $tilde(f)$ は affine 写像と 2 階微分可能関数 $f$ の合成であるから 2 階微分可能である.
#alpha-enum[
  $tilde(f)$ の $z in dom tilde(f)$ における勾配と Hesse 行列は次のようになる:
  $
    nabla tilde(f) (z) = nabla (f (F z + hat(x))) = F^T nabla f (F z + hat(x))\
    nabla^2 tilde(f) (z) = F^T nabla^2 f (F z + hat(x)) F.
  $
  $tilde(f)$ は 2 階微分可能であるから $tilde(f)$ が凸であることはその Hesse 行列が $dom tilde(f)$ の任意の点において半正定値であることと同値.
][
  $z in dom tilde(f)$ を任意にとる.
  $nabla^2 f (F z + hat(x))$ は対称行列であるから条件とヒントの結果より任意の $v in cal(N) (A)$ に対して $v^T nabla^2 f(F z + hat(x)) v >= 0$ となる.
  $w in RR^m$ を任意にとる.
  $A F = 0$ より $v = F w$ のときも成り立つため $w^T F^T nabla^2 f(F z + hat(x)) F w >= 0$ を得る.
  $w$ は任意であるから $F^T nabla^2 f(F z + hat(x)) F$ は半正定値である.
  従って (a) の結果より $tilde(f)$ は凸である.
  $qed$
]
