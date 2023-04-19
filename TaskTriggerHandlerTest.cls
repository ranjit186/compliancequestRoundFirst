@isTest
public class TaskTriggerHandlerTest {
    @isTest static void createPermission() {
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_Account_Admin'];
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        System.runAs(thisUser){
            
            insert new PermissionSetAssignment(AssigneeId = UserInfo.getUserId(), PermissionSetId = ps.Id);
             }
        
        
        Task tempTask = new Task();
        tempTask.Subject = 'Review Account';
        tempTask.Status = 'Not Started';
        tempTask.ActivityDate = Date.today().addDays(7);
        insert tempTask;
        
        Test.startTest();
        tempTask.Status = 'Completed';
        update tempTask;
        Test.stopTest();
    }
}