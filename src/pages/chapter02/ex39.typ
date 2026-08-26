#import "../../lib.typ": ex

#let int = math.op("int")
#let cl = math.op("cl")

== Exercise 2.39 (Separation of cones)

#ex[
  Let $K$ and $tilde(K)$ be two convex cones whose interiors are nonempty and disjoint.
  Show that there is a nonzero $y$ such that $y in K^*$, $-y in tilde(K)^*$.
]

*解答*: $int K$ と $int tilde(K)$ は互いに素な非空凸集合であるため,
分離超平面定理からベクトル $y eq.not bold(0)$ と $b in RR$ が存在して
$
         x in int K & ==> y^T x >= b \
  x in int tilde(K) & ==> y^T x <= b
$
となる.
閉包を取ることで以下が成り立つ (補足を参照):
$
         x in K & ==> y^T x >= b \
  x in tilde(K) & ==> y^T x <= b.
$
ここで $K$ と $tilde(K)$ は空でない錐なので $bold(0)$ を要素としてもつ.
従って $y^T bold(0) >= b$ かつ $y^T bold(0) <= b$ となり, $b = 0$ とわかる.
よって
$
         x in K & ==> y^T x >= 0 \
  x in tilde(K) & ==> y^T x <= 0.
$
ゆえに $y in K^*$ であり, $tilde(K)$ についても $-y$ で書き直せば $-y in tilde(K)^*$ とわかる.
$qed$

*補足 (内部が空でない凸集合 $S$ に対して $S subset.eq cl (int S)$ が成り立つこと)*:
$S$ の内部が空でないことから $z in int S$ が取れる.
このときある $epsilon > 0$ が存在して $B(z, epsilon) subset.eq S$ となる.
任意の $x in S$ に対して
$
  f_x (t) = t x + (1 - t) z quad (t in [0, 1))
$
を考える.
このとき $f_x (t) in int S$ である.
実際, $w = f_x (t)$ に対して $B(w, (1 - t) epsilon)$ 上の点 $w + v$ ($v in B(bold(0), (1 - t) epsilon)$) は
$
  w + v & = t x + (1 - t) z + (1 - t) (1 / (1 - t) v) \
        & = t x + (1 - t) (z + 1 / (1 - t) v)
$
となり, $x in S$ と $z + frac(v, (1 - t), style: "horizontal") in B(z, epsilon) subset.eq S$ から $w + v in S$ である.
従って $B(w, (1 - t) epsilon) subset.eq S$ であり, $f_x (t)$ は $S$ の内点である.
$t -> 1$ とすれば $f_x (t) -> x$ より $x in cl (int S)$ とわかる.
