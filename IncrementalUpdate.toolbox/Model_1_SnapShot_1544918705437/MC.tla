---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491870285210000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491870285211000 == 
Permutations(const_154491870285210000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154491870285212000 == 
{ {d0, d0}, {d0, d1}, {d1, d1}, {d1, d0},
  {d0, d2}, {d1, d2} }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491870285213000 ==
MaxDelta(3)
----
\* INIT definition @modelBehaviorInit:0
init_154491870285214000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491870285215000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491870285216000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491870285217000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:05:02 CET 2018 by tomek
