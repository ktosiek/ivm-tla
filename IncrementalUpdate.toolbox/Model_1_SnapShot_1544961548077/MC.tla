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
const_1544961543047232000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544961543047233000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544961543047234000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544961543047235000 == 
Permutations(const_1544961543047232000) \union Permutations(const_1544961543047233000) \union Permutations(const_1544961543047234000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544961543047236000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544961543047237000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544961543047238000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544961543047239000 ==
Consistent
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1544961543047240000 ==
Finishes
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:59:03 CET 2018 by tomek
