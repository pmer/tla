------------------------------ MODULE PaulGCD ------------------------------

EXTENDS Integers

(*****************************************************)
(* For Integers p and n, equals TRUE if p divides n. *)
(*****************************************************)

\* Divides(p, n) == n/p \in Int
\* Divides(p, n) == \E q \in 1..n : n = q * p
Divides(p, n) ==       (*****************************************************)
    \E q \in Int :     (* For integers p and n, equals TRUE iff p divides n *)
            n = q * p  (*****************************************************)

DivisorsOf(n) == {p \in Int : Divides(p, n)}

SetMax(S) == CHOOSE i \in S : \A j \in S : i >= j

GCD(m, n) == SetMax(DivisorsOf(m) \cap DivisorsOf(n))

=============================================================================
\* Modification History
\* Last modified Wed Oct 12 18:17:49 PDT 2016 by pdm
\* Created Wed Sep 28 18:28:41 PDT 2016 by pdm
