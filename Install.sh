#!/bin/bash

kubectl apply -f yamls/namespaces.yaml
kubectl apply -f yamls/secret.yaml
kubectl apply -f yamls/pvc.yaml
kubectl apply -f yamls/database-deployment.yaml
kubectl apply -f yamls/database-versions-deployment.yaml


# Set DB service and TCP service IPs to API the deployment

dbHost=$(kubectl get services/mssqlsvc --namespace database -o jsonpath='{.spec.clusterIP}')
tcpHost=$(kubectl get services/database-versions-svc --namespace database-versions -o jsonpath='{.spec.clusterIP}')

filename="yamls/api-deployment.yaml"
filenameCopy="yamls/api-deployment-copy.yaml"

dbSearch="{DB_HOST}"
tcpSearch="{TCP_HOST}"


rm $filenameCopy

cp $filename $filenameCopy

perl -i -pe "s/$dbSearch/$dbHost/g" ./$filenameCopy
perl -i -pe "s/$tcpSearch/$tcpHost/g" ./$filenameCopy

kubectl apply -f yamls/api-deployment-copy.yaml

rm $filenameCopy
