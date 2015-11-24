# Node.js Container Engine Walkthrough

Set project as variable to avoid re-typing:

export PROJECT_ID=jd-node-test

## Create Docker image
docker build -t gcr.io/${PROJECT_ID}/hello-node .

## Push image to Google Container Registry
gcloud docker push gcr.io/${PROJECT_ID}/hello-node

## Create cluster
gcloud container clusters create hello-world --num-nodes 1 --machine-type g1-small

gcloud compute instances list

## Create pod
kubectl run hello-node --image=gcr.io/${PROJECT_ID}/hello-node --port=8080

## Allow external traffic
kubectl expose rc hello-node --type="LoadBalancer"

kubectl get services hello-node

## Scale up
kubectl scale rc hello-node --replicas=3

## Cleanup
### Services
kubectl delete services hello-node

### Pods
kubectl delete rc hello-node

### Cluster
gcloud container clusters delete hello-world
