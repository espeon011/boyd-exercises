#import "@preview/theorion:0.6.0": *
#import cosmos.rainbow: *
#show: show-theorion

#import "@preview/cetz:0.5.2"

#let conv = math.op("conv")
#let dist = math.op("dist")

// (a), (b), (c), ... で番号づけする enum 関数
#let alpha-enum(..items, start: 1) = context {
  if target() == "html" {
    html.elem(
      "ol",
      attrs: (style: "list-style: none; padding: 0; margin: 0.5em 0 0.5em 1.5em;"),
      items
        .pos()
        .enumerate()
        .map(((i, body)) => html.elem(
          "li",
          attrs: (style: "display: flex; align-items: baseline; margin: 0.4em 0; padding: 0;"),
          {
            html.elem(
              "span",
              attrs: (style: "flex: none; margin: 0 0.5em 0 0; padding: 0;"),
              numbering("(a)", i + start),
            )
            html.elem("div", attrs: (style: "margin: 0; padding: 0; min-width: 0;"), body)
          },
        ))
        .join(),
    )
  } else {
    enum(numbering: "(a)", start: start, ..items)
  }
}

#title[Chapter 2: Convex sets]

= Definition of convexity

#exercise(full-title: [Exercise 2.1])[
  Let $C subset RR^n$ be a convex set, with $x_1, dots, x_k in C$, and $theta_1, dots, theta_k in RR$ satisfy $theta_i >= 0$, $theta_1 + dots + theta_k = 1$.
  Show that $theta_1 x_1 + dots + theta_k x_k in C$. (The definition of convexity is that this holds for $k = 2$; you must show it for arbitrary $k$. ) _Hint_. Use induction on $k$.
]

*_Proof_*:
$k$ に関する帰納法で示す.
$k = 2$ のとき定義から明らか.
$k = ell$ のとき成り立つとして $k = ell + 1$ のとき成立することを示す.
$theta_(ell + 1) = 1$ の場合 $theta_1 x_1 + dots + theta_(ell + 1) x_(ell + 1) = x_(ell + 1) in C$ となるため $theta_(ell + 1) < 1$ であるとする.
このとき $theta_1 + dots + theta_ell = 1 - theta_(ell + 1)$ であることから
$
  y := theta_1 / (1 - theta_(ell + 1)) x_1 + dots + theta_ell / (1 - theta_(ell + 1)) x_ell in C
$
が成り立ち, 凸集合の定義から $(1 - theta_(ell + 1)) y + theta_(ell + 1) x_(ell + 1) in C$ が成り立ち,
従って $theta_1 x_1 + dots + theta_(ell + 1) x_(ell + 1) in C$ が成り立つ. $qed$

#exercise(full-title: [Exercise 2.2])[
  Show that a set is convex if and only if its intersection with any line is convex.
  Show that a set is affine if and only if its intersection with any line is affine.
]

*_Proof_*:
(convex, $arrow.r.double$) 凸集合同士の共通部分は凸であるため任意の直線との共通部分は凸. \
(convex, $arrow.l.double$) $C$ を $RR^n$ の部分集合とし, 任意の直線との共通部分が凸であるとする.
任意の $x_1, x_2 in C$ に対し, $x_1$ と $x_2$ を結ぶ直線を $L$ とすれば $L inter C$ は仮定より凸である.
$x_1, x_2 in L inter C$ より任意の $theta in [0, 1]$ に対し
$
  theta x_1 + (1 - theta) x_2 in L inter C subset C
$
であり, 従って $C$ は凸である. \
(affine, $arrow.r.double$) $C subset RR^n$ を affine 集合とし, $L subset RR^n$ を任意の直線とする.
$L inter C$ が空集合か 1 点集合である場合, それは明らかに affine である.
$L inter C$ が 2 つ以上の要素を持つとし, それを $x_1, x_2$ とおく.
$L$ は $x_1, x_2$ を通る直線であり, $C$ が affine であることの定義から $C$ 内の異なる 2 点を通る直線は $C$ に含まれるため $L inter C = L$ である.
$L$ は直線であるから affine である. \
(affine, $arrow.l.double$) $C$ を $RR^n$ の部分集合とする.
$x_1, x_2$ を $C$ 内の任意の異なる 2 点とし, $x_1, x_2$ を通る直線を $L$ とする.
仮定より $C inter L$ は affine であり, 従って $C inter L$ 内の異なる 2 点を通る直線は必ず $C inter L$ に含まれる.
従って $L subset C$ であり $C$ 自身も affine である. $qed$

#exercise(full-title: [Exercise 2.3 (Midpoint convexity)])[
  A set $C$ is *_midpoint convex_* if whenever two points $a, b$ are in $C$,
  the average or midpoint $frac((a + b), 2, style: "horizontal")$ is in $C$.
  Obviously a convex set is midpoint convex.
  It can be proved that under mild conditions midpoint convexity implies convexity.
  As a simple case prove that if $C$ is closed and midpoint convex, then $C$ is convex.
]

