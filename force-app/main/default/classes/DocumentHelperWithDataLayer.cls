/**
 * @description       : Helper Class for operations containing Document__c with Data Layer
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-04-2021
 * @last modified by  : contact@matheus.dev
 **/
public with sharing class DocumentHelperWithDataLayer {
    // Create a private dataLayer here
    private IDataLayer dataLayer;

    // For an empty constructor, you create a new instance of the DataLayer:
    // TODO
    public DocumentHelperWithDataLayer() {
        this(new DataLayer());
    }

    // If the constructor contains a dataLayer as a parameter, use it in your class.
    // TODO
    public DocumentHelperWithDataLayer(IDataLayer dataLayer) {
        this.dataLayer = dataLayer;
    }

    // Existing Methods
    public List<Document__c> getDocumentsForUpdate(Map<ID, Account> newMap) {
        List<Document__c> documentsToProcess = dataLayer.getDocumentsLinkedToAccounts(
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

    // Create DataLayer class here
    public class DataLayer implements IDataLayer {
        public List<Document__c> getDocumentsLinkedToAccounts(
            Map<ID, Account> newMap
        ) {
            return [
                SELECT Id, Account__r.Name, Contract__r.Name
                FROM Document__c
                WHERE Account__c IN :newMap.keySet()
            ];
        }
    }

    // Create Interface here:
    public interface IDataLayer {
        List<Document__c> getDocumentsLinkedToAccounts(Map<ID, Account> newMap);
    }
}
