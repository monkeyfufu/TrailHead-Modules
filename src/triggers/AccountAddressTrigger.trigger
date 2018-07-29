trigger AccountAddressTrigger on Account (before insert) {
    
    trailhead_apexTriggerAcc obj = new trailhead_apexTriggerAcc();
    if(Trigger.isInsert){
        if(Trigger.isBefore){
			obj.isBeforeInsert(Trigger.New);            
        }
    }

}