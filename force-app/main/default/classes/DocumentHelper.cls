/**
 * @description       : Helper Class for operations containing Document__c
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
public with sharing class DocumentHelper {
    // Create the list of Documents for new Accounts
    public List<Document__c> getDocumentsForInsert(Map<ID, Account> newMap) {
        List<Document__c> documentsForInsert = new List<Document__c>{};
        for (Account acct : newMap.values()) {
            Document__c doc = new Document__c(
                Account__c = acct.Id,
                Name = acct.Name
            );
            documentsForInsert.add(doc);
        }

        return documentsForInsert;
    }

    // ==================================================
    // New Requirement, recently requested
    // ==================================================

    // Make changes to the list of documents Documents
    public List<Document__c> getDocumentsForUpdate(Map<ID, Account> newMap) {
        List<Document__c> documentsToProcess = getDocumentsLinkedToAccounts(
            newMap
        );
        for (Document__c doc : documentsToProcess) {
            doc.Name = buildDocName(doc.Account__r.Name, doc.Contract__r.Name);
        }

        return documentsToProcess;
    }

    private String buildDocName(String accountName, String contractName) {
        String result = 'Document: ' + accountName + ' | ' + contractName;
        return result;
    }

    // Get a list of Documents linked to the Accounts
    // Existing Documents might be linked to Contracts
    private List<Document__c> getDocumentsLinkedToAccounts(
        Map<ID, Account> newMap
    ) {
        return [
            SELECT Id, Account__r.Name, Contract__r.Name
            FROM Document__c
            WHERE Account__c IN :newMap.keySet()
        ];
    }
}
