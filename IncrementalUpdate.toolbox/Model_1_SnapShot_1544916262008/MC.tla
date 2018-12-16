---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1, d2
----

\* MV CONSTANT definitions LinkId
const_154491625998087000 == 
{d0, d1, d2}
----

\* SYMMETRY definition
symm_154491625998088000 == 
Permutations(const_154491625998087000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_154491625998089000 ==
MaxDelta(10)
----
\* INIT definition @modelBehaviorInit:0
init_154491625998090000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491625998091000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491625998092000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491625998093000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 00:24:19 CET 2018 by tomek
