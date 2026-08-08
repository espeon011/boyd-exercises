#import "../../lib.typ": ex

== Exercise 2.11 (Hyperbolic sets)

#ex[
  Show that the hyperbolic set ${x in RR_+^2 mid(|) x_1 x_2 >= 1}$ is convex.
  As a generalization, show that ${x in RR_+^n mid(|) product_(i=1)^n x_i >= 1}$ is convex.
  _Hint_. If $a, b >= 0$ and $0 <= theta <= 1$, then
  $a^theta b^(1 - theta) <= theta a + (1 - theta) b$; see $section$3.1.9.
]

*解答*:
$C = {x in RR_+^n mid(|) product_(i=1)^n x_i >= 1}$ とする.
$x, y in C$, $theta in [0, 1]$ とし $z = theta x + (1 - theta) y$ とおく. $z in C$ を示す.
$
  product_(i=1)^n z_i & = product_(i=1)^n (theta x_i + (1 - theta) y_i) \
                      & >= product_(i=1)^n (x_i^theta y_i^(1 - theta)) \
                      & = (product_(i=1)^n x_i)^theta (product_(i=1)^n y_i)^(1 - theta) \
                      & >= 1
$
よって $z in C$ であり, $C$ は凸である. $qed$
