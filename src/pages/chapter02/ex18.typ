#import "../../lib.typ": ex

#let dom = math.op("dom")
#let hfrac(a, b) = math.frac(a, b, style: "horizontal")

== Exercise 2.18 (Invertible linear-fractional functions)

#ex[
  Let $f: RR^n -> RR^n$ be the linear-fractional function
  $
    f(x) = (A x + b) / (c^T x + d), quad dom f = {x mid(|) c^T x + d > 0}.
  $
  Suppose the matrix
  $
    Q = mat(A, b; c^T, d)
  $
  is nonsingular. Show that $f$ is invertible and that $f^(-1)$ is a
  linear-fractional mapping. Give an explicit expression for $f^(-1)$ and its
  domain in terms of $A$, $b$, $c$, and $d$.
  _Hint._ It may be easier to express $f^(-1)$ in terms of $Q$.
]

*解答*:
$Q$ を用いて記述する.
$
  Q^(-1) = mat(hat(A), hat(b); hat(c)^T, hat(d))
$
と書く.
$f$ は $J: x |-> (x, 1)$ と perspective function $P: (x, t) |-> hfrac(x, t)$ を用いて $f = P Q J$ と書ける.
このとき $f$ が ${x in RR^n mid(|) c^T x + d > 0}$ から ${x in RR^n mid(|) hat(c)^T x + hat(d) > 0}$ への全単射であることを示す.

まず $x$ が $c^T x + d > 0$ を満たすとき $y = f(x)$ は $hat(c)^T y + hat(d)$ を満たすことを示す.
$hat(c)^T y + hat(d)$ は $Q^(-1) J y$ の 第 $n + 1$ 成分の値であるが,
$
  Q^(-1) J y & = Q^(-1) J P Q J x \
             & = Q^(-1) mat((A x + b) / (c^T x + d); 1) \
             & = 1 / (c^T x + d) Q^(-1) mat(A x + b; c^T x + d) \
             & = 1 / (c^T x + d) Q^(-1) Q mat(x; 1) \
             & = 1 / (c^T x + d) mat(x; 1)
$
より第 $n + 1$ 成分は $hfrac(1, (c^T x + d)) > 0$ であり,
従って $f({x in RR^n mid(|) c^T x + d > 0}) subset {y in RR^n mid(|) hat(c)^T y + hat(d) > 0}$ である.

次に $g = P Q^(-1) J$ と定める.
$g(y) = hfrac((hat(A) y + hat(b)), (hat(c)^T y + hat(d)))$ である.
上記と同様の議論で $g({y in RR^n mid(|) hat(c)^T y + hat(d) > 0}) subset {x in RR^n mid(|) c^T x + d > 0}$ とわかる.

最後に $g f = id$, $f g = id$ を示す.
$
  g f (x) & = P Q^(-1) J P Q J x \
          & = P (1 / (c^T x + d) mat(x; 1)) \
          & = x, \
  f g (y) & = P Q J P Q^(-1) J y \
          & = P (1 / (hat(c)^T x + hat(d)) mat(y; 1)) \
          & = y.
$
従って $g$ は $f$ の逆写像である.
$f$ は可逆であり, $f^(-1) = g$ は $f$ と同様に linear fractional mapping である. $qed$

*補足*:
$Q^(-1)$ は追加の仮定をおくことで $A$, $b$, $c$, $d$ を用いて比較的簡単に書き表すことができる.
例えば $d eq.not 0$ であれば
$
  Q = mat(I, (hfrac(1, d)) b; 0, 1) mat(A - (hfrac(1, d)) b c^T thick, 0; 0, d) mat(I, 0; (hfrac(1, d)) c^T, 1) \
  Q^(-1) = mat(I, 0; -(hfrac(1, d)) c^T, 1) mat((A - (hfrac(1, d)) b c^T)^(-1) thick, 0; 0, hfrac(1, d)) mat(I thick, -(hfrac(1, d)) b; 0, 1)
$
と計算できる.
この $A - (hfrac(1, d)) b c^T$ を $hfrac(Q, d)$ と書いて $Q$ の $d$ に関する Schur 補行列とよぶ.

同様に $det A eq.not 0$ の場合も $Q$ の $A$ に関する Schur 補行列 $hfrac(Q, A) := d - c^T A^(-1) b$ を用いて $Q^(-1)$ を書き表すことができるが,
$det Q eq.not 0$ であっても $det A = 0$ かつ $d = 0$ となるケースもあり得るためブロック行列の逆行列の公式が常に使えるわけではない.
