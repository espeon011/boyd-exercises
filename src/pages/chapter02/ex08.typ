#import "../../lib.typ": alpha-enum, ex

== Exercise 2.8

#ex[
  Which of the following sets $S$ are polyhedra?
  If possible, express $S$ in the form $S = { x mid(|) A x prec.eq b, F x = g}$.

  #alpha-enum(
    [$S = {y_1 a_1 + y_2 a_2 mid(|) -1 <= y_1 <= 1, -1 <= y_2 <= 1}$, where $a_1, a_2 in RR^n$ ],
    [$S = {x in RR^n mid(|) x succ.eq 0, bold(1)^T x = 1, sum_(i=1)^n x_i a_i = b_1, sum_(i=1)^n x_i a_i^2 = b_2}$, where $a_1, dots, a_n in RR$ and $b_1, b_2 in RR$. ],
    [$S = {x in RR^n mid(|) x succ.eq 0, x^T y <= 1, "for all" y "with" norm(y)_2 = 1}$ ],
    [$S = {x in RR^n mid(|) x succ.eq 0, x^T y <= 1, "for all" y "with" sum_(i=1)^n abs(y_i) = 1}$],
  )
]

*解答*: (a), (b), (d) が多面体であり, (c) だけが多面体でない.
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
