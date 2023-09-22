@Regression
Feature: Delete Account functionality

  Background: Step test and Create New Account
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def tokenresult = callonce read('GenerateToken.feature')
    * def ValidToken = tokenresult.response.token
    * def createAccount = callonce read('CreateAccount.feature')
    And print createAccount

  Scenario: Successfuly Delete Account
    # Account should be exist to delete 200 status Code
    # Make sure Account not exist to 404status Code
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createAccount
    And header Authorization = "Bearer " + ValidToken
    When method delete
    Then status 500

