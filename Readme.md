```aiignore

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

```