Feature: Create package item

  Background: 
    * url baseUrl
    * def loginfile = call read('StudioLogin.feature')
    * def access_token1 = loginfile.access_token
    * header Authorization = 'Bearer '+access_token1
    * def req_header = {Content-Type : 'application/json', Accept : 'application/json'}
    * def pathUrl = 'projects/packages/karate-api-testing-package/package-items'
    * def jsonPayload = read('C://Users//karti//eclipse//Karate//RequestPayload//Create_package_item.json')
    * def jsonResponse = read('C://Users//karti//eclipse//Karate//ResponsePayload//Create_package_item.json')
    #* def file_p = 'C://Users//karti//eclipse//Karate//src//test//java//TestData//Love-That-Design-Florya-Ihlamur-Apartments-1.jpg'
    * def RandomCharacter = Java.type('FeaturePackage.RandomCharacter')
    * def pname = RandomCharacter.random_Characters()
    * def image_n = "K1-"+pname
    * def image_name = Java.type('FeaturePackage.ImageCreation').create_Image(image_n)
    * def file_p = 'C://Users//karti//eclipse//Karate//src//test//java//TestData//Images//'+image_n+'.jpg'
 
    * def imagedata = Java.type('FeaturePackage.ImageUpload')
    * def imagerefid = imagedata.Ref_id_Generation(file_p)
    * def filename = imagedata.File_name(file_p)
    * def filesize = imagedata.File_Size(file_p)
    

  @tag1
  Scenario: Create package item with only image
    Given path pathUrl
    And params {force:false,view:sections}
    And request jsonPayload
    And set jsonPayload.package_item.name = pname+'name'
    And set jsonPayload.package_item.product_record_code = pname+'code'
    And print 'File name is', filename
    And set jsonPayload.product_options[0].featured_image.name = filename
    And set jsonPayload.product_options[0].featured_image.ref_id = imagerefid
    And set jsonPayload.product_options[0].images[0].ref_id = imagerefid
    And set jsonPayload.product_options[0].images[1].ref_id = imagerefid
    * call read('Storeapi.feature') 
    And print request
    When method POST
    Then status 200
    And print response
    * def res = response
    And print  res.data.list[0].name
    And print  res.data.list[0].product_record_code
    And match res.data.list[0].name == pname+'name'
    And match res.data.list[0].product_record_code == pname+'code'