*_Proof_*: $C subset RR^n$ を midpoint convex set とし, 閉集合であるとする.
$x_1, x_2$ を $C$ 内の任意の異なる 2 点とする.
このとき任意の実数 $theta in [0, 1]$ に対して $theta x_1 + (1 - theta) x_2 in C$ を示せばよい. \
$f: [0, 1] -> RR^n$ を $f(t) = (1 - t) x_1 + t x_2$ と定義する.
$theta_"l"^((0)) = 0$, $theta_"r"^((0)) = 1$ とおくと $f(theta_"l"^((0))) = x_1 in C$, $f(theta_"r"^((0))) = x_2 in C$ である.
$C$ は midpoint convex であるから $f$ の定義より
$
  f(frac((theta_"l"^((0)) + theta_"r"^((0))), 2, style: "horizontal")) = frac(( f(theta_"l"^((0))) + f(theta_"r"^((0))) ), 2, style: "horizontal") = frac(( x_1 + x_2 ), 2, style: "horizontal") in C
$
である.
$theta_"l"^((1))$, $theta_"r"^((1))$ を次のように定める.
$
  theta <= (theta_"l"^((0)) + theta_"r"^((0))) / 2 => cases(
    theta_"l"^((1)) = theta_"l"^((0)),
    theta_"r"^((1)) = (theta_"l"^((0)) + theta_"r"^((0))) / 2,
  ) \
  theta > (theta_"l"^((0)) + theta_"r"^((0))) / 2 => cases(
    theta_"l"^((1)) = (theta_"l"^((0)) + theta_"r"^((0))) / 2,
    theta_"r"^((1)) = theta_"r"^((0)),
  )
$
このとき $f(theta_"l"^((1))) in C$ かつ $f(theta_"r"^((1))) in C$ である.
任意の $k in NN$ に対しても同様に $theta_"l"^((k)), theta_"r"^((k))$ から $theta_"l"^((k + 1)), theta_"r"^((k + 1))$ を定めると任意の $k$ に対して $f(theta_"l"^((k))) in C$ かつ $f(theta_"r"^((k))) in C$ であり, 次のようになる.
$
  theta_"l"^((0)) <= theta_"l"^((1)) <= dots <= theta_"l"^((k)) <= dots <= theta <= dots <= theta_"r"^((k)) <= dots <= theta_"r"^((1)) <= theta_"r"^((0))
$
更に点列 ${theta_"l"^((k))}_(k=1)^infinity$, ${theta_"r"^((k))}_(k=1)^infinity$ は共に $theta$ に収束する.
$f$ が連続である事から $lim_(k -> infinity) f(theta_"l"^((k))) = f(theta)$ であり,
$C$ が閉集合であることから $f(theta) in C$ である.
従って $C$ は凸集合である. $qed$

#exercise(full-title: [Exercise 2.4])[
  Show that the convex hull of a set $S$ is the intersection of all convex sets that contain $S$.
  (The same method can be used to show that the conic, or affine, or linear hull of a set $S$ is the intersection of all conic sets, or affine sets, or subspaces that contain $S$.)
]

*_Proof_*: $C_1 = conv S$ とし, $C_2$ を $S$ を含む全ての凸集合の共通部分とする. \
($C_1 subset C_2$) $x_1, dots, x_k$ を $S$ 内の任意の $k$ 点, $theta_1, dots, theta_k$ は $theta_i >= 0$, $theta_1 + dots + theta_k = 1$ を満たす任意の実数とする.
$S$ を含む任意の凸集合 $C$ について $theta_1 x_1 + dots + theta_k x_k in C$ であるから $theta_1 x_1 + dots + theta_k x_k in C_2$ であり,
従って $C_1 subset C_2$ である. \
($C_1 supset C_2$) $C_1 = conv S$ は $S$ を含む凸集合であるため, $C_2$ の定義における "$S$ を含む全ての凸集合" に属する.
従って $C_1 supset C_2$ である. $qed$

= Examples

#exercise(full-title: [Exercise 2.5])[
  What is the distance between two parallel hyperplanes ${x in RR^n mid(|) a^T x = b_1}$ and ${x in RR^n mid(|) a^T x = b_2}$?
]

*_Proof_*: 1 つ目の集合を $S_1$, 2 つ目の集合を $S_2$ とする.
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

#exercise(full-title: [Exercise 2.6])[
  _When does one halfspace contain another?_ Give conditions under which
  $
    {x mid(|) a^T x <= b} subset.eq {x mid(|) hat(a)^T x <= hat(b)}
  $
  (where $a eq.not 0$, $hat(a) eq.not 0$).
  Also find the conditions under which the two halfspaces are equal.
]

*_Proof_*: $S_1 = {x mid(|) a^T x <= b}$, $S_2 = {x mid(|) hat(a)^T x <= hat(b)}$ とおき,
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

