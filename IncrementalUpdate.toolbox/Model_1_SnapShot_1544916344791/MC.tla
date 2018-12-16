---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491628922494000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491628922495000 == 
Permutations(const_154491628922494000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491628922496000 ==
MaxDelta(10)
----
\* INIT definition @modelBehaviorInit:0
init_154491628922497000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491628922498000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491628922499000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544916289224100000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 00:24:49 CET 2018 by tomek
