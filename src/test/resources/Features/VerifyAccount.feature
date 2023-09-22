@Regression
Feature: Verify Account

  Background: step test
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def validToken = result.response.token

  Scenario: 7 Verify and Account that is exist
    #And path "/api/token"
    #And request {"username": "supervisor","password": "tek_supervisor"}
    #When method post
    #Then status 200
    #And print response
    Given path "/api/accounts/get-account"
    # With def step we create variable and assign value for reusibility
    * def existingId = 19968
    And param primaryPersonId = existingId
    #header have to add to request
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == 19968

  Scenario: 8 Verify get-account with id not exist
    #And path "/api/token"
    #And request {"username": "supervisor","password": "tek_supervisor"}
    #When method post
    #Then status 200
    #And print response
    Given path "/api/accounts/get-account"
    And param primaryPersonId = "1996"
    #header have to add to request
    And header Authorization = "Bearer " + validToken
    When method get
    Then status 200
    And print response
