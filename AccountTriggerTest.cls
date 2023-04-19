@isTest
public class AccountTriggerTest {
 @isTest static void createPermission() {
     Test.startTest();
     Account acc = new Account();
     acc.Name = 'testName123';
     acc.AccountNumber = '987';
     insert acc;
     Test.stopTest();
 }
}