#import "../../lib.typ": alpha-enum, ex

#let conv = math.op("conv")

== Exercise 2.4 <ex-2-4>

#ex[
  Show that the convex hull of a set $S$ is the intersection of all convex sets that contain $S$.
  (The same method can be used to show that the conic, or affine, or linear hull of a set $S$ is the intersection of all conic sets, or affine sets, or subspaces that contain $S$.)
]

*解答*: $C_1 = conv S$ とし, $C_2$ を $S$ を含む全ての凸集合の共通部分とする. \
($C_1 subset C_2$) $x_1, dots, x_k$ を $S$ 内の任意の $k$ 点, $theta_1, dots, theta_k$ は $theta_i >= 0$, $theta_1 + dots + theta_k = 1$ を満たす任意の実数とする.
$S$ を含む任意の凸集合 $C$ について $theta_1 x_1 + dots + theta_k x_k in C$ であるから $theta_1 x_1 + dots + theta_k x_k in C_2$ であり,
従って $C_1 subset C_2$ である. \
($C_1 supset C_2$) $C_1 = conv S$ は $S$ を含む凸集合であるため, $C_2$ の定義における "$S$ を含む全ての凸集合" に属する.
従って $C_1 supset C_2$ である. $qed$
