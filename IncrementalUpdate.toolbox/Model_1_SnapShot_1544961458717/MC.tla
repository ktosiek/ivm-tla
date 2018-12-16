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
const_1544961453689223000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544961453689224000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544961453689225000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544961453689226000 == 
Permutations(const_1544961453689223000) \union Permutations(const_1544961453689224000) \union Permutations(const_1544961453689225000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544961453689227000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544961453689228000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544961453689229000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544961453689230000 ==
Consistent
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1544961453689231000 ==
Finishes
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:57:33 CET 2018 by tomek
