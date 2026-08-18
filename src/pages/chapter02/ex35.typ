#import "../../lib.typ": ex

#let conv = math.op("conv")
#let cl = math.op("cl")

== Exercise 2.35 (Copositive matrices)

#ex[
  A matrix $X in bold(S)^n$ is called _copositive_ if $z^T X z >= 0$ for all $z succ.eq 0$.
  Verify that the set of copositive matrices is a proper cone. Find its dual cone.
]

*解答*: $K = {X in bold(S)^n mid(|) forall z succ.eq 0, z^T X z >= 0}$ とおく.

- (錐であること): $X in K$ とし,
  $alpha >= 0$ とすると任意の $z succ.eq 0$ に対して $z^T (alpha X) z = alpha z^T X z >= 0$ より $alpha X in K$ であり,
  従って $K$ は錐である.
- (閉であること): 収束列 ${X_i}_i subset.eq K$ を取る.
  このとき $z^T X_i z >= 0$ より $z^T (lim_(i -> infinity) X_i) z >=0$ であり, $lim_(i -> infinity) X_i in K$ とわかる.
  従って $K$ は閉である.
- (凸であること): $X, Y in K$ とし, $theta in [0, 1]$ とする.
  このとき $z succ.eq 0$ に対して
  $
    z^T (theta X + (1 - theta) Y) z = theta z^T X z + (1 - theta) z^T Y z >= 0
  $
  となり, $theta X + (1 - theta) Y in K$ である. 従って $K$ は凸である.
- (空でない内部を持つこと): $bold(S)^n = RR^(frac(n(n+1), 2, style: "horizontal"))$ とみなせば,
  $RR_(++)^(frac(n(n+1), 2, style: "horizontal")) subset.eq K$ であり, 従って $K$ は空でない内部を持つ.
- (pointed であること): $X, -X in K$ とする. このとき任意の $z succ.eq 0$ に対して $z^T X z = 0$ となる.
  $X = (x_(i,j))_(i,j)$ と書く. $z$ として第 $i$ 成分のみが $1$ で他の成分が $0$ であるようなベクトルを取ることで
  $
    z^T X z = x_(i,i) = 0
  $
  とわかる.
  更に $z$ として第 $i$ 成分と第 $j$ 成分が $1$ で他の成分が $0$ であるようなベクトル (ただし $i eq.not j$) を取ることで
  $
    z^T X z = x_(i,i) + x_(j,j) + 2 x_(i,j) = 0
  $
  より $x_(i,j) = 0$ とわかる. 従って $X = 0$ であり, $K$ は pointed である.
従って $K$ は proper cone である.

行列の内積を $chevron.l X, Y chevron.r = tr (X^T Y)$ と書く.
トレースの性質より $z^T X z = tr (z z^T X) = chevron.l z z^T, X chevron.r$ であるから
$L = {z z^T mid(|) z in RR^n, thick z succ.eq 0}$ とおくと $L$ は錐であり
$
  K = {X in bold(S)^n mid(|) forall Z in L, thick chevron.l Z, X chevron.r >= 0} = L^*
$
となる ($K$ が閉凸錐であることはこのことからもわかる). 従って
$
  K^* = L^(**) = cl (conv L)
$
である.
実際は下記の補足により $conv L$ は閉であり $cl$ は不要なため
$
  K^* = conv {z z^T mid(|) z in RR^n, thick z succ.eq 0}
$
となる.
$qed$

*補足 ($conv L$ が閉であること)*: 集合 $S$ に対して $RR_+ S = {lambda s mid(|) lambda >= 0, s in S}$ と書くことにする.
$conv L = conv {z z^T mid(|) z in RR^n, thick z succ.eq 0}$ が閉であることは次のようにして確認できる.
集合 $B subset.eq bold(S)^n$ を次のように定義する.
$
  B = {z z^T mid(|) z in RR^n, thick z succ.eq 0, thick norm(z)_2 = 1}
$
このとき $B$ はコンパクトであり, 凸包に関する Carathéodory の定理から $conv B$ もコンパクトである.
更に $norm(z)_2 = 1$ であれば $tr (z z^T) = norm(z)_2^2 = 1$ であることから $X in conv B$ に対して $tr X = 1$ であり,
特に $0 in.not conv B$ である.
よって下記補題より $RR_+ (conv B)$ は閉である.
従って $L = RR_+ B$ であることに注意すれば
$
  conv L = conv (RR_+ B) = RR_+ (conv B)
$
は閉である.

*補題*: $S subset.eq RR^N$ がコンパクトかつ $0 in.not S$ ならば $RR_+ S$ は閉.

*補題の証明*: ${lambda_k s_k}_k thick ({lambda_k}_k subset.eq RR_+, thick {s_k}_k subset.eq S)$ を収束する $RR_+ S$ 内の点列とする.
このとき ${lambda_k}_k$ は有界である. 実際, 非有界であるとすると正の無限大に発散する部分列 ${lambda_(k_l)}_l$ が取れるが,
${lambda_(k_l) s_(k_l)}_l$ が収束することと $S$ が閉であることから
$
  s_(k_l) = frac((lambda_(k_l) s_(k_l)), lambda_(k_l), style: "horizontal") -> 0 in S
$
となり矛盾する.
${lambda_k}_k$ は有界であり, ${s_k}_k$ はコンパクトな $S$ 内の点列であるから,
共通の添字を持った両方の部分列 ${lambda_(k_l)}_l$, ${s_(k_l)}_l$ で両方とも収束するものが取れる.
それらの収束先をそれぞれ $lambda$, $s$ とおけば $lambda >= 0$, $s in S$ であり,
$
  lim_(k -> infinity) lambda_k s_k = lim_(l -> infinity) lambda_(k_l) s_(k_l)
  = lim_(l -> infinity) lambda_(k_l) lim_(l -> infinity) s_(k_l)
  = lambda s in RR_+ S
$
となる. 従って $RR_+ S$ は閉である.

*補足 (応用)*: $K$ は共正値錐, $K^*$ は完全正値錐と呼ばれる.
これらの応用については例えば
#link(
  "https://imi.kyushu-u.ac.jp/~waki/ws2013/index.html",
)[最適化ワークショップ: 拡がっていく最適化]
の
#link(
  "https://imi.kyushu-u.ac.jp/~waki/ws2013/slide/matsukawa.pdf",
)[発表スライド「非負半正定値錐上の最適化問題とその周辺」]
にて概要を知る事ができる.