#exercise(full-title: [Exercise 2.7 (Voronoi description of halfspace)])[
  Let $a$ and $b$ be distinct points in $RR^n$.
  Show that the set of all points that are closer (in Euclidean norm) to $a$ than $b$,
  i.e., ${x mid(|) norm(x - a)_2 <= norm(x - b)_2}$ is a half space.
  Describe it explicitly as an inequality of the form $c^T x <= d$. Draw a picture.
]

*_Proof_*: 条件式を同値変形していくと次のようになる.
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

#exercise(full-title: [Exercise 2.8])[
  Which of the following sets $S$ are polyhedra?
  If possible, express $S$ in the form $S = { x mid(|) A x prec.eq b, F x = g}$.

  #alpha-enum(
    [$S = {y_1 a_1 + y_2 a_2 mid(|) -1 <= y_1 <= 1, -1 <= y_2 <= 1}$, where $a_1, a_2 in RR^n$ ],
    [$S = {x in RR^n mid(|) x succ.eq 0, bold(1)^T x = 1, sum_(i=1)^n x_i a_i = b_1, sum_(i=1)^n x_i a_i^2 = b_2}$, where $a_1, dots, a_n in RR$ and $b_1, b_2 in RR$. ],
    [$S = { x in RR^n mid(|) x succ.eq 0, x^T y <= 1, "for all" y "with" norm(y)_2 = 1}$ ],
    [$S = { x in RR^n mid(|) x succ.eq 0, x^T y <= 1, "for all" y "with" sum_(i=1)^n abs(y_i) = 1}$],
  )
]

*_Proof_*: (a), (b), (d) が多面体であり, (c) だけが多面体でない.
#alpha-enum(
  [
    $a_1$ と $a_2$ が線形独立の場合のみ示す. 他の場合は省略.
    このとき $B := (a_1, a_2) in RR^(n times 2)$ はランク 2 のため一般化逆行列 $B^+ = (B^T B)^(-1) B^T in RR^(2 times n)$ が定まり $B^+ B = I_2$ となる.
    S を表す等式制約として $x$ が $a_1$, $a_2$ が張る空間に属するということを直交射影を用いて表す.
    すなわち $B B^+ x = x$. これは $F = B B^+ - I$, $g = bold(0)$ と対応する.
    不等式制約として $x$ が $y_1 a_1 + y_2 a_2$ がなす平行四辺形に入ることを表す.
    $B^+ B = I_2$ であることから $B^+$ の各行ベクトル $c_1^T$, $c_2^T$ は $c_i^T a_j = delta_(i j)$ を満たす.
    この $c_i^T$ を用いて $y_i$ の範囲を制限すれば良い. つまり $A = (c_1, c_2, -c_1, -c_2)^T$, $b = bold(1)_4$ とすればよい.
  ],
  [
    $alpha_1 = (a_1, dots, a_n)^T in RR^n$ とし, $alpha_2 = (a_1^2, dots, a_n^2)^T in RR^n$ とする.
    $A = -I_n$, $b = bold(0)$, $F = (bold(1)_n, alpha_1, alpha_2)^T$, $g = (1, b_1, b_2)^T$ とすればよい.
  ],
  [
    この $S$ は単位球体 $B(0, 1)$ の全ての成分が非負の部分に等しい.
    これは $x in B(0, 1)$ と $x^T y <= 1, "for all" y "with" norm(y)_2 = 1$ が同値であることによる.
    実際, $x in B(0, 1)$ とすると任意の単位球面上のベクトル $y$ に対して $x^T y <= norm(x)_2 dot norm(y)_2 <= 1$ であるし,
    $x in.not B(0, 1)$ とすると $y = frac(x, norm(x), style: "horizontal")$ に対して $x^T y = norm(x) > 1$ となる.
    従って $S = {x in B(0, 1) mid(|) x succ.eq 0}$ となる. この集合は多面体ではない (証明略).
  ],
  [
    $max_(norm(y)_1 = 1) x^T y = norm(x)_infinity$ である (ヘルダーの不等式の特別な場合).
    実際, $x^T y$ を最大化するには絶対値が最も大きい $x$ の成分 $x_i$ の符号に応じて $y_i = 1 "if" x_i > 0 "else" y_i = -1$ とすればよい ($y$ の $i$ 成分以外は全て $0$).
    つまり $S = {x in RR^n mid(|) x succ.eq bold(0), norm(x)_infinity <= 1}$ と書ける.
    $A = (I_n, -I_n)^T$, $b = (bold(1)_n^T, bold(0)_n^T)^T$ とおけば
    $
      S & = {x in RR^n mid(|) x succ.eq bold(0), norm(x)_infinity <= 1} \
        & = {x in RR^n mid(|) bold(0) prec.eq x prec.eq bold(1)} \
        & = {x in RR^n mid(|) A x prec.eq b}
    $
    と書ける. $qed$
  ],
)

WIP

= Operations that preserve convexity

= Separation theorems and supporting hyperplanes

= Convex cones and generalized inequalities
