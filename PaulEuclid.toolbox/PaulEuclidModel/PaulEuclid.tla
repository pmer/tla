----------------------------- MODULE PaulEuclid -----------------------------

EXTENDS Integers, PaulGCD, TLC

CONSTANTS N

\* ASSUME /\ M \in Nat \ {0}
\*        /\ N \in Nat \ {0}
\* ASSUME {N} \subseteq Nat \ {0}
ASSUME N \in Nat \ {0}

(*
--algorithm Euclid {
    \* variables x = M, y = N ;
    variables x \in 1..N, y \in 1..N, x0 = x, y0 = y ;
    { while (x # y) { if (x < y) { y := y - x }
                      else       { x := x - y }
                    };
      assert (x # y) /\ (x = GCD(x0, y0))
    }
}
*)

\* BEGIN TRANSLATION
VARIABLES x, y, x0, y0, pc

vars == << x, y, x0, y0, pc >>

Init == (* Global variables *)
        /\ x \in 1..N
        /\ y \in 1..N
        /\ x0 = x
        /\ y0 = y
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert((x # y) /\ (x = GCD(x0, y0)), 
                              "Failure of assertion at line 19, column 7.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>
         /\ UNCHANGED << x0, y0 >>

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

\* PartialCorrectness == (pc = "Done") => (x = y) /\ (x = GCD(M, N))
PartialCorrectness == (pc = "Done") => (x = y) /\ (x = GCD(x0, y0))


=============================================================================
\* Modification History
\* Last modified Wed Nov 30 20:51:22 PST 2016 by pdm
\* Created Wed Sep 21 17:13:29 PDT 2016 by pdm
