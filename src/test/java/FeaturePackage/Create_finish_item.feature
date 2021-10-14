Feature: Create finish item

  Background: 
    * url baseUrl
    * def loginfile = call read('StudioLogin.feature')
    * def access_token1 = loginfile.access_token
    * header Authorization = 'Bearer '+access_token1
    * def req_header = {Content-Type : 'application/json', Accept : 'application/json'}
    * def pathUrl = 'projects/packages/karate-api-testing-package/package-items'
    * def jsonPayload = read('C://Users//karti//eclipse//Karate//RequestPayload//Create_finish_item.json')
    * def jsonResponse = read('C://Users//karti//eclipse//Karate//ResponsePayload//Create_finish_item.json')
    * def RandomCharacter = Java.type('FeaturePackage.RandomCharacter')
    * def pname = RandomCharacter.random_Characters()
    * def image_n = "K1-F-"+pname
    * def image_name = Java.type('FeaturePackage.ImageCreation').create_Image(image_n)
    * def file_p = 'C://Users//karti//eclipse//Karate//src//test//java//TestData//Images//'+image_n+'.jpg'
    * def imagedata = Java.type('FeaturePackage.ImageUpload')
    * def imagerefid = imagedata.Ref_id_Generation(file_p)
    * def filename = imagedata.File_name(file_p)
    * def filesize = imagedata.File_Size(file_p)
    
    
  @tag1
  Scenario: Create finish item
    Given path pathUrl
    And params {force: false,view: sections}
    And request jsonPayload
    And set jsonPayload.package_item.name = image_n+"-Name" 
    And set jsonPayload.package_item.product_record_code = image_n+"-Code" 
    And set jsonPayload.product_options[0].featured_image.file.name = filename
    And set jsonPayload.product_options[0].featured_image.file.name = filename
    And set jsonPayload.product_options[0].images[0].ref_id = imagerefid
    And set jsonPayload.product_options[0].images[1].ref_id = imagerefid
    * call read('Storeapi.feature')
    When method Post
    Then status 200
    And print response
    * def unique_item_code = response.data.list[0].code
    And print unique_item_code
    And match response.data.list[0].name == image_n+"-Name" 
    And match response.data.list[0].product_record_code == image_n+"-Code" 
    And match response.data.list[0].image_ref_id == imagerefid
    And match response == jsonResponse
    
    
    
 
 