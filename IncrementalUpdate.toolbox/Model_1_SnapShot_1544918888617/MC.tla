---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491886955634000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491886955635000 == 
Permutations(const_154491886955634000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154491886955636000 == 
{ <<d0, d0>>, <<d0, d1>>, <<d0, d2>>,
  <<d1, d0>>, <<d1, d1>>, <<d1, d2>> }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491886955637000 ==
MaxDelta(3)
----
\* INIT definition @modelBehaviorInit:0
init_154491886955638000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491886955639000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491886955640000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491886955641000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:07:49 CET 2018 by tomek
