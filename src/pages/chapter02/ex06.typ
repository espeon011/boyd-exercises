#import "../../lib.typ": alpha-enum, ex

== Exercise 2.6 <ex-2-6>

#ex[
  _When does one halfspace contain another?_ Give conditions under which
  $
    {x mid(|) a^T x <= b} subset.eq {x mid(|) hat(a)^T x <= hat(b)}
  $
  (where $a eq.not 0$, $hat(a) eq.not 0$).
  Also find the conditions under which the two halfspaces are equal.
]

*解答*: $S_1 = {x mid(|) a^T x <= b}$, $S_2 = {x mid(|) hat(a)^T x <= hat(b)}$ とおき,
$H_1 = {x mid(|) a^T x = 0}$, $H_2 = {x mid(|) hat(a)^T x = 0}$ とおく.
$S_1 subset.eq S_2$ であるためには $hat(a)$ が $a$ の正の定数倍かつ $frac(b, norm(a), style: "horizontal") <= frac(hat(b), norm(hat(a)), style: "horizontal")$ でなければならないことを示す.
まず, $H_1 subset.eq H_2$ であることを示す.
背理法のため $v in H_1$ が $v in.not H_2$ を満たすと仮定する.
必要なら負の定数倍をすることで $hat(a)^T v > 0$ としてよい.
このとき任意の $x_0 in S_1$ と任意の実数 $t$ に対して $x_0 + t v in S_1$ であるが,
十分大きい $t$ に対して $x_0 + t v in.not S_2$ となる.
従って $H_1 subset.eq H_2$ とわかる.
更に $H_1$ と $H_2$ の次元は等しいため $H_1 = H_2$ である.
超平面に対する直交補空間は 1 次元であるため, $a$ と $hat(a)$ は定数倍で互いに移り合う.
次はその定数が正であることを示す.
背理法のため $hat(a) = s a$ ($s < 0$) と仮定する.
このとき $a^T v < 0$ なる $v$ をとると $hat(a)^T v = s a^T v > 0$ である.
任意の $x_0 in S_1$ と十分大きい正の実数 $t$ に対して $x_0 + t v in S_1$ であるが $x_0 + t v in.not S_2$ である.
従って $hat(a)$ は $a$ の正の定数倍である.
最後に, $alpha = frac(a, norm(a), style: "horizontal") (= frac(hat(a), norm(hat(a)), style: "horizontal"))$ とおくと,
$
  S_1 = {x mid(|) alpha^T x <= b / norm(a)}, quad S_2 = {x mid(|) alpha^T x <= hat(b) / norm(hat(a))}
$
と書け, $S_1 subset.eq S_2$ であるためには $frac(b, norm(a), style: "horizontal") <= frac(hat(b), norm(hat(a)), style: "horizontal")$ であることが必要だとわかる. \
逆に $hat(a)$ が $a$ の正の定数倍かつ $frac(b, norm(a), style: "horizontal") <= frac(hat(b), norm(hat(a)), style: "horizontal")$ であるならば上記の $S_1$, $S_2$ の表現から $S_1 subset.eq S_2$ である. \
2 つの半空間が等しくなるのは $a$ と $hat(a)$ が互いに正の定数倍で移り合い,
$frac(b, norm(a), style: "horizontal") = frac(hat(b), norm(hat(a)), style: "horizontal")$ のときである. $qed$
