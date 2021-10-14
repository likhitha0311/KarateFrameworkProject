@ignore


#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@tag
Feature: Get all your projects

  Background:
  * header Authorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXV0aC5hcGkuc3BlYy5sb3ZldGhhdC5kZXNpZ25cL2FwaVwvbG9naW4iLCJpYXQiOjE2MzA0MDAxNzgsImV4cCI6MTYzMDU3Mjk3OCwibmJmIjoxNjMwNDAwMTc4LCJqdGkiOiI2dVR5UURPY3pNNGxCeEdkIiwic3ViIjoxMDcsInBydiI6ImY4MzhiOTUwOWFhZjk0YzMzODZmNjc5Zjg5MjljZGM3NjdjNzBmMmYiLCJ1c2VyX2NhY2hlX2tleSI6ImV5SnBkaUk2SW05U05qa3lOMDVQTlRCNFZYWXlSMnRtZGtRclpFRTlQU0lzSW5aaGJIVmxJam9pVUVkSFdWWjFSWEJ4WWtsa2VtaFVRMVJYUmtGcGVHYzFTa0V5WWpRMVJVWktWa1JyY3pGTVVFdEhLMDFhTkc0MGJsQkdhRXBSTTJwVVIwMXFaVEZGTmlJc0ltMWhZeUk2SW1WbE1tUm1aamxrTWpjd05tVXpaR1k1TURsaVltVTVNRGt3T0RnNU56bGhNR00yWWpVMk1qUTJOekUyWkdZNU1URmhaVGRpTkdZeFpqWTFaR1F3TXpNaWZRPT0iLCJjb21wYW55X2FjY291bnRfY29kZSI6ImV5SnBkaUk2SW1oQllYUm5kWGRjTDJOblZuWndXVWxFYVd0SmFWcEJQVDBpTENKMllXeDFaU0k2SWxwVmRWUnFSSHBtWEM5VVUwZHNlVTFVVDJjNFpqaEhRVEIyVlRFNGRYbGtXamxYVWpoQlpGQldVV1ozUFNJc0ltMWhZeUk2SWpNNU5XUm1NR05tWVdFME5EZGhZelZoWTJaaE5EUm1aRGMwWTJVMk1EaGtaV1l6TW1ReE9XRmlORFZqTm1WbU5EYzFaVEkxWkdKaVlUVmpOekpqWlRNaWZRPT0ifQ.3aeqwZtm5gq1WeGKUK7zxHAR3IjPq9y2Fb3_ZKM-B1Q' 
 
  @tag1
  Scenario: Get all studio projects list
    Given url 'https://designer.api.spec.lovethat.design/api/designer/v1.0/projects/filter?page_no=1&page_size=5&sort_by=&country_code=&city=&states=&zip_codes=&user_code=&start_date=&stage_code=&search=&customer=&contact=&estimated_value=&estimated_hours=&activity_hours=&tag=&groups=&project_types=&project_code=&isFilterEnabled=true&flag_codes='
   
    When method get
  
    Then status 200
   

 
