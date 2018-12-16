------------------------- MODULE incremental_update -------------------------
EXTENDS Integers, Bags, TLC

CONSTANTS Groups, Users, Documents
VARIABLES userGroups, dUserGroups, docGroups, dDocGroups, mUserDoc

RECURSIVE SumAcc(_,_,_)
SumAcc(f, S, Acc) ==
    IF S = {} THEN Acc
    ELSE LET x == CHOOSE x \in S : TRUE
         IN SumAcc(f, S \ { x }, Acc + f[x])
Sum(f, S) == SumAcc(f, S, 0)
SumF(F) == Sum(F, DOMAIN F)

Abs(n) == IF n < 0 THEN (-n) ELSE n
NBag(B) ==
    LET nonEmpty == { e \in DOMAIN B : B[e] /= 0 }
    IN [e \in nonEmpty |-> B[e]]

BagPlus(B1, B2) ==
    [e \in (DOMAIN B1) \cup (DOMAIN B2) |->
      (IF e \in DOMAIN B1 THEN B1[e] ELSE 0)
    + (IF e \in DOMAIN B2 THEN B2[e] ELSE 0) ]

BagMinus(B1, B2) ==
    [e \in (DOMAIN B1) \cup (DOMAIN B2) |->
      (IF e \in DOMAIN B1 THEN B1[e] ELSE 0)
    - (IF e \in DOMAIN B2 THEN B2[e] ELSE 0) ]

BagEq(B1, B2) ==
    DOMAIN (NBag(BagMinus(B1, B2))) = { }

NoNegativeValues(B) ==
    \A e \in DOMAIN B : B[e] >= 0

------------------------------------------------------------

TypeOK ==
    /\ (DOMAIN userGroups) \subseteq (Users \X Groups)
    /\ NoNegativeValues(userGroups)
    /\ (DOMAIN dUserGroups) \subseteq (Users \X Groups)

    /\ (DOMAIN docGroups) \subseteq (Documents \X Groups)
    /\ NoNegativeValues(docGroups)
    /\ (DOMAIN dDocGroups) \subseteq (Documents \X Groups)

    /\ (DOMAIN mUserDoc) \subseteq (Users \X Documents)
    /\ NoNegativeValues(mUserDoc)

(* A cross product on bags *)
Join(R, S) == [
    <<r, s>> \in (DOMAIN R) \X (DOMAIN S) |->
    CopiesIn(r, R) * CopiesIn(s, S)
]

UserDoc(ugs, gds) == [
    <<user, doc>> \in (Users \X Documents) |->
    LET prod == Join(ugs, gds)
    IN SumF(NBag([
        <<ug, gd>> \in DOMAIN prod |->
        IF /\ user = ug[1]
           /\ ug[2] = gd[1]
           /\ gd[2] = doc
        THEN prod[<<ug, gd>>] ELSE 0
    ]))
]

AddWithDelta(B, dB, t) ==
    /\ B' = [B EXCEPT ![t] = CopiesIn(t, B) + 1]
    /\ dB' = [dB EXCEPT ![t] = CopiesIn(t, dB) + 1]

RemoveWithDelta(B, dB, t) ==
    /\ B[t] /= 0
    /\ B' = [B EXCEPT ![t] = @ - 1]
    /\ dB' = [dB EXCEPT ![t] = @ - 1]

AddUserToGroup == \E t \in (Users \X Groups):
    /\ AddWithDelta(userGroups, dUserGroups, t)
    /\ UNCHANGED <<docGroups, dDocGroups, mUserDoc>>

RemoveUserFromGroup == \E t \in DOMAIN userGroups:
    /\ RemoveWithDelta(userGroups, dUserGroups, t)
    /\ UNCHANGED <<docGroups, dDocGroups, mUserDoc>>

PublishDocumentForGroup == \E doc \in Documents, group \in Groups :
    /\ AddWithDelta(docGroups, dDocGroups, <<doc, group>>)
    /\ UNCHANGED <<userGroups, dUserGroups, mUserDoc>>

HideDocumentFromGroup == \E t \in DOMAIN docGroups :
    /\ RemoveWithDelta(docGroups, dDocGroups, t)
    /\ UNCHANGED <<userGroups, dUserGroups, mUserDoc>>

