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
const_1544958975098172000 == 
{d1, d2}
----

\* MV CONSTANT definitions Groups
const_1544958975098173000 == 
{g1, g2}
----

\* MV CONSTANT definitions Users
const_1544958975098174000 == 
{u1, u2}
----

\* SYMMETRY definition
symm_1544958975098175000 == 
Permutations(const_1544958975098172000) \union Permutations(const_1544958975098173000) \union Permutations(const_1544958975098174000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_1544958975098176000 ==
/\ MaxDelta(20)
/\ MaxDups(1)
----
\* INIT definition @modelBehaviorInit:0
init_1544958975098177000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_1544958975098178000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1544958975098179000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1544958975098180000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 12:16:15 CET 2018 by tomek
