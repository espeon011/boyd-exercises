#import "../../lib.typ": ex
#import "../../compat.typ": rich-heading
#show: rich-heading

== Exercise 2.28 (Positive semidefinite cone for $n = 1, 2, 3$)

#ex[
  Give an explicit description of the positive semidefinite cone $S_+^n$, in
  terms of the matrix coefficients and ordinary inequalities, for $n = 1, 2, 3$.
  To describe a general element of $S^n$, for $n = 1, 2, 3$, use the notation
  $
    x_1, quad mat(x_1, x_2; x_2, x_3), quad mat(x_1, x_2, x_3; x_2, x_4, x_5; x_3, x_5, x_6).
  $
]

*解答*: 行列の固有方程式の解が全て非負であるための必要十分条件を示せばよい:
- $n = 1$ の場合:
  + $x_1 >= 0$
- $n = 2$ の場合:
  + $x_1 + x_3 >= 0$
  + $x_1 x_3 - x_2^2 >= 0$
- $n = 3$ の場合:
  + $x_1 + x_4 + x_6 >= 0$
  + $x_1 x_4 + x_1 x_6 + x_4 x_6 - x_2^2 - x_3^2 - x_5^2 >= 0$
  + $x_1 x_4 x_6 + 2 x_2 x_3 x_5 - x_1 x_5^2 - x_4 x_3^2 - x_6 x_2^2 >= 0$
解の非負性と係数の関係については省略. $qed$
