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
        
# cold start warm up issue (agar endpoint respond nhi kr ra hai)
    Run in terminal
    ----------------
    curl http://20.204.187.67/api/test
    
# rollback previous deployment
     helm rollback interviewapp
     
# check diployment hostory with app version
    helm history interviewapp
    
# rollback any deployment by version
    helm rollback interviewapp  1.16.0
    
# get pods by env name when on namespaces
    kubectl get pods -n dev
    kubectl get pods -n staging
    kubectl get pods -n uat
    kubectl get pods -n prod
    
# set any env as default then all command will work related to env
    kubectl config set-context --current --namespace=dev
    
    
    
# ingress
    1. install ingress on AKS cluster for all environments 
    
        this command will execute only once
        --------------------------------------
            helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
            
            helm repo update
            
            helm install nginx ingress-nginx/ingress-nginx \
              --namespace ingress-nginx \
              --create-namespace
              
            kubectl get pods -n ingress-nginx
            
            expected
            ---------
            nginx-ingress-controller-xxxxx   Running
            
            get ip address of particular env
            --------------------------------
            kubectl get svc -n ingress-nginx
              
             
        

        
```