-------------------------- MODULE PCalOneBitClock --------------------------

EXTENDS Integers

(***************************************************************************
--algorithm Clock {
    variable b \in {0, 1};
    { while (TRUE) { b := (b + 1) % 2
                   }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLE b

vars == << b >>

Init == (* Global variables *)
        /\ b \in {0, 1}

Next == b' = (b + 1) % 2

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Tue Jul 19 17:55:44 PDT 2016 by pdm
\* Created Tue Jul 19 17:49:48 PDT 2016 by pdm
