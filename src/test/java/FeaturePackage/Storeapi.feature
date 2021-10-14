#Background:
 #* def loginfile = call read('StudioLogin.feature')
 #* def access_token1 = loginfile.access_token
 #* header Authorization = 'Bearer '+access_token1
 #* def headers = {Content-Type : 'application/json', Accept : 'application/json', Authorization : 'Bearer '+access_token1}
 #* def file_p = 'C://Users//karti//eclipse//Karate//src//test//java//TestData//Love-That-Design-Florya-Ihlamur-Apartments-1.jpg'
 #* def imagedata = Java.type('FeaturePackage.ImageUpload')
 #* def imagerefid = imagedata.Ref_id_Generation(file_p)
 #* def filesize = imagedata.File_Size(file_p)
 #* def filename = imagedata.File_name(file_p)


Feature: Create store record

Scenario: Create store record

Given url 'https://images.api.spec.lovethat.design/test-designer/store'
* def jsonPayload = {"id": '#(imagerefid)',"name": '#(filename)',"size": '#(filesize)',"type": "image/jpeg", "resource_type": "images"}
#When request  {"id": imagerefid,"name": filename,"size": filesize,"type": "image/jpeg", "resource_type": "images"}
#And print jsonPayload
When request jsonPayload
And header Authorization = 'Bearer '+access_token1

And method POST
Then print response
And print response.upload_token
* def readtus = Java.type('FeaturePackage.ImageUpload')
* def tus_image_upload = readtus.call_Tus(response.upload_token, access_token1,file_p)


