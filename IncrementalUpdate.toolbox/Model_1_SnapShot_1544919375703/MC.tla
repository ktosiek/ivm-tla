---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491936867250000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491936867251000 == 
Permutations(const_154491936867250000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154491936867252000 == 
{ <<d0, d0>>, <<d0, d1>>, <<d0, d2>>,
  <<d1, d0>>, <<d1, d1>>, <<d1, d2>> }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491936867253000 ==
MaxDelta(10)
----
\* INIT definition @modelBehaviorInit:0
init_154491936867254000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491936867255000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491936867256000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491936867257000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:16:08 CET 2018 by tomek
