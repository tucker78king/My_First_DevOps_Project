public with sharing class GetCases {
    @AuraEnabled(cacheable=true)
    public static Case getAccRecord(Id recordId) {
      try {
        Case cas = [
          SELECT
          Status
          FROM Case
          WHERE Id = :recordId
          WITH SECURITY_ENFORCED
          LIMIT 1
        ];
        return cas;
      }
      // Code to handle exception
      catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }
}