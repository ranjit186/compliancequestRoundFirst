public class AccountHandlerTrigger {

    Public static void updateAccountAndCreateTaskFields(List<Account> newRecords){
        try{
            List<Task> newListTask = new List<Task>();
            for(Account each: newRecords){
                Task tempTask = new Task();
                tempTask.WhatId = each.Id;
                tempTask.OwnerId = each.OwnerId;
                tempTask.Subject = 'Review Account - '+each.AccountNumber;
                tempTask.Status = 'Not Started';
                tempTask.ActivityDate = Date.today().addDays(7);
                newListTask.add(tempTask);
            }
            if(!newListTask.isEmpty()){
                Database.insert(newListTask);
            }
            
            
        }catch(Exception ex){
            
        }
    }
}