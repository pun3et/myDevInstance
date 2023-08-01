trigger AutoSubmitionOfApprovalProcess on Interviewer__c (after insert,after update) {


Approval.ProcessSubmitRequest SubmitForApproval= new Approval.ProcessSubmitRequest();

SubmitForApproval.setComments('Automatically submitted for approval through trigger');
SubmitForApproval.setObjectId(Trigger.new[0].id);
SubmitForApproval.setNextApproverIds(new Id[] {Trigger.new[0].Approver__c});
Approval.ProcessResult result = Approval.process(SubmitForApproval);


}