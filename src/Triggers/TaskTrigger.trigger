trigger TaskTrigger on Task (before insert,after insert) {
// when ever a task is created, set priority to high.
    if(Trigger.isInsert && Trigger.isBefore){
        for(Task taskrecord : Trigger.NEW){
            System.debug('Found task record');
            taskrecord.Priority ='High';
        }
    }

}