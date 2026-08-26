#import "../../lib.typ": ex

== Exercise 2.32 <ex-2-32>

#ex[
  Find the dual cone of ${A x mid(|) x succ.eq 0}$, where $A in RR^(m times n)$.
]

*解答*: $RR_+^n$ の自己双対性 (Example 2.23) より
$
  {A x mid(|) x succ.eq 0}^* & = {y in RR^m mid(|) forall x succ.eq 0, y^T A x >= 0} \
                             & = {y in RR^m mid(|) forall x succ.eq 0, (A^T y)^T x >= 0} \
                             & = {y in RR^m mid(|) A^T y succ.eq 0}
$
とわかる. $qed$
