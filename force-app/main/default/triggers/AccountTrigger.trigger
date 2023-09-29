trigger AccountTrigger on Account (before insert) {
  if (Trigger.isBefore && Trigger.isInsert) {
    for (Account eachAcc : Trigger.new) {
      eachAcc.Description = 'Updated by AccTrigger';
    }
  }
}