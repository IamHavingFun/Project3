
public  class CandidateResultController {
    @AuraEnabled
    public static List <CandidateResult__c> getCandidateResults() {
        return [SELECT Candidate__r.Name, PassPercentage__c, StartTime__c, SubmitTime__c, Status__c FROM CandidateResult__c ORDER BY createdDate ASC];
    }    

    @AuraEnabled
    public static List<CandidateResult__c> findByName(String searchKey) {
        //Filter searches by PASS/FAIL or Candidate Name and order by created date ASC order
        String name =  searchKey + '%';
        return [SELECT Candidate__r.Name, PassPercentage__c, StartTime__c, SubmitTime__c, Status__c FROM CandidateResult__c  WHERE Name LIKE  :searchKey OR Candidate__r.Name LIKE :searchKey OR Status__c LIKE :searchKey  ORDER BY createdDate ASC ];
    }
}