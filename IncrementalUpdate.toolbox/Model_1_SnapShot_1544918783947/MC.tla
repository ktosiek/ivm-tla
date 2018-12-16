---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491878186018000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491878186019000 == 
Permutations(const_154491878186018000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154491878186020000 == 
{ {d0, d0}, {d0, d1}, {d1, d1}, {d1, d0},
  {d0, d2}, {d1, d2} }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491878186021000 ==
MaxDelta(3)
----
\* INIT definition @modelBehaviorInit:0
init_154491878186122000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491878186123000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491878186124000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491878186125000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:06:21 CET 2018 by tomek
