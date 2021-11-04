/**
 * @description       : Simplified Test Class for DocumentHelper
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
@isTest
public class DocumentHelperTest {
    @testSetup
    static void setup() {
        // Create common test accounts
        List<Account> testAccounts = TestDataFactory.createAccountsForInsert(
            201
        );
        insert testAccounts;
    }

    @IsTest
    static void test_get_documents_for_insert() {
        Map<Id, Account> newMap = new Map<Id, Account>(
            [SELECT Id, Name FROM Account]
        );

        System.assert(!newMap?.isEmpty(), 'Map of accounts is empty');

        Test.startTest();

        // Query documents
        List<Document__c> newDocs = [
            SELECT Id, Name, Account__c
            FROM Document__c
            WHERE Account__c IN :newMap.keySet()
        ];
        Test.stopTest();

        System.assertEquals(
            newMap.size(),
            newDocs.size(),
            'The amount of new docs is incorrect.'
        );
    }

    // Test for the new requirement
    @IsTest
    static void test_get_documents_for_update() {
        Map<Id, Account> newMap = new Map<Id, Account>(
            [SELECT Id, Name FROM Account]
        );

        System.assert(!newMap?.isEmpty(), 'Map of accounts is empty');

        // Query documents
        List<Document__c> newDocs = [
            SELECT Id, Name, Account__c
            FROM Document__c
            WHERE Account__c IN :newMap.keySet()
        ];

        System.assertEquals(
            newMap.size(),
            newDocs.size(),
            'The amount of new docs is incorrect.'
        );

        Test.startTest();

        String uniqueValidator = 'demo-data-layer-tampa-fl';
        // Create Contracts
        List<Contract> contractsForInsert = TestDataFactory.createContractsForInsert(
            newDocs,
            uniqueValidator
        );

        insert contractsForInsert;

        List<Account> accountsForUpdate = new List<Account>{};

        // Update the Accounts to trigger the update on Documents
        for (Account acctForUpdate : newMap.values()) {
            acctForUpdate.Name = acctForUpdate.Name + ' | ' + uniqueValidator;
            accountsForUpdate.add(acctForUpdate);
        }

        update accountsForUpdate;

        // Re-query documents to check if the new method worked
        newDocs = [
            SELECT Id, Name, Account__c
            FROM Document__c
            WHERE Account__c IN :newMap.keySet()
        ];

        for (Document__c docForAssertion : newDocs) {
            system.assert(
                docForAssertion.Name?.containsIgnoreCase(uniqueValidator),
                'The unique validator could not be found'
            );
        }

        Test.stopTest();
    }
}
