#import "../../lib.typ": ex

== Exercise 2.16

#ex[
  Show that if $S_1$ and $S_2$ are convex sets in $RR^(m+n)$, then so is their partial sum
  $
    S = {(x, y_1 + y_2) mid(|) x in RR^m, y_1, y_2 in RR^n, (x, y_1) in S_1, (x, y_2) in S_2}.
  $
]

*解答*:
$v, w in S$ を取ると $v$, $w$ は次のように書ける:
$
  v = (x^((1)), y_1^((1)) + y_2^((1))), quad w = (x^((2)), y_1^((2)) + y_2^((2)))
$
ここで $x^((i)) in RR^m$, $y_1^((i)), y_2^((i)) in RR^n$ であり,
$(x^((i)), y_1^((i))) in S_1$ かつ $(x^((i)), y_2^((i))) in S_2$ である.
$
  theta v + (1 - theta) w = (theta x^((1)) + (1 - theta) x^((2)), theta y_1^((1)) + (1 - theta) y_1^((2)) + theta y_2^((1)) + (1 - theta) y_2^((2)))
$
が $S$ の元であることを示す.
ここで
$
    x^((3)) & = theta x^((1)) + (1 - theta) x^((2)) \
  y_1^((3)) & = theta y_1^((1)) + (1 - theta) y_1^((2)) \
  y_2^((3)) & = theta y_2^((1)) + (1 - theta) y_2^((2))
$
とおくと $theta v + (1 - theta) w = (x^((3)), y_1^((3)) + y_2^((3)))$ であり,
$S_1$ と $S_2$ の凸性より $(x^((3)), y_1^((3))) in S_1$ かつ $(x^((3)), y_2^((3))) in S_2$ であり,
従って $theta v + (1 - theta) w in S$ である. ゆえに $S$ は凸である. $qed$
