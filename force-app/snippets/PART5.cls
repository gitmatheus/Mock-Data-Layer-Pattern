/**
 * @description       : Simplified Test Class for DocumentHelperWithDataLayer
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
@isTest
public class DocumentHelperWithDataLayerTest {
    // Create a MockDataLayer here:
    private static MockDataLayer dataLayer;

    // Test for the new requirement
    @IsTest
    static void test_get_documents_for_update() {
    }

    // Create the MockDataLayer class here
    public class MockDataLayer implements DocumentHelperWithDataLayer.IDataLayer {
        List<Account> documentAccounts = new List<Account>();
        List<Document__c> mockDocuments = new List<Document__c>();

        public List<Document__c> getDocumentsLinkedToAccounts(
            Map<ID, Account> newMap
        ) {
            // Here we can just return the mock data.
            return mockDocuments;
        }
    }
}
