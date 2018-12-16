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
const_1544960582971198000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544960582971199000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544960582971200000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544960582971201000 == 
Permutations(const_1544960582971198000) \union Permutations(const_1544960582971199000) \union Permutations(const_1544960582971200000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544960582971202000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544960582971203000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544960582971204000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544960582971205000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:43:02 CET 2018 by tomek
