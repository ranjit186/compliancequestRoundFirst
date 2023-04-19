trigger TaskTrigger on Task (After Update) {
    Switch on Trigger.OperationType{
        WHEN AFTER_UPDATE{
            TaskTriggerHandler.UpdateTaskFields(Trigger.new);
        }
    }
}