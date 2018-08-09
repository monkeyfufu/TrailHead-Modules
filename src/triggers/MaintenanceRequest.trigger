trigger MaintenanceRequest on Case (before update, after update) {
    // call MaintenanceRequestHelper.updateWorkOrders
    if(Trigger.isUpdate && trigger.isAfter){
        MaintenanceRequestHelper.updateWorkOrders(Trigger.oldMap, Trigger.newMap);
    }  
    
}