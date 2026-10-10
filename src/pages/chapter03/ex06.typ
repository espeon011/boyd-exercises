#import "../../lib.typ": ex

#let dom = math.op("dom")
#let epi = math.op("epi")

== Exercise 3.6 (Functions and epigraphs) <ex-3-6>

#ex[
  When is the epigraph of a function a halfspace?
  When is the epigraph of a function a convex cone?
  When is the epigraph of a function a polyhedron?
]

*解答*: エピグラフが半空間になるのは $f$ が $RR^n$ 全域で定義された affine 関数のときのみ.
エピグラフが半空間になるとする.
このときあるベクトル $a in RR^(n+1) without {bold(0)}$ と $b in RR$ が存在して $x in dom f$ と $t in RR$ について
$
  f(x) <= t <==> a^T vec(x, t) <= b
$
となる.
このとき $a$ の $n+1$ 成分は $0$ にはなり得ない.
仮に $a$ の $n+1$ 成分が $0$ であれば $f(x) <= t$ の真偽は $t$ に依らないことになるが,
$f(x) in RR$ よりそれは起こりえない.
また, この内積は $t$ について連続であるから
$
  forall x in dom f, thick a^T vec(x, f(x)) = b
$
である.
このとき $f$ のグラフは $a$ を法線ベクトルとする超平面 ${v in RR^(n+1) mid(|) a^T v = b}$ に含まれる.
$a$ の $n+1$ 成分は非零であるからこの超平面は affine 関数のグラフとなり, $dom f = RR^n$ であればそのエピグラフは半空間を定める.
また, $a_(n+1) eq.not 0$ であることからこの半空間は $forall x in RR^n$ に対して $(x, t)$ という形の元を要素に持つ.
従って $dom f$ は $RR^n$ でなければならない.
逆に $f$ が $RR^n$ 全域で定義された affine 関数であれば明らかにそのエピグラフは半空間を定める.

エピグラフが凸錐になるのは
- $dom f$ が凸錐
- $f$ が凸関数
- $x in dom f$, $s >= 0$ に対して $f(s x) = s f(x)$
のときのみ.
エピグラフが凸錐になるとする.
$epi f$ が凸集合になることと $f$ が凸であることは同値であるため $f$ は凸である.
また, $n+1$ 成分を削る射影 $RR^(n+1) ->> RR^n$ による $epi f$ の像が $dom f$ であることと凸錐の射影による像は凸錐であることから $dom f$ は凸錐である.
$a in dom f$ とする. このとき $RR_+ a subset.eq dom f$ であり,
任意の $s_1, s_2 in RR_(++)$ に対して $(s_1 s_2 a, s_1 f(s_2 a)) in epi f$ であるから $f(s_1 s_2 a) <= s_1 f(s_2 a)$ であるが,
$s_2 = 1$ とおくことで $f(s_1 a) <= s_1 f(a)$ を得,
$s_1 = frac(1, s_2, style: "horizontal")$ とおくことで $s_2 f(a) <= f(s_2 a)$ を得る.
従って $s > 0$ に対して $f(s a) = s f(a)$ となり $RR_(++) a$ 上 $f$ は線形である.
また, $bold(0) in epi f$ より $f(bold(0)) <= 0$ であるが,
$f(bold(0)) < 0$ とすると $epi f$ が錐であることより任意の $c < 0$ に対して $(bold(0), c) in epi f$ となり $f(bold(0)) in RR$ に矛盾する.
従って $f(bold(0)) = 0$ とわかり, $f$ を原点を端点とする半直線に制限すると線形形式となる.
逆にこのような関数のエピグラフは凸錐になる.

エピグラフが多面体になるのは
- $dom f$ が多面体
- $f$ が有限個の affine 関数の $max$
のときのみ.
エピグラフが多面体になるとする.
即ち ${c_i}_(i=1)^m subset.eq RR^n$ と ${d_i}_(i=1)^m subset.eq RR$ と ${e_i}_(i=1)^m subset.eq RR$ が存在して
$
  epi f = {(x, t) mid(|) c_i^T x + d_i t <= e_i thick (forall i = 1, dots, m)}
$
と書けるとする.
まず, 任意の $x in dom f$ に対して $t$ を十分大きく取ることで $(x, t) in epi f$ とできることから各 $i = 1, dots, m$ について $d_i <= 0$ とわかる.
ここで $i$ たちを 2 つの集合に分ける:
$
  I_0 = {i mid(|) d_i = 0}, quad I_- = {i mid(|) d_i < 0}
$
多面体 $P subset.eq RR^n$ を ${x in RR^n mid(|) c_i^T x <= e_i thick (forall i in I_0)}$ と定める.
このとき $I_- eq.not nothing$ である (もし空なら $epi f = P times RR$ となって矛盾する).
$i in I_-$ に対しては $d_i < 0$ であることから
$
  epi f & = {(x, t) mid(|) x in P, quad t >= frac(e_i, d_i, style: "horizontal") - (frac(c_i, d_i, style: "horizontal"))^T x thick (forall i in I_-)} \
  & = {(x, t) mid(|) x in P, quad t >= max_(i in I_-) {frac(e_i, d_i, style: "horizontal") - (frac(c_i, d_i, style: "horizontal"))^T x} }
$
を得る.
よって $dom f = P$ であり,
$
  f(x) = max_(i in I_-) {frac(e_i, d_i, style: "horizontal") - (frac(c_i, d_i, style: "horizontal"))^T x}
$
とわかる.
逆にこのような関数のエピグラフは多面体になる.
$qed$
