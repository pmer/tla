---- MODULE MC ----
EXTENDS PaulGCD, TLC

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_147631997707542000 ==
-1000 .. 1000
----
\* Constant expression definition @modelExpressionEval
const_expr_147631997708643000 == 
GCD(10*84,10*73)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_147631997708643000>>)
----

=============================================================================
\* Modification History
\* Created Wed Oct 12 17:52:57 PDT 2016 by pdm
