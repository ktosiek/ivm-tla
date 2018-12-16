---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491940656158000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491940656159000 == 
Permutations(const_154491940656158000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154491940656160000 == 
{ <<d0, d0>>, <<d0, d1>>, <<d0, d2>>,
  <<d1, d0>>, <<d1, d1>>, <<d1, d2>> }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491940656161000 ==
MaxDelta(10)
----
\* INIT definition @modelBehaviorInit:0
init_154491940656162000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491940656163000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491940656164000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491940656165000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:16:46 CET 2018 by tomek
