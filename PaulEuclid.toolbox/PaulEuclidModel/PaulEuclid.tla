----------------------------- MODULE PaulEuclid -----------------------------

EXTENDS Integers, PaulGCD, TLC

CONSTANTS M, N

ASSUME {N} \subseteq Nat \ {0}

(*
--fair algorithm Euclid {
    variables x = M, y = N ;
    { while (x # y) { if (x < y) { y := y - x }
                      else       { x := x - y }
                    }
    }
}
*)

\* BEGIN TRANSLATION
VARIABLES x, y, pc

vars == << x, y, pc >>

Init == (* Global variables *)
        /\ x = M
        /\ y = N
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

\* PartialCorrectness == (pc = "Done") => (x = y) /\ (x = GCD(M, N))
PartialCorrectness == (pc = "Done") => (x = y) /\ (x = GCD(M, N))


=============================================================================
\* Modification History
\* Last modified Wed Dec 21 18:26:39 PST 2016 by paul
\* Last modified Wed Nov 30 20:52:32 PST 2016 by pdm
\* Created Wed Sep 21 17:13:29 PDT 2016 by pdm
