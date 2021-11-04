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

    // PART 2

    // First, create the dataLayer variable:
    private IDataLayer dataLayer;

    // For an empty constructor, you create a new instance of the DataLayer:
    public DataLayerHandler() {
        this(new DataLayer());
    }

    // If the constructor contains a dataLayer as a parameter, use it in your class.
    public DataLayerHandler(IDataLayer dataLayer) {
        this.dataLayer = dataLayer;
    }

    // ============================================

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

    public interface IDataLayer {
        List<Document__c> getDocumentsLinkedToAccounts(Map<ID, Account> newMap);
    }
}
