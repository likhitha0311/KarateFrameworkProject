@ignore
@tag
Feature: Test
Background:
 * url 'https://reqres.in'
  

  @tag1
  Scenario:testing
    Given path '/api/register'
    And request { "email": "eve.holt@reqres.in","password": "pistol"}
    When method post
    Then status 200
    And print response
    And print 'Id is', response.id

    Given path '/api/users/'+response.id
    When method get
    Then status 200
    And print response