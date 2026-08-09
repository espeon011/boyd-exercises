#import "../../lib.typ": alpha-enum, ex

#let dist = math.op("dist")
#let cl = math.op("cl")

== Exercise 2.14 (Expanded and restricted sets)

#ex[
  Let $S subset.eq RR^n$, and let $norm(dot.c)$ be a norm on $RR^n$.

  #alpha-enum(
    [
      For $a >= 0$ we define $S_a$ as ${ x mid(|) dist(x, S) <= a }$,
      where $dist(x, S) = inf_(y in S) norm(x - y)$.
      We refer to $S_a$ as $S$ _expanded_ or _extended_ by $a$.
      Show that if $S$ is convex, then $S_a$ is convex.
    ],
    [
      For $a >= 0$ we define $S_(-a) = { x mid(|) B(x, a) subset.eq S }$,
      where $B(x, a)$ is the ball (in the norm $norm(dot.c)$), centered at $x$,
      with radius $a$. We refer to $S_(-a)$ as $S$ _shrunk_ or _restricted_ by $a$,
      since $S_(-a)$ consists of all points that are at least a distance $a$ from
      $RR^n without S$. Show that if $S$ is convex, then $S_(-a)$ is convex.
    ],
  )
]

*解答*: $S = nothing$ の場合, $S_a$ も $S_(-a)$ も $nothing$ となる. 以下 $S eq.not nothing$ とする.
#alpha-enum(
  [
    $v, w in S_a$ とし, $theta in [0, 1]$ とする.
    $z = theta v + (1 - theta) w$ が $S_a$ に属することを示す.
    $epsilon > 0$ を任意にとる. 下限の定義から
    $
      norm(v - y_v) <= dist(v, S) + epsilon, quad
      norm(w - y_w) <= dist(w, S) + epsilon
    $
    を満たす $y_v, y_w in S$ が存在する.
    $S$ は凸であるから $theta y_v + (1 - theta) y_w in S$ であり,
    $
      dist(z, S) & <= norm(z - (theta y_v + (1 - theta) y_w)) \
                 & = norm(theta (v - y_v) + (1 - theta) (w - y_w)) \
                 & <= theta norm(v - y_v) + (1 - theta) norm(w - y_w) \
                 & <= theta dist(v, S) + theta epsilon + (1 - theta) dist(w, S) + (1 - theta) epsilon \
                 & <= a + epsilon
    $
    が成り立つ. $epsilon > 0$ は任意であったから $dist(z, S) <= a$,
    すなわち $z in S_a$ である. よって $S_a$ は凸である.
  ],
  [
    $v, w in S_(-a)$ とし, $theta in [0, 1]$ とする.
    $z = theta v + (1 - theta) w$ が $S_(-a)$ に属することを示す.
    任意の $y in B(z, a)$ に対して $norm(y + (v - z) - v) = norm(y - z) <= a$ であるから $y + (v - z) in B(v, a)$ である.
    同様に $y + (w - z) in B(w, a)$ である.
    $B(v, a) subset.eq S$ かつ $B(w, a) subset.eq S$ より $y + (v - z) in S$, $y + (w - z) in S$ である.
    $S$ が凸であることと
    $
      theta (y + (v - z)) + (1 - theta) (y + (w - z)) = y + theta v + (1 - theta) w - z = y
    $
    より $y in S$ である.
    従って $B(z, a) subset.eq S$ となり, $z in S_(-a)$ である.
    ゆえに $S_(-a)$ は凸である. $qed$
  ],
)
