trigger Accountaftertrigger on Account (before update, before insert) {
for(Account o: Trigger.new)
{
o.Phone = '11223344';
}  
}