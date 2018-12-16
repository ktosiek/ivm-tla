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
const_1544957981125118000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544957981125119000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544957981125120000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544957981125121000 == 
Permutations(const_1544957981125118000) \union Permutations(const_1544957981125119000) \union Permutations(const_1544957981125120000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544957981125122000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* INIT definition @modelBehaviorInit:0
init_1544957981125123000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_1544957981125124000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544957981125125000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544957981125126000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 11:59:41 CET 2018 by tomek
