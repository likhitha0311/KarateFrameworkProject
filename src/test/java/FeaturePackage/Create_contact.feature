
Feature:Create a contact in addressbook

Background:
* url baseUrl
* def bearer_token = call read('StudioLogin.feature')
* def token = bearer_token.access_token
* header Authorization = 'Bearer '+token
* headers {Content-Type : 'application/json', Accept : 'application/json'}
* def pathUrl = '/api/designer/v1.0/contacts'
* def jsonPayload = read('C://Users//karti//eclipse//Karate//RequestPayload//Create_contact_with_existing_company.json')
* def jsonResponse = read('C://Users//karti//eclipse//Karate//ResponsePayload//Create_contact_with_existing_company.json')
* def RandomCharacters = Java.type('FeaturePackage.RandomCharacter')
* def name = RandomCharacters.random_Characters()



  @tag1
  Scenario: Create a contact in addressbook with all valid details
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = name
    And set jsonPayload.email = name +'@gmail.com'
    And set jsonResponse.data.name = name
    And set jsonResponse.data.email = name +'@gmail.com'
    When method POST
    Then status 200
    And match response == jsonResponse
    * def code = response.data.code
    
    Given path pathUrl+'/'+code
    And header Authorization = 'Bearer '+token
    When method delete
    Then status 200
    
    
    Scenario Outline: Create a contact in addressbook with different names
    Given path pathUrl
    And header Authorization = 'Bearer '+token
    And request jsonPayload
    And set jsonPayload.name = <Name>
    And set jsonPayload.email = name +'@gmail.com'
    And set jsonResponse.data.name = <Name>
    And set jsonResponse.data.email = name +'@gmail.com'
    When method POST
    Then status <Status_Code>
    And match response == jsonResponse
    * def code = response.data.code
    
    Examples:
    
    |Name|Status_Code|
    |123456|400|
    |'~!@#$%^'|200|
   
   
    Scenario: Create a contact in addressbook without a name
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = null
    And set jsonPayload.email = name +'@gmail.com'
    When method POST
    Then status 400
    
    Scenario: Create a contact in addressbook without email address
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = name
    And set jsonPayload.email = null
    When method POST
    Then status 400
    And match response == {"error": "The email must be a valid email address."}
    
    Scenario: Create a contact in addressbook with invalid  email address
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = name
    And set jsonPayload.email = ',.. @gmail.com'
    When method POST
    Then status 400
    And match response == {"error": "The email must be a valid email address."}
    
    Scenario Outline: Create a contact in addressbook with invalid telephone number
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = name
    And set jsonPayload.email = name +'@gmail.com'
    And set jsonPayload.tel_no1 = <tel_no>
    And set jsonResponse.data.name = name
    And set jsonResponse.data.email = name +'@gmail.com'
    When method POST
    Then status <Status_Code>
   
   Examples:
   |tel_no|Status_Code|
   |1211234|200|
   |'@##$%^&'|400|
   
    Scenario: Create a contact in addressbook with invalid Linkedin Url
    Given path pathUrl
    And header Authorization = 'Bearer '+token
    And request jsonPayload
    And set jsonPayload.name = name
    And set jsonPayload.email = name +'@gmail.com'
    And set jsonPayload.linked_in_url = "abcd"
    When method POST
    Then status 400
    
   
   
    

 
