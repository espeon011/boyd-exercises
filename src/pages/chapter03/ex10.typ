#import "../../lib.typ": alpha-enum, ex

#let EE = math.op(math.bold("E"))
#let var = math.op("var")

== Exercise 3.10 (An extension of Jensen's inequality)

#ex[
  One interpretation of Jensen's inequality is that randomization or dithering hurts, i.e., raises the average value of a convex function: For $f$ convex and $v$ a zero mean random variable, we have
  $
    EE f(x_0 + v) >= f(x_0).
  $
  This leads to the following conjecture. If $f$ is convex, then the larger the variance of $v$, the larger $EE f(x_0 + v)$.

  #alpha-enum[
    Give a counterexample that shows that this conjecture is false. Find zero mean random variables $v$ and $w$, with $var(v) > var(w)$, a convex function $f$, and a point $x_0$, such that $EE f(x_0 + v) < EE f(x_0 + w)$.
  ][
    The conjecture is true when $v$ and $w$ are scaled versions of each other. Show that $EE f(x_0 + t v)$ is monotone increasing in $t >= 0$, when $f$ is convex and $v$ is zero mean.
  ]
]

*解答*: #alpha-enum[
  確率変数 $v$, $w$ を次の密度関数を持つように定める:
  $ p_v (x) = cases(
    frac(1, 2, style: "horizontal") thick & "if" 1 <= abs(x) <= 2,
    0 thick & "other"
  ), quad
  p_w (x) = cases(
    frac(1, (2 sqrt(6)), style: "horizontal") thick & "if" abs(x) <= sqrt(6),
    0 thick & "other"
  ). $
  両方とも密度関数が偶関数であることから平均は 0 であり, 分散は v の方が大きい:
  $ EE v = EE w = 0 \
  var(v) = 7/3, quad var(w) = 2. $
  関数 $f$ を $f(x) = x^4$ と定めると $f$ は凸関数である.
  期待値はそれぞれ
  $ EE f(v) = 2 integral_1^2 1/2 x^4 d x
  = [1/5 x^5]_1^2
  = 31 / 5 \
  EE f(w) = 2 integral_0^sqrt(6) 1 / (2 sqrt(6)) x^4 d x
  = 1 / sqrt(6) [1/5 x^5]_0^sqrt(6)
  = 36 / 5 $
  と計算できる.
  よって $EE f(v) < EE f(w)$ であり, 最初に確認した $var (v) > var(w)$ と合わせて予想の反例とする (ここで $x_0 = 0$ とした).
][
  $v$ を平均が $0$ である確率変数とし, $EE f(x_0 + t v)$ を $g(t)$ と書くことにすると $f(x_0 + t y)$ が $y$ について凸であることから §3.2.1 より $g(t)$ は凸関数である.
  また, §3.1.8 より
  $ g(0) = EE f(x_0) = f(x_0) = f (EE [x_0 + t v]) <= EE f(x_0 + t v) = g(t) $
  となり, $t = 0$ のとき $g$ は最小値を取る.
  $0 <= s < t$ とする.
  このとき $s = (frac((t - s), t, style: "horizontal")) 0 + (frac(s, t, style: "horizontal")) t$ であることと $EE v = 0$ から
  $ g(s) = g((t-s)/t dot.c 0 + s/t dot.c t) <= (t-s)/t g(0) + s/t g(t) <= (t-s)/t g(t) + s/t g(t) = g(t) $
  を得る. 従って $g(t) = EE f(x_0 + t v)$ は $t$ について単調増加である. $qed$
]
