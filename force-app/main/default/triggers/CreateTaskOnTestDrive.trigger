trigger CreateTaskOnTestDrive on Test_Drive__c (after insert) {
    
    List<Task> NewTaskList=new List<Task>();
    
    for(Test_Drive__c TD:Trigger.new){
        
        Task Reminder=new Task();
        Reminder.Subject='Reminder for your test drive scheduled';
        Reminder.Description='Test Drive ';
        Reminder.Priority='high';
        Reminder.Status='in progress';
        Reminder.whatId=TD.Vehicle__c;
        Reminder.ActivityDate=date.newInstance(TD.Slot__c.year(),
                                              TD.Slot__c.Month(),
                                              TD.Slot__c.day()) -1 ;
        NewTaskList.add(Reminder);
    }

    insert NewTaskList;
}