#import "../../lib.typ": alpha-enum, ex

#let rank = math.op("rank")

== Exercise 2.13 (Conic hull of outer products)

#ex[
  Consider the set of rank-$k$ outer products, defined as ${ X X^T mid(|) X in RR^(n times k), rank X = k }$.
  Describe its conic hull in simple terms.
]

*解答*:
${0} union {A in bold(S)_+^n mid(|) rank A >= k}$ に等しい.

まず問題文中の集合の conic hull は ${0} union {A in bold(S)_+^n mid(|) rank A >= k}$ に含まれることを示す.
明らかに conic hull によって生成される行列は対称かつ半正定値である.
また,
- 実行列 $A$ と $theta > 0$ に対して $im (theta A) = im A$. 従って $rank (theta A) = rank(A)$.
- 実行列 $A$ に対して $rank A = rank A A^T$.
- 半正定値対称行列 $A$, $B$ に対して $im (A + B) = im A + im B$. 従って $rank (A + B) >= max(rank A, rank B)$.
より $theta_i >= 0$, $X_i in RR^(n times k)$ ($rank X_i = k$) に対して $sum_i theta_i X_i X_i^T$ は
$
  exists i', thick theta_(i') > 0 & ==> rank (sum_i theta_i X_i X_i^T) >= rank (X_(i') X_(i')^T) = k \
      forall i, thick theta_i = 0 & ==> sum_i theta_i X_i X_i^T = 0
$
を満たす.
よって問題文中の集合の conic hull は ${0} union {A in bold(S)_+^n mid(|) rank A >= k}$ に含まれる.

逆に $A in {0} union {A in bold(S)_+^n mid(|) rank A >= k}$ としたとき, $A$ は問題文中の集合の元の錐結合で表せることを示す.
$A = 0$ のときは自明なので $A eq.not 0$ とする. このとき $r := rank A >= k$ である.
$A$ は半正定値対称行列であるため直交する長さ 1 の固有ベクトルたちを使って次のように分解できる:
$
  A = sum_(i=1)^r lambda_i q_i q_i^T
$
ただし $lambda_1 >= dots >= lambda_r > 0$ は $A$ の固有値とし, $q_i$ は $lambda_i$ に対する固有ベクトルで, 長さが $1$ で互いに直交するものである.
ここで $m = r - k + 1$ とおく. $m >= 1$ である. $j = 1, dots, m$ に対して $M_j$ を次のように定める:
$
  M_j = 1 / m sum_(i=1)^(k-1) lambda_i q_i q_i^T + lambda_(k-1+j) q_(k-1+j) q_(k-1+j)^T
$
このとき $A = sum_(j=1)^m M_j$ が成り立つ.
$X_j in RR^(n times k)$ を次のように定める.
$
  X_j = mat(sqrt(lambda_1 / m) q_1, dots, sqrt(lambda_(k-1) / m) q_(k-1), sqrt(lambda_(k-1+j)) q_(k-1+j))
$
すると $rank X_j = k$ かつ $M_j = X_j X_j^T$ となり, $A = sum_(j=1)^m X_j X_j^T$ が成り立つ.
従って ${0} union {A in bold(S)_+^n mid(|) rank A >= k}$ の元は問題文中の集合の錐結合で表せる. $qed$
