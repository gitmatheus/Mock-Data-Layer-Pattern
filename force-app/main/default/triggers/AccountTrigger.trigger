/**
 * @description       :
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-02-2021
 * @last modified by  : contact@matheus.dev
 **/
trigger AccountTrigger on Account(
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete
) {
    AccountTriggerHandler handler = new AccountTriggerHandler();

    if (Trigger.isBefore && Trigger.isInsert) {
        handler.handleBeforeInsert(Trigger.new);
    } else if (Trigger.isBefore && Trigger.isUpdate) {
        handler.handleBeforeUpdate(
            Trigger.old,
            Trigger.oldMap,
            Trigger.new,
            Trigger.newMap
        );
    } else if (Trigger.isBefore && Trigger.isDelete) {
        handler.handleBeforeDelete(Trigger.old, Trigger.oldMap);
    } else if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new, Trigger.newMap);
    } else if (Trigger.isAfter && Trigger.isUpdate) {
        handler.handleAfterUpdate(
            Trigger.old,
            Trigger.oldMap,
            Trigger.new,
            Trigger.newMap
        );
    } else if (Trigger.isAfter && Trigger.isDelete) {
        handler.handleAfterDelete(Trigger.old, Trigger.oldMap);
    }
}
