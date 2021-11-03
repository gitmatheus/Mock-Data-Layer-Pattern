/**
 * @description       : 
 * @author            : contact@matheus.dev
 * @group             : 
 * @last modified on  : 11-02-2021
 * @last modified by  : contact@matheus.dev
**/
public without sharing class DocumentTriggerHandler {

    public DocumentTriggerHandler() {
        // TODO
    }
   
    // -------------------------------------------------------
    // INSERT
    // -------------------------------------------------------

    public void handleBeforeInsert(List<Document__c> newList) {
        // no logic yet
    }

    public void handleAfterInsert(
        List<Document__c> newList,
        Map<ID, Document__c> newMap
    ) {
       // TODO
    }

    // -------------------------------------------------------
    // UPDATE
    // -------------------------------------------------------

    public void handleBeforeUpdate(
        List<Document__c> oldList,
        Map<ID, Document__c> oldMap,
        List<Document__c> newList,
        Map<ID, Document__c> newMap
    ) {
        // TODO
    }

    public void handleAfterUpdate(
        List<Document__c> oldList,
        Map<ID, Document__c> oldMap,
        List<Document__c> newList,
        Map<ID, Document__c> newMap
    ) {
        
        // TODO
    }

    // -------------------------------------------------------
    // DELETE
    // -------------------------------------------------------

    public void handleBeforeDelete(
        List<Document__c> oldList,
        Map<ID, Document__c> oldMap
    ) {
        // TODO
    }

    public void handleAfterDelete(
        List<Document__c> oldList,
        Map<ID, Document__c> oldMap
    ) {
        // TODO
    }

    // ------------------------------------------------------------------------
    // PRIVATE METHODS 
    // ------------------------------------------------------------------------

    @TestVisible
    private static String getSomeString(String value, String suffix) {
        return value + suffix;
    }
}