#import "../../lib.typ": alpha-enum, ex
#import "@preview/cetz:0.5.2"

== Exercise 2.7 (Voronoi description of halfspace)

#ex[
  Let $a$ and $b$ be distinct points in $RR^n$.
  Show that the set of all points that are closer (in Euclidean norm) to $a$ than $b$,
  i.e., ${x mid(|) norm(x - a)_2 <= norm(x - b)_2}$ is a half space.
  Describe it explicitly as an inequality of the form $c^T x <= d$. Draw a picture.
]

*解答*: 条件式を同値変形していくと次のようになる.
$
                        norm(x - a)_2 & <= norm(x - b)_2 \
                      norm(x - a)_2^2 & <= norm(x - b)_2^2 \
                    (x - a)^T (x - a) & <= (x - b)^T (x - b) \
  norm(x)_2^2 - 2 a^T x + norm(a)_2^2 & <= norm(x)_2^2 - 2 b^T x + norm(b)_2^2 \
                          (b - a)^T x & <= (norm(b)_2^2 - norm(a)_2^2) / 2
$
従って $c = b - a$, $d = frac((norm(b)_2^2 - norm(a)_2^2), 2, style: "horizontal")$ とすれば ${x mid(|) norm(x - a)_2 <= norm(x - b)_2} = {x mid(|) c^T x <= d}$ である. \
図示すると次のようになる. ここで $m = frac((a + b), 2, style: "horizontal")$ である. $qed$
#let halfspace-figure = cetz.canvas(length: 1cm, {
  import cetz.draw: *
  let (xmin, xmax) = (-3.5, 3.5)
  let (ymin, ymax) = (-3.5, 3.5)
  line(
    (xmin, ymin),
    (xmax, ymin),
    (xmax, 1 - xmax),
    (1 - ymax, ymax),
    (xmin, ymax),
    close: true,
    fill: rgb(100, 149, 237, 60),
    stroke: none,
  )
  line(
    (xmax, 1 - xmax),
    (1 - ymax, ymax),
    stroke: (paint: rgb(65, 105, 225), thickness: 1.2pt),
  )
  content((1.6, -2.8), text(fill: rgb(65, 105, 225))[$norm(x - a) <= norm(x - b)$])
  line((-1, -1), (2, 2), stroke: (paint: rgb(34, 139, 34), thickness: 1.4pt), name: "seg1")
  let point(pos, label, anchor: "south-west", color: black) = {
    circle(pos, radius: 0.07, fill: color, stroke: none)
    content(pos, anchor: anchor, padding: 3pt, text(fill: color, label))
  }
  point((-1, -1), $a$, anchor: "south", color: rgb(34, 139, 34))
  point((2, 2), $b$, anchor: "west", color: rgb(34, 139, 34))
  point((0.5, 0.5), $m$, anchor: "east", color: rgb(220, 20, 60))
})
#figure(
  context if target() == "html" {
    html.frame(halfspace-figure)
  } else {
    halfspace-figure
  },
)
