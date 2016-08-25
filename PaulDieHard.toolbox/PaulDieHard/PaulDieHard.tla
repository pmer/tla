---------------------------- MODULE PaulDieHard ----------------------------

EXTENDS Integers

VARIABLES big, small

Init == /\ big = 0
        /\ small = 0

FillSmall == /\ small' = 3
             /\ big' = big

FillBig == /\ small' = small
           /\ big' = 5

EmptySmall == /\ small' = 0
              /\ big' = big

EmptyBig == /\ small' = small
            /\ big' = 0

Min(m,n) == IF m < n THEN m ELSE n

(*
SmallToBig == \/ /\ big + small > 5
                 /\ big' = 5
                 /\ small' = small - (5 - big)
              \/ /\ big + small <= 5
                 /\ big' = big + small
                 /\ small' = 0
*)

(*
SmallToBig == /\ big' = Min(big + small, 5)
              /\ small' = small - (big' - big)
*)

(*
SmallToBig == /\ big' = Min(big + small, 5)
              /\ small' = small - (Min(big + small, 5) - big)
*)

SmallToBig ==
    LET poured == Min(big + small, 5) - big
    IN  /\ big' = big + poured
        /\ small' = small - poured

BigToSmall ==
    LET poured == Min(big + small, 3) - small
    IN  /\ big' = big - poured
        /\ small' = small + poured

Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall

TypeOK == /\ big   \in 0..5
          /\ small \in 0..3

=============================================================================
\* Modification History
\* Last modified Wed Aug 24 18:07:50 PDT 2016 by pdm
\* Created Wed Aug 03 17:59:56 PDT 2016 by pdm
