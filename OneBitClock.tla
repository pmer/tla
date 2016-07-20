---------------------------- MODULE OneBitClock ----------------------------

EXTENDS Integers

VARIABLE b1
VARIABLE b2
VARIABLE b3

Init == \/ /\ (b1=0)
           /\ (b2=0)
           /\ (b3=0)
        \/ /\ (b1=1)
           /\ (b2=1)
           /\ (b3=1)

Next1 == \/ /\ b1 = 0
            /\ b1' = 1
         \/ /\ b1 = 1
            /\ b1' = 0

Next2 == b2' = IF b2 = 0 THEN 1 ELSE 0

Next3 == b3' = (b3 + 1) % 2

Next == /\ Next1
        /\ Next2
        /\ Next3

TypeOK == /\ b1 = b2
          /\ b2 = b3

=============================================================================
\* Modification History
\* Last modified Tue Jul 19 18:45:33 PDT 2016 by pdm
\* Created Sat Jun 25 15:06:09 PDT 2016 by pdm
