# minikube-blue-green-app
Sample application with minikube and terraform

# Pre-requisites to be installed
Virutal Box
Minikube
kubectl

Run minikube via below command:
minikube start --driver=virtualbox

# Approach 1 (Without Terraform)

Associated Files: 
a) blue-app-deployments.yaml
b) green-app-deployments.yaml
c) app-ingress.yaml


Create Deployment:
kubectl apply -f blue-app-deployments.yaml
kubectl apply -f green-app-deployments.yaml

Expose Deployment:
kubectl expose deployment blue-app --type=NodePort --port=8080
kubectl expose deployment green-app --type=NodePort --port=8081

Enable Ingress:
minikube addons enable ingress
kubectl get pods -n ingress-nginx

To get the url of the app:
minikube service blue-app --url
minikube service green-app --url

Create Ingress:
kubectl apply -f app-ingress.yaml
kubectl get ingress --all-namespace

add the ingres ip in c:/windows/system32/drivers/etc/host
192.168.59.101	blue-green.info

Hit request to : http://blue-green.info/

Reference Documents:
https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/
https://docs.nginx.com/nginx-service-mesh/tutorials/trafficsplit-deployments/

-------------------------------------
# Approach 2 (With Terraform)

Associated Files:
a) applications.json
b) main.tf

