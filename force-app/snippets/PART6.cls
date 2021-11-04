/**
 * @description       : Simplified Test Class for DocumentHelperWithDataLayer
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
@isTest
public class DocumentHelperWithDataLayerTest {
    private static MockDataLayer dataLayer;
    // ADD THESE TWO THINGS
    private static DocumentHelperWithDataLayer testedClass;

    static {
        dataLayer = new MockDataLayer();
    }

    // ADD GET FAKE ID

    //Method to generate a fake Id based on the SObject Type:
    public static String getFakeId(Schema.SObjectType type) {
        String result = String.valueOf(fakeIdCounter++);
        return type.getDescribe().getKeyPrefix() +
            '0'.repeat(12 - result.length()) +
            result;
    }

    // Test for the new requirement
    @IsTest
    static void test_get_documents_for_update() {
        // Now, let's mock some data:

        // consider using a Mock Data Factory, but for this example, let's create a test Account:
        Account testAccount = new Account(
            Name = 'TestAccount',
            Id = getFakeId(Schema.Account.SObjectType),
            Business__c = getFakeId(Schema.Business__c.SObjectType)
        );
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
