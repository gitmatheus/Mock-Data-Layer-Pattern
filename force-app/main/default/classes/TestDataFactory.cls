/**
 * @description       : Simplified Test Factory
 * @author            : contact@matheus.dev
 * @group             :
 * @last modified on  : 11-03-2021
 * @last modified by  : contact@matheus.dev
 **/
public class TestDataFactory {
    public static Account createAccountForInsert(String accountName) {
        return new Account(Name = accountName);
    }

    public static List<Account> createAccountsForInsert(Integer recordCount) {
        List<Account> resultAccounts = new List<Account>{};
        for (Integer i = 0; i <= recordCount; i++) {
            resultAccounts.add(createAccountForInsert('Test Account ' + i));
        }

        return resultAccounts;
    }

    public static Contract createContractForInsert(
        String uniqueValidator,
        Document__c document
    ) {
        return new Contract(
            Name = uniqueValidator + ' | Test Contract | ' + document.Name,
            AccountId = document.Account__c
        );
    }

    public static List<Contract> createContractsForInsert(
        List<Document__c> documents,
        String uniqueValidator
    ) {
        List<Contract> resultContracts = new List<Contract>{};
        for (Document__c document : documents) {
            resultContracts.add(
                createContractForInsert(uniqueValidator, document)
            );
        }

        return resultContracts;
    }
}
