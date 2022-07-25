#!/bin/sh

kubectl delete deployments/golf-fields-api --namespace golf-fields-api
kubectl delete services/golf-fields-api-service --namespace golf-fields-api