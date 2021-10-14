function fn() 
{    
 
  var env = karate.env;
  karate.log('Environment variable is',env);
  
  var config = {
    baseUrl: 'https://designer.api.spec.lovethat.design/api/designer/v1.0/',
    token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXV0aC5hcGkuc3BlYy5sb3ZldGhhdC5kZXNpZ25cL2FwaVwvbG9naW4iLCJpYXQiOjE2MzIwNDE3NTAsImV4cCI6MTYzMjIxNDU1MCwibmJmIjoxNjMyMDQxNzUwLCJqdGkiOiJzY293NFMwYVA4NDFiZEtVIiwic3ViIjoxMDcsInBydiI6ImY4MzhiOTUwOWFhZjk0YzMzODZmNjc5Zjg5MjljZGM3NjdjNzBmMmYiLCJ1c2VyX2NhY2hlX2tleSI6ImV5SnBkaUk2SWtkV1JrNU9URU14Y1ZjMlNqbEJiVEJHVFRjNWVIYzlQU0lzSW5aaGJIVmxJam9pVHpkVFhDOWpUMXB6VTJnMVpYUmpPR2xtWlVsSVhDOXpiMkZSVms0ME9VWjRjVVJzZW1ad2VGUXhiemsxVEVNMVRVTktjM05NV2xOeU5FOXVRMFJvY210Y0x5SXNJbTFoWXlJNklqZ3hZelZtTkRjNE9UTmlZamN3TkRFM09UY3lNRGhpT0RobE9HSmtPVFU0T1dFME5qTXdNekpoT0dRMU5XWXdORGMwWVRWaVkySmxaVGhpWm1GbE5EY2lmUT09IiwiY29tcGFueV9hY2NvdW50X2NvZGUiOiJleUpwZGlJNklrOU1ZMkoxVUV0NU5sWTVRWHBvZVVKbFUyMVNWMmM5UFNJc0luWmhiSFZsSWpvaU5IQm5WMjF2VDJGbVR6SlpXbVJwWmtWeFV6aEZja2Q2U1ZCUldVSmxXalpoY1dNNVpucFhPSEJsVlQwaUxDSnRZV01pT2lKalltWmxNVEEyTWpNek9HRmtPR1k1TjJZNU56bGhZV0l5TXpBd01tSTVPREZpTXpoa1l6RXhOVGsyTVRSalpUSXdOamt5TldFeE1qQTBNV1JrTnpsakluMD0ifQ.L1WL2SQ5bodKMcR1suUFF1E0H9jL_B-foGKufZNtNGo',
    
  }
  
  if(env=='dev')
  {
  config.baseUrl='devserver.url';
  }
  else if(env=='qa')
  {
   config.baseUrl='qaserver.url';
  }
  
  
  karate.log('karate.env =', karate.env);
  karate.log('config.baseUrl =', config.baseUrl);
  karate.log('config.token =', config.token);
  
  return config
  }