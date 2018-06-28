global class BatchOldBookDetailsDelete implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name FROM Bookinformation__c where ReadingCheck__c= false';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Bookinformation__c > scope)
    {
        delete scope;
    }
    global void finish(Database.BatchableContext BC) {
    }
}