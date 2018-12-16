---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154492080818274000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154492080818275000 == 
Permutations(const_154492080818274000)
----

\* CONSTANT definitions @modelParameterConstants:1PotentialLinks
const_154492080818276000 == 
{ <<d0, d0>>, <<d0, d1>>, <<d0, d2>>,
  <<d1, d0>>, <<d1, d1>>, <<d1, d2>> }
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154492080818277000 ==
/\ MaxDelta(10)
/\ MaxLinkDups(3)
----
\* INIT definition @modelBehaviorInit:0
init_154492080818278000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154492080818279000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154492080818280000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154492080818281000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 01:40:08 CET 2018 by tomek
