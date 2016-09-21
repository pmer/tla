-------------------------- MODULE PaulPCalDieHard --------------------------

EXTENDS Integers

Min(m,n) == IF m < n THEN m ELSE n

(*
--algorithm DieHard {
  variables big = 0, small = 0;
  { while ( TRUE )
    { either big := 5   \* fill the big jug
      or     small := 3 \* fill the small jug
      or     big := 0   \* empty the big jug
      or     small := 0 \* empty the small jug
      or                \* pour from small to big
      \*if (big + small > 5) { small := small - (5 - big);
      \*                       big := 5                    }
      \*else { big := big + small;
      \*       small := 0          }
      with ( poured = Min(big + small, 5) - big )
        { big := big + poured;
          small := small - poured }
      or                \* pour from big to small
      with ( poured = Min(big + small, 3) - small )
        { big := big - poured;
          small := small + poured }
    }
  }
}
*)

=============================================================================
\* Modification History
\* Last modified Wed Sep 21 14:44:02 PDT 2016 by pdm
\* Created Wed Sep 14 18:34:37 PDT 2016 by pdm