(* delta mUserDoc na podstawie delt userGroups i docGroups *)
UserDocDelta(dUG, dDG) ==
    BagMinus(
        BagPlus(UserDoc(dUG, docGroups),
                UserDoc(userGroups, dDG)),
        UserDoc(dUG, dDG))

(* UserDoc(userGroups, docGroups) - mUserDoc *)
dmUserDoc ==
    UserDocDelta(dUserGroups, dDocGroups)

deltasEmpty ==
    /\ BagEq(dUserGroups, EmptyBag)
    /\ BagEq(dDocGroups, EmptyBag)

ApplyAllDeltas ==
    /\ ~deltasEmpty
    /\ mUserDoc' = BagPlus(mUserDoc, dmUserDoc)
    /\ dUserGroups' = [t \in (Users \X Groups) |-> 0]
    /\ dDocGroups' = [t \in (Documents \X Groups) |-> 0]
    /\ UNCHANGED <<userGroups, docGroups>>

emptyUserGroups == [t \in (Users \X Groups) |-> 0]
emptyDocGroups == [t \in (Documents \X Groups) |-> 0]

ApplySomeUserDeltas == \E ts \in SUBSET (DOMAIN dUserGroups) :
    LET dUG == [t \in ts |-> dUserGroups[t]] IN
    /\ ~BagEq(dUG, EmptyBag)
    /\ mUserDoc' = BagPlus(mUserDoc, UserDocDelta(dUG, emptyDocGroups))
    /\ dUserGroups' = BagMinus(dUserGroups, dUG)
    /\ UNCHANGED <<userGroups, docGroups, dDocGroups>>

ApplySomeDocumentDeltas == \E ts \in SUBSET (DOMAIN dDocGroups) :
    LET dDG == [t \in ts |-> dDocGroups[t]] IN
    /\ ~BagEq(dDG, EmptyBag)
    /\ mUserDoc' = BagPlus(mUserDoc, UserDocDelta(emptyUserGroups, dDG))
    /\ dDocGroups' = BagMinus(dDocGroups, dDG)
    /\ UNCHANGED <<userGroups, docGroups, dUserGroups>>

ApplySomeDeltas ==
    \/ ApplySomeUserDeltas
    \/ ApplySomeDocumentDeltas
    \/ ApplyAllDeltas

Init ==
    /\ userGroups = emptyUserGroups
    /\ dUserGroups = emptyUserGroups
    /\ docGroups = emptyDocGroups
    /\ dDocGroups = emptyDocGroups
    /\ deltasEmpty
    /\ mUserDoc = UserDoc(userGroups, docGroups)
    /\ BagEq(mUserDoc, EmptyBag)

Next ==
    \/ AddUserToGroup
    \/ RemoveUserFromGroup
    \/ PublishDocumentForGroup
    \/ HideDocumentFromGroup
    \/ ApplySomeDeltas

Spec ==
    /\ Init
    /\ [][Next]_<<userGroups, dUserGroups, docGroups, dDocGroups, mUserDoc>>

Consistent ==
    /\ deltasEmpty => BagEq(mUserDoc, UserDoc(userGroups, docGroups))
    /\ BagEq(BagPlus(mUserDoc, dmUserDoc), UserDoc(userGroups, docGroups))

Fairness ==
   \* /\ WF_<<userGroups, dUserGroups, docGroups, dDocGroups, mUserDoc>>(ApplySomeDeltas)
    /\ (~deltasEmpty) ~> deltasEmpty

MaxDelta(n) ==
    /\ n >= SumF([i \in DOMAIN dUserGroups |-> Abs(dUserGroups[i])])
    /\ n >= SumF([i \in DOMAIN dDocGroups |-> Abs(dDocGroups[i])])

MaxDups(n) ==
    /\ \A t \in DOMAIN userGroups : userGroups[t] =< n
    /\ \A t \in DOMAIN docGroups : docGroups[t] =< n

\* -> R, dR, S, dS
\* <- Hop, dHop, TriHop, dTriHop
\* always: dR is empty /\ dS is empty => Hop \eq vHop
\* always: dR is empty /\ dS is empty /\ dHop is empty => TriHop \eq vTriHop
\* eventually: dR is empty /\ dS is empty /\ dHop is empty

=============================================================================
\* Modification History
\* Last modified Sun Dec 16 14:31:01 CET 2018 by tomek
\* Created Wed Dec 12 22:55:34 CET 2018 by tomek
