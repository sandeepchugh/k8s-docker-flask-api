# k8s-docker-flask-api
Flask web app hosted in docker and kubernates

## Docker
### Installation
https://www.docker.com/products/kubernetes

### Build docker image
```bash
docker build -t web-app:1.0 .
```

Run the docker image to test locally
```bash
docker run -d -p 5000:5000 --name flask-app-test flask-app
```


## Deploy to Kubernetes
```bash
kubectl apply -f webapp-deployment.yaml
```

## Port forwarding
Get Replicaset
```bash
kubectl get replicaset -o wide
```

Get pods
```bash
kubectl get pods -o wide
```
The pod details include an IP address. The pod is accessible to the internal network 
using this IP address. To expose the pods externally, apply port-forwarding to the pod

> kubectl port-forward pod name Internal Port:External Port 
```bash
kubectl port-forward webapp-deployment-97d4f9849-sflw7 5000:5000
```

Since pods are created and destroyed, accessing a pod is not ideal. 
Instead a service should be setup and a loadbalancer configured to access the service
```bash
kubectl apply -f webapp-service.yaml
kubectl apply -f webapp-service-loadbalancer.yaml
```
Describe the service
```bash
kubectl describe service webservice
```

Access the app using the url http://localhost:8080/