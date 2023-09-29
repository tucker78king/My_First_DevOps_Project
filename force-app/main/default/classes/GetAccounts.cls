public with sharing class GetAccounts {

        @AuraEnabled(cacheable=true)
        public static Account getAccRecord(Id recordId) {
          try {
              Account acc = [
              SELECT
              Name
              FROM Account
              WHERE Id = :recordId
              WITH SECURITY_ENFORCED
              LIMIT 1
            ];
            return acc;
          }
          // Code to handle exception
          catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
          }
        }
      }