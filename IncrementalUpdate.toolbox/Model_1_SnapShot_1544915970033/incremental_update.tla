------------------------- MODULE incremental_update -------------------------
EXTENDS Integers, Bags, TLC

CONSTANTS LinkId
VARIABLES link, dLink, mHop

RECURSIVE SumAcc(_,_,_)
SumAcc(f, S, Acc) ==
    IF S = {} THEN Acc
    ELSE LET x == CHOOSE x \in S : TRUE
         IN SumAcc(f, S \ { x }, Print(S, Acc + f[x]))
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
------------------------------------------------------------

TypeOK == TRUE

(* A cross product on bags *)
Join(R, S) == [
    <<r, s>> \in (DOMAIN R) \X (DOMAIN S) |->
    CopiesIn(r, R) * CopiesIn(s, S)
]

Hop(l1, l2) == [
    <<src, dst>> \in (LinkId \X LinkId) |->
    LET prod == Join(l1, l2)
    IN SumF(NBag([
        <<t1, t2>> \in DOMAIN prod
        |-> IF /\ t1[1] = src
               /\ t1[2] = t2[1]
               /\ t2[2] = dst
            THEN prod[<<t1, t2>>] ELSE 0
    ]))
]

(*
vHop == { <<rId, rValue, sValue>>
        : <<sId, sValue>> \in {s \in S : s[1] = rId }
        , <<rId, rValue>> \in R }
*)

AddLink == \E t \in DOMAIN link :
    /\ link[t] = 0
    /\ link' = [link EXCEPT ![t] = 1]
    /\ dLink' = [dLink EXCEPT ![t] = dLink[t] + 1]
    /\ UNCHANGED <<mHop>>

RemoveLink == \E t \in DOMAIN link :
    /\ link[t] /= 0
    /\ link' = [link EXCEPT ![t] = 0]
    /\ dLink' = [dLink EXCEPT ![t] = dLink[t] - 1]
    /\ UNCHANGED <<mHop>>

dmHop == BagMinus(
    BagPlus(Hop(dLink, link), Hop(link, dLink)),
    Hop(dLink, dLink))

ApplyDeltas ==
    /\ mHop' = BagPlus(mHop, dmHop)
    /\ dLink' = [x \in (LinkId \X LinkId) |-> 0]
    /\ UNCHANGED <<link>>

dLinkIsEmpty == dLink = [x \in (LinkId \X LinkId) |-> 0]

Init ==
    /\ link = [x \in (LinkId \X LinkId) |-> 0]
    /\ dLinkIsEmpty
    /\ mHop = Hop(link, link)

Next == AddLink \/ RemoveLink \/ ApplyDeltas

Consistent ==
    /\ dLinkIsEmpty => BagEq(mHop, Hop(link, link))
    /\ BagEq(BagPlus(mHop, dmHop), Hop(link, link))

\* -> R, dR, S, dS
\* <- Hop, dHop, TriHop, dTriHop
\* always: dR is empty /\ dS is empty => Hop \eq vHop
\* always: dR is empty /\ dS is empty /\ dHop is empty => TriHop \eq vTriHop
\* eventually: dR is empty /\ dS is empty /\ dHop is empty

=============================================================================
\* Modification History
\* Last modified Sun Dec 16 00:18:07 CET 2018 by tomek
\* Created Wed Dec 12 22:55:34 CET 2018 by tomek
