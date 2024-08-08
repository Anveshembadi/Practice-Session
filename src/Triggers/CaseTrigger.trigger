/* Whenever a case is created and case origin is 'phone', Set Priority as low, else as High */

trigger CaseTrigger on Case (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Case caseRec : Trigger.New){
            if(caseRec.Origin =='Phone'){
                caseRec.Priority='Low';
            }
            else{
                caseRec.Priority = 'High';
            }
        }
    }
}