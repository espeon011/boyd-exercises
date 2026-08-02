#import "../../lib.typ": alpha-enum, ex

#let dist = math.op("dist")

== Exercise 2.5

#ex[
  What is the distance between two parallel hyperplanes ${x in RR^n mid(|) a^T x = b_1}$ and ${x in RR^n mid(|) a^T x = b_2}$?
]

*解答*: 1 つ目の集合を $S_1$, 2 つ目の集合を $S_2$ とする.
これらの距離とは
$
  dist (S_1, S_2) = inf {norm(u - v)_2 mid(|) u in S_1, v in S_2}
$
で定義される.
点と超平面の距離の公式 (ラグランジュの未定乗数法を用いて求める) より
$
  dist (S_1, S_2) & = inf {norm(u - v)_2 mid(|) u in S_1, v in S_2} \
                  & = inf_(u in S_1) inf_(v in S_2) norm(u - v)_2 \
                  & = inf_(u in S_1) abs(a^T u -b_2) / norm(a) \
                  & = abs(b_1 -b_2) / norm(a)
$
となる. $qed$
