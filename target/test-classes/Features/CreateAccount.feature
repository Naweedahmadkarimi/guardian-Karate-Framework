@Regression
Feature: Create Account feature

  Background: Step test and get valid token
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def ValidToken = result.response.token

  Scenario: Create valid
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + ValidToken
    # calling Java class in feature file. this utility will create object from java
    * def generateDataObject = Java.type('api.utility.data.GenerateData')
    * def AutoEmail = generateDataObject.getEmail();
    And request
      """
      {
      "email": "#(AutoEmail)",
      "firstName": "Asal",
      "lastName": "Amiri",
      "title": "Mrs.",
      "gender": "FEMALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "2002-09-22",
      }
      """
    When method post
    Then status 400
    And print response
   # And assert response.email == AutoEmail
    # using delete endpoint to remove generate account for continues excution
  
