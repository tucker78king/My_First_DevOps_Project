public with sharing class GetContacts {

    @AuraEnabled(cacheable=true)
    public static Contact getConRecord(Id recordId) {
      try {
          Contact con = [
          SELECT
            LastName,
            FirstName,
            MailingStreet,
            MailingCity,
            MailingState,
            MailingPostalCode,
            MailingCountry
          FROM Contact
          WHERE Id = :recordId
          WITH SECURITY_ENFORCED
          LIMIT 1
        ];
        return con;
      }
      // Code to handle exception
      catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
      }
    }
  }