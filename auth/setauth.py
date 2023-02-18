import json

auth = { 
        "okta": { 
            "credentialsenvvar": "OKTA_SECRET_KEY",  
            "type": "api_key",
            "valuePrefix": "SSWS " 
        },
        "google": { 
            "credentialsfilepath": "/stackql/.keys/stackql-security-reviewer.json",  
            "type": "service_account" 
        },
       }

print(json.dumps(auth))