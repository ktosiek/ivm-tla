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
const_1544967065152299000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544967065152300000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544967065152301000 == 
{u1, u2}
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544967065152302000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1544967065152303000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544967065152304000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544967065152305000 ==
Consistent
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1544967065152306000 ==
Fairness
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 14:31:05 CET 2018 by tomek
