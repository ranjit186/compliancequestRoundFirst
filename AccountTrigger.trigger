trigger AccountTrigger on Account (after insert) {
    
    Switch On Trigger.OperationType{
        When AFTER_INSERT{
            AccountHandlerTrigger.updateAccountAndCreateTaskFields(trigger.new);
        }
    }

}