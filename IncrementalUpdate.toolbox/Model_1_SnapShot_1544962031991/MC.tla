---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
g1, g2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
u1, u2
----

\* MV CONSTANT definitions Documents
const_1544962026933250000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544962026933251000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544962026933252000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544962026933253000 == 
Permutations(const_1544962026933250000) \union Permutations(const_1544962026933251000) \union Permutations(const_1544962026933252000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544962026933254000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544962026933255000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544962026933256000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544962026933257000 ==
Consistent
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1544962026933258000 ==
Fairness
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 13:07:06 CET 2018 by tomek
