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
const_1544962180618283000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544962180618284000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544962180618285000 == 
{u1, u2}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544962180618286000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544962180618287000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544962180618288000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544962180618289000 ==
Consistent
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1544962180618290000 ==
Fairness
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 13:09:40 CET 2018 by tomek
