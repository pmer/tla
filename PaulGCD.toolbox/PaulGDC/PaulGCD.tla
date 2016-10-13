------------------------------ MODULE PaulGCD ------------------------------

EXTENDS Integers

\* Divides(p, n) == n/p \in Int
\* Divides(p, n) == \E q \in 1..n : n = q * p
Divides(p, n) == \E q \in Int : n = q * p

DivisorsOf(n) == {p \in Int : Divides(p, n)}

SetMax(S) == CHOOSE i \in S : \A j \in S : i >= j

GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))

=============================================================================
\* Modification History
\* Last modified Wed Oct 12 17:39:04 PDT 2016 by pdm
\* Created Wed Sep 28 18:28:41 PDT 2016 by pdm
