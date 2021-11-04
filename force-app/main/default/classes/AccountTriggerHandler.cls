/**
 * @description       : Account Trigger Handler
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-04-2021
 * @last modified by  : contact@matheus.dev
 **/
public without sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {
    }

    // -------------------------------------------------------
    // AFTER INSERT
    // -------------------------------------------------------
    public void handleAfterInsert(
        List<Account> newList,
        Map<ID, Account> newMap
    ) {
        // Invokes the Document Helper
        // And gets a list of documents for insert
        DocumentHelper docHelper = new DocumentHelper();

        List<Document__c> documentsForInsert = docHelper.getDocumentsForInsert(
            newMap
        );

        insert documentsForInsert;
    }

    // -------------------------------------------------------
    // AFTER UPDATE
    // -------------------------------------------------------

    public void handleAfterUpdate(
        List<Account> oldList,
        Map<ID, Account> oldMap,
        List<Account> newList,
        Map<ID, Account> newMap
    ) {
        // Invokes our Document Helper
        // And gets a list of documents to update
        DocumentHelperWithDataLayer docHelper = new DocumentHelperWithDataLayer();
        List<Document__c> documentsForUpdate = docHelper.getDocumentsForUpdate(
            newMap
        );
        update documentsForUpdate;
    }

    // -------------------------------------------------------
    // -------------------------------------------------------
    // -------------------------------------------------------

    public void handleBeforeInsert(List<Account> newList) {
        // no logic yet
    }

    public void handleBeforeUpdate(
        List<Account> oldList,
        Map<ID, Account> oldMap,
        List<Account> newList,
        Map<ID, Account> newMap
    ) {
        // TODO
    }

    public void handleBeforeDelete(
        List<Account> oldList,
        Map<ID, Account> oldMap
    ) {
        // TODO
    }

    public void handleAfterDelete(
        List<Account> oldList,
        Map<ID, Account> oldMap
    ) {
        // TODO
    }
}
