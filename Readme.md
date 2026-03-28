```

# command for generating secrets for "AZURE_CREDENTIALS" github key, run in azure bash terminal

az ad sp create-for-rbac \
  --name "interview-app-github-workflow" \
  --role Contributor \
  --scopes /subscriptions/1a0bfbdb-b9d1-4d8e-8997-f14060057ae5\
  --sdk-auth
  
# AKS cluster node 
    search and set node as min 2, max 3
    D2ds_v4
    
# go to container registry and access control(IAM), add role, select member as kubernetes cluster by selecting manual radio btn.

# azure login from laptop
    az login
    
    
# helm start from here
    1. install 
        helm create helm/interview-app
    
    output
    ------
        helm/interview-app/
      ├── templates/
      ├── values.yaml
      ├── Chart.yaml
    
    2. clean if already exist
        rm -rf helm/interview-app/templates/*

    3. test
        helm template interviewapp ./helm/interview-app
    4. deploy
        helm upgrade --install interviewapp ./helm/interview-app
        
```