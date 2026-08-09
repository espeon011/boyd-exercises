#import "../../lib.typ": alpha-enum, ex

#let EE = math.op(math.bold("E"))
#let prob = math.op("prob")
#let var = math.op("var")
#let quartile = math.op("quartile")

== Exercise 2.15 (Some sets of probability distributions)

#ex[
  Let $x$ be a real-valued random variable with $prob(x = a_i) = p_i$, $i = 1, dots, n$,
  where $a_1 < a_2 < dots.c < a_n$. Of course $p in RR^n$ lies in the standard
  probability simplex $cal(P) = {p mid(|) bold(1)^T p = 1, p succ.eq 0}$.
  Which of the following conditions are convex in $p$?
  (That is, for which of the following conditions is the set of $p in cal(P)$ that
  satisfy the condition convex?)

  #alpha-enum(
    [
      $alpha <= EE f(x) <= beta$, where $EE f(x)$ is the expected value of $f(x)$,
      i.e., $EE f(x) = sum_(i=1)^n p_i f(a_i)$.
      (The function $f: RR -> RR$ is given.)
    ],
    [$prob(x > alpha) <= beta$.],
    [$EE abs(x^3) <= alpha EE abs(x)$.],
    [$EE x^2 <= alpha$.],
    [$EE x^2 >= alpha$.],
    [$var(x) <= alpha$, where $var(x) = EE(x - EE x)^2$ is the variance of $x$.],
    [$var(x) >= alpha$.],
    [$quartile(x) >= alpha$, where $quartile(x) = inf {beta mid(|) prob(x <= beta) >= 0.25}$.],
    [$quartile(x) <= alpha$.],
  )
]

*解答*: $cal(P)$ 自体が多面体であるため追加条件が線形不等式系であれば凸であることに注意する.
#alpha-enum(
  [
    凸になる.
    $EE f(x) = sum_(i=1)^n p_i f(a_i)$ は $p$ に関する 1 次式であるから ${p in cal(P) mid(|) alpha <= EE f(x) <= beta}$ は線形不等式系の解集合であり, 従って凸である.
  ],
  [
    凸になる.
    実際, 追加条件の式 $prob(x > alpha) <= beta$ は
    $
      prob(x > alpha) = sum_(i = 1, dots, n\ a_i > alpha) p_i
    $
    より線形不等式系である.
  ],
  [
    凸になる.
    実際, 追加条件の式は
    $
      EE abs(x^3) <= alpha EE abs(x) & <=> sum_(i=1)^n abs(a_i^3) p_i <= alpha sum_(i=1)^n abs(a_i) p_i \
                                     & <=> sum_(i=1)^n (abs(a_i^3) - alpha abs(a_i)) p_i <= 0
    $
    より線形不等式である.
  ],
  [
    凸になる.
    実際, 追加条件の式は
    $
      EE x^2 <= alpha <=> sum_(i=1)^n a_i^2 p_i <= alpha
    $
    より線形不等式である.
  ],
  [
    凸になる.
    理由は上記と同様.
  ],
  [
    一般に凸にならない.
    $n=2$, $a_1 = 0$, $a_2 = 1$ とすると $cal(P)$ はベルヌーイ分布の確率ベクトルがなす集合となる.
    このとき $var(x) = p_1 p_2$ である.
    $alpha = 0$ とすると $var(x) <= alpha$ を満たす $p$ は $(1, 0)^T$ と $(0, 1)^T$ のみである.
    例えばその中点である $(frac(1, 2, style: "horizontal"), frac(1, 2, style: "horizontal"))^T$ の分散は $frac(1, 4, style: "horizontal")$ であるため, 条件を満たさない.
  ],
  [
    凸になる.
    $
      var(x) & = EE (x - EE x)^2 \
             & = EE x^2 - (EE x)^2 \
             & = sum_(i=1)^n a_i^2 p_i - (sum_(i=1)^n a_i p_i)^2
    $
    より $A = a a^T in RR^(n times n)$, $b = (-a_1^2, dots, -a_n^2)^T in RR^n$, $c = alpha in RR$ とおけば
    $
      var(x) >= alpha <==> p^T A p + b^T p + c <= 0.
    $
    $A$ は半正定値であることより #link(<ex-2-10>)[演習問題 2.10] から $var(x) >= alpha$ が表す集合は凸である.
  ],
  [
    凸になる.
    取り得る値が有限であることから
    $
      quartile(x) = min {beta mid(|) sum_(i=1,dots,n\ a_i <= beta) p_i >= 0.25}
    $
    であることに注意する.
    $quartile(x) >= alpha$ は
    $
      sum_(i=1,dots,n\ a_i < alpha) p_i < 0.25
    $
    に等しい.
    これは線形不等式である.
  ],
  [
    凸になる.
    上記より $quartile(x) <= alpha$ は
    $
      sum_(i=1,dots,n\ a_i <= alpha) p_i >= 0.25
    $
    に等しい.
    これは線形不等式である. $qed$
  ],
)
