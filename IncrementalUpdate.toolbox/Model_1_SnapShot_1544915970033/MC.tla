---- MODULE MC ----
EXTENDS incremental_update, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d0, d1
----

\* MV CONSTANT definitions LinkId
const_154491596299662000 == 
{d0, d1}
----

\* SYMMETRY definition
symm_154491596299663000 == 
Permutations(const_154491596299662000)
----

\* INIT definition @modelBehaviorInit:0
init_154491596299664000 ==
Init
----
\* NEXT definition @modelBehaviorNext:0
next_154491596299665000 ==
Next
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_154491596299666000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_154491596299667000 ==
Consistent
----
=============================================================================
\* Modification History
\* Created Sun Dec 16 00:19:22 CET 2018 by tomek
