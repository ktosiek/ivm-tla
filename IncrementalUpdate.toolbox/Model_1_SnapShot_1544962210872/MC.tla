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
const_1544962161834267000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544962161834268000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544962161834269000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544962161834270000 == 
Permutations(const_1544962161834267000) \union Permutations(const_1544962161834268000) \union Permutations(const_1544962161834269000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544962161834271000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544962161834272000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544962161834273000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544962161834274000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 13:09:21 CET 2018 by tomek
