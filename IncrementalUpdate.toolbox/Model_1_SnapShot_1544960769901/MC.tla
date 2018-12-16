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
const_1544960699863206000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544960699863207000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544960699863208000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544960699863209000 == 
Permutations(const_1544960699863206000) \union Permutations(const_1544960699863207000) \union Permutations(const_1544960699863208000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544960699863210000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544960699863211000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544960699863212000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544960699863213000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:44:59 CET 2018 by tomek
