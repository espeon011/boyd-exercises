#import "../../lib.typ": ex

== Exercise 2.23

#ex[
  Give an example of two closed convex sets that are disjoint but cannot be
  strictly separated.
]

*解答*:
$C = {(x, y) in RR^2 mid(|) y >= e^x}$, $D = {(x, y) in RR^2 mid(|) y <= 0}$ とおくと $C$ と $D$ は凸であり, $C inter D = nothing$ である.
#link(<ex-2-6>)[演習問題 2.6] より $C$ と $D$ を分離する直線があるとすればそれは $y = c$ という形でなければならない.
このとき $c >= 0$ であり, $C$ 上 $y >= c$ であることから $c <= 0$ より $c = 0$ とわかる.
従って $C$ と $D$ を分離する直線は ${(x, y) in RR^2 mid(|) y = 0}$ のみであるが,
これは強分離ではない. $qed$
