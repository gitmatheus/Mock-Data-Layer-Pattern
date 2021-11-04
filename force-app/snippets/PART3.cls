/**
 * @description       : Helper Class for operations containing Document__c
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
public with sharing class DocumentHelperWithDataLayer {
    public DocumentHelperWithDataLayer() {
        // TODO
    }

    // ============================================
    // PART 3

    // Here, you can access the data using the DataLayer:
    public List<Document__c> getDocumentsForUpdate(Map<ID, Account> newMap) {
        List<Document__c> documentsToProcess = dataLayer.getDocumentsLinkedToAccounts(
            newMap
        );
        // List<Document__c> documentsToProcess = getDocumentsLinkedToAccounts(
        //     newMap
        // );
        for (Document__c doc : documentsToProcess) {
            doc.Name = buildDocName(doc.Account__r.Name, doc.Contract__r.Name);
        }

        return documentsToProcess;
    }

    private String buildDocName(String accountName, String contractName) {
        String result = 'Document: ' + accountName;

        // If the Document is linked to a Contract, add the contract name
        if (String.isNotBlank(contractName)) {
            result = result + ' | ' + contractName;
        }
        return result;
    }
    // ============================================
}
