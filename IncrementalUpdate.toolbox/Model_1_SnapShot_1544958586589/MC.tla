---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
g1, g2, g3
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
u1, u2
----

\* MV CONSTANT definitions Documents
const_1544958207006154000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544958207006155000 == 
{g1, g2, g3}
----

\* MV CONSTANT definitions Users
const_1544958207006156000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544958207006157000 == 
Permutations(const_1544958207006154000) \union Permutations(const_1544958207006155000) \union Permutations(const_1544958207006156000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544958207006158000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* INIT definition @modelBehaviorInit:0
init_1544958207006159000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_1544958207006160000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544958207006161000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544958207006162000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:03:27 CET 2018 by tomek
