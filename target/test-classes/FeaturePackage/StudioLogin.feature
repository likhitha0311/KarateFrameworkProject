Feature: Get access token for Studio Login

Background:
* url 'https://auth.api.spec.lovethat.design/api/login'


Scenario: Get Bearer Token

And request {"username":"likhitha@28lightbulbs.com","password":"28lightbulbs","account_code":"garfunkel","application_module":"web-ui-designer","batch_id":"64b57fbc63bba6402768e136b5e3f613bff7","token_b":null}
 When method POST
 Then status 200
 * def access_token = response.data.user.token
 And print access_token