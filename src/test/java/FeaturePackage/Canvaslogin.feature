Feature: Generate Auth Token

  Background: 
    * url 'https://canvas-dev-api.lovethat.design/api/canvas/v1.0/'

  Scenario: Get access token
    Given path 'auth/login'
    #And form field Username = 'likhitha@28lightbulbs.com'
    #And form field Password = '28lightbulbs'
    And header Content-Type = 'application/json'
    And request {"user_name": "likhitha@28lightbulbs.com","password": "28lightbulbs","batch_id": "2ee7f3bd-95bc-4a39-8938-88d86ef47172"}
    When method POST
    Then status 200
    And print response.data.token
