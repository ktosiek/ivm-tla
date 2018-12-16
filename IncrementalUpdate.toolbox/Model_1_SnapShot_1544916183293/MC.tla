---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491600966274000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491600966275000 == 
Permutations(const_154491600966274000)
----

\* INIT definition @modelBehaviorInit:0
init_154491600966276000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491600966277000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491600966278000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491600966279000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 00:20:09 CET 2018 by tomek
