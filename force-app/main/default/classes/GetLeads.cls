public with sharing class GetLeads {
    @AuraEnabled(cacheable=true)
    public static Lead getLeadRecord(Id recordId) {
      try {
        Lead ld = [
          SELECT
          LastName
          FROM Lead
          WHERE Id = :recordId
          WITH SECURITY_ENFORCED
          LIMIT 1
        ];
        return ld;
      }
      // Code to handle exception
      catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }}