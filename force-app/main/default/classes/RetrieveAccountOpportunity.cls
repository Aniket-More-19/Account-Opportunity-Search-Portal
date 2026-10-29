public with sharing class RetrieveAccountOpportunity {
    public static String searchValue;

    public RetrieveAccountOpportunity() {

    }

    public class AccountOpportunityResults{
        @AuraEnabled
        public Account account;

        @AuraEnabled
        public List<Opportunity> opportunities;

    }

    @AuraEnabled
    public static AccountOpportunityResults getAccountInfo(String queryterm){
        searchValue = queryterm;

        System.debug('Query term in Apex :' + searchValue);

        List<Account> accList = new List<Account>();
        accList = [
            SELECT Id, Name, Account.Owner.Name, AnnualRevenue, Industry, Phone, Website
            FROM Account
            WHERE Name LIKE :('%' + searchValue + '%')
            LIMIT 1
        ];

        if (accList.isEmpty()) {
            throw new AuraHandledException('No Account found with that name.');
        }

        Account retrieved_account = accList.get(0);
        System.debug('Account :::' + retrieved_account);

        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [
            SELECT Id, Name, Account.Name, Amount, StageName, Owner.Name
            FROM Opportunity
            WHERE AccountId = :retrieved_account.Id
        ];

        for (Opportunity opp: oppList){
            System.debug('Opportunity Name ::: ' + opp.Name);
            System.debug('Account ID ::: ' + opp.AccountId);
            System.debug('Account Name ::: ' + opp.Account.Name);
            System.debug('Amount ::: ' + opp.Amount);
            System.debug('Stage ::: ' + opp.StageName);
            System.debug('Owner ID ::: ' + opp.OwnerId);
            System.debug('Owner Name ::: ' + opp.Owner.Name);  
        }

        AccountOpportunityResults result = new AccountOpportunityResults();
        result.account = retrieved_account;
        result.opportunities = oppList;

        return result;
    }
}