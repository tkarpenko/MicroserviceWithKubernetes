#!/bin/bash

minikube start 


kubectl apply -f yamls/namespaces.yaml
kubectl apply -f yamls/secret.yaml
kubectl apply -f yamls/pvc.yaml
kubectl apply -f yamls/database-deployment.yaml
kubectl apply -f yamls/database-versions-deployment.yaml

