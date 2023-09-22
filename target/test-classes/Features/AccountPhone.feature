@Regression
Feature: Create Account and Add phoneNumber

  Background: Setup Test and Create Account
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def createAccountResult = callonce read('CreateAccount.feature')
    And print createAccountResult
    * def validToken = createAccountResult.ValidToken
    * def createAccountId = createAccountResult.response.id

  Scenario: Adding phoneNumber to an Account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = createAccountId
    And header Authorization = "Bearer " + validToken
    * def dataGenerator = Java.type('api.utility.data.GenerateData')
    * def phoneNumber = dataGenerator.getPhoneNumber()
    And request
      """
      {
      "phoneNumber": "#(phoneNumber)",
      "phoneExtension": "",
      "phoneTime": "Evening",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 500
  #  And assert response.phoneNumber == phoneNumber
