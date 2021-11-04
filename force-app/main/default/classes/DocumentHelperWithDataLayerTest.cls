/**
 * @description       : Simplified Test Class for DocumentHelperWithDataLayer
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-04-2021
 * @last modified by  : contact@matheus.dev
 **/
@isTest
public class DocumentHelperWithDataLayerTest {
    // Create a MockDataLayer here:
    private static MockDataLayer dataLayer;
    private static DocumentHelperWithDataLayer testedClass;

    static {
        dataLayer = new MockDataLayer();
    }

    // Test for the new requirement
    @IsTest
    static void test_get_documents_for_update() {
        // Now, let's mock some data:
        // consider using a Mock Data Factory, but for this example, let's create a test Account:
        Account testAccount = new Account(
            Name = 'TestAccount',
            Id = TestUtils.getFakeId(Schema.Account.SObjectType)
        );

        dataLayer.documentAccounts.add(testAccount);

        Contract testContract = new Contract(
            Name = 'TestContract',
            Id = TestUtils.getFakeId(Schema.Contract.SObjectType)
        );

        dataLayer.documentContracts.add(testContract);

        Document__c testDocument = new Document__c(
            Name = 'TestDocument',
            Id = TestUtils.getFakeId(Schema.Document__c.SObjectType),
            Account__r = testAccount,
            Contract__r = testContract
        );

        Document__c testDocumentNoContract = new Document__c(
            Name = 'TestDocument',
            Id = TestUtils.getFakeId(Schema.Document__c.SObjectType),
            Account__r = testAccount
        );

        dataLayer.mockDocuments.add(testDocumentNoContract);

        // Now, all you need to do is to create a new instance of you handler class,
        // but passing your mock data layer to the constructor!

        // Since the Interface structure is the same,
        // the mock version is accepted by the class constructor.
        testedClass = new DocumentHelperWithDataLayer(dataLayer);

        Test.startTest();
        Map<Id, Account> newMap = new Map<Id, Account>(
            dataLayer.documentAccounts
        );

        List<Document__c> testDocuments = testedClass.getDocumentsForUpdate(
            newMap
        );
        Test.stopTest();

        // Run the assertions
        for (Document__c docForUpdate : testDocuments) {
            system.assert(
                docForUpdate.Name?.containsIgnoreCase(testAccount.Name),
                'The document does not contain the account name'
            );
            if (docForUpdate.Contract__r != null) {
                system.assert(
                    docForUpdate.Name?.containsIgnoreCase(testContract.Name),
                    'The document does not contain the contract name'
                );
            }
        }
    }

    // Create the MockDataLayer class here
    public class MockDataLayer implements DocumentHelperWithDataLayer.IDataLayer {
        List<Account> documentAccounts = new List<Account>();
        List<Contract> documentContracts = new List<Contract>();
        List<Document__c> mockDocuments = new List<Document__c>();

        public List<Document__c> getDocumentsLinkedToAccounts(
            Map<ID, Account> newMap
        ) {
            // Here we can just return the mock data.
            return mockDocuments;
        }
    }
}
