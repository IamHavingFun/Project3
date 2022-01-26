public with sharing class candidateInformationController {
    
    @AuraEnabled
    public static CandidateResult__c getCandidateInfo(id record) {
        return [SELECT Candidate__r.Name, Candidate__r.Email__c, Candidate__r.PhoneNumber__c FROM  CandidateResult__c WHERE Id = :record LIMIT 1];
    }

    @AuraEnabled
    public static List<CandidateQuestionResult__c> getCandidateSummary(id record) {
        return [SELECT Result__c, CodeCoverage__c, CandidateResult__r.id FROM CandidateQuestionResult__c WHERE CandidateResult__r.id = :record];
    }

    @AuraEnabled
    public static List<CandidateQuestionResult__c> getCandidateTestResults(id record) {
        return [SELECT Result__c, CodeCoverage__c, Question__r.QuestionTopic__c, CandidateResult__r.id FROM CandidateQuestionResult__c WHERE CandidateResult__r.id = :record];
    }
}