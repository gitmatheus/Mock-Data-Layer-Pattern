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

    // PART 1
    // First, let's create an interface to this Helper Class
    // And add the methods that are retrieving data:

    public interface IDataLayer {
        List<Document__c> getDocumentsLinkedToAccounts(Map<ID, Account> newMap);
    }

    // PART 1

    // Now, in the same class, let’s create an inner class for this data layer,
    // implementing the Interface you just created:

    // DataLayer Class:
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
}
