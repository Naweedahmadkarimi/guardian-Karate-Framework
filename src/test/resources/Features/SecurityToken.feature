@Smoke
Feature: Security token Tests

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"

  Scenario: Generate valid token with valid username and password
    # prepare request:
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  Scenario Outline: Validate token with invalid username
    And request
      """
      {
        "username": "<username>",
        "password": "<password>"
      }
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "<errorMessage>"

    Examples: 
      | username   | password       | errorMessage         |
      | wronguser  | tek_supervisor | User not found       |
      | supervisor | wrongpassword  | Password Not Matched |
  #Scenario: Validate token with invalid password
    #And request
      #"""
      #{
        #"username": "supervisor",
       # "password": "wrongpassword"
      #}
     # """
    #When method post
    #Then status 400
    #And print response
    #And assert response.errorMessage == "Password Not Matched"
