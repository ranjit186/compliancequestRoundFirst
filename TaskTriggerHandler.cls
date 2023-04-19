public class TaskTriggerHandler {
    public static void UpdateTaskFields(List<Task> newRecords){
        try{
            Map<Id, String> AccountIdVsDescription = new Map<Id, String>();
            
            Boolean hasCustomPermission = FeatureManagement.checkPermission('CQ_Account_Admin');

            for(Task each : newRecords){
                
                if(each.Status == 'Completed' && hasCustomPermission){
                    if(!AccountIdVsDescription.containsKey(each.WhatId)){
                        AccountIdVsDescription.put(each.WhatId, each.Description);
                    }else{
                        String exsitingDescription = AccountIdVsDescription.get(each.WhatId);
                        exsitingDescription = exsitingDescription + ' ' + each.Description;
                         AccountIdVsDescription.put(each.WhatId, exsitingDescription);
                    }
                }else if(each.Status == 'Completed' && !hasCustomPermission){
                    each.addError('Only CQ_Account_Admin user can update  staus completed ');
                }   
                
            } 
            
            if(!AccountIdVsDescription.keySet().IsEmpty()){
                List<Account> updateAccountList = new List<Account>();
                for(Id eachAccId : AccountIdVsDescription.keyset()){
                    Account acc = new Account();
                    acc.Id = eachAccId;
                    acc.Description = AccountIdVsDescription.get(eachAccId);
                    acc.Active__c = True;
                    
                    updateAccountList.add(acc);
                }
                if(!updateAccountList.isEmpty()){
                    Database.update(updateAccountList);
                }
            }
            
        }catch(Exception Ex){
            
        }
    }
}