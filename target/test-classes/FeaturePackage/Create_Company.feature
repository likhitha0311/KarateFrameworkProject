Feature: Create company scenarios


Background:
 * url baseUrl
 * def loginfile = call read('StudioLogin.feature')
 * def access_token1 = loginfile.access_token
 * header Authorization = 'Bearer '+access_token1
 * def req_headers = {Content-Type : 'application/json', Accept : 'application/json'}
  * def pathUrl = 'companies'
 * def jsonPayload = read('C://Users//karti//eclipse//Karate//RequestPayload//Create_company.json')
 * def jsonResponse = read('C://Users//karti//eclipse//Karate//ResponsePayload//Create_company.json')
 * def RandomCharacter = Java.type('FeaturePackage.RandomCharacter')
 * def cname = RandomCharacter.random_Characters()
 * def delay = 
   """
   function()
   { 
   java.lang.Thread.sleep(3000);
    }
    """
 

  Scenario: Create company with all valid data
    Given path pathUrl
    #And headers req_headers
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonResponse.data.name = cname
    When method post
    Then status 200
    * def company_code = response.data.code
    And print code
    And match response == jsonResponse
  
    
    
    Given path pathUrl+'/'+company_code
    #And headers req_headers
    #And header Content-Type = 'application/json'
    #And header Accept = 'application/json' 
    And header Authorization = 'Bearer '+access_token1
    When method delete
    Then status 200
    And print response
    
    Given path pathUrl+'/'+company_code
    #And header Content-Type = 'application/json'
    #And header Accept = 'application/json' 
    And header Authorization = 'Bearer '+access_token1
    #And headers req_headers
    When method get
    Then status 204
    And print response
  
  
   @parallel=false
   Scenario: Create company with existing company name
    Given path pathUrl
    And request jsonPayload
    When method post
    Then status 400
    Then print response
    Then match response == { "error": "The company name has already been taken."}
    
   @parallel=false
    Scenario: Create company without company name
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = null
    When method post
    Then status 400
    Then print response
    Then match response == { "error": "The company name field is required."}
    
    Scenario: Create company without city name
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.city_name = null
    When method post
    Then status 400
    And print 'Response is ',response
    
    Scenario Outline: Create company with valid and invalid city name
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.city_name = '<city>'
    When method post
    Then status <status_code>
    And print response
    
    Examples:
    |city|status_code|
    |mumbai|200|
    |12345|400|
    |]{}$%^&|400|
    
    Scenario Outline: Create company with invalid telephone number
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.tel_no = '<tel_no>'
    When method post
    Then status <status_code>
    And print response
    
    Examples:
    #|read('Telephonenumber.csv')|
    
    
    |tel_no|status_code|
    |7876655|200|
    |$%^&_((|400|
    
    Scenario: Create company with invalid email address
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.email = 'lenovo@@@email.com'
    When method post
    Then status 400
    And match response == { "error": "The email must be a valid email address."}
    
    Scenario: Create company without industry type
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.industry_type_code = null
    When method post
    Then status 400
    And match response == { "error": "The industry type code field is required."}
    
    Scenario: Create company with invalid industry type
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.industry_type_code = "Not an industry type"
    When method post
    Then status 400
    And match response == { "error": "The industry type code must be valid."}
    
   Scenario: Create company with invalid tags (not an array list)
    Given path pathUrl
    And request jsonPayload
    And set jsonPayload.name = cname
    And set jsonPayload.tags = "tag-check"
    When method post
    Then status 400
    And match response == { "error": "The tag input must be valid."}
    