#!/bin/bash

# install Golf Fields API pod and expose it

dbHost=$(kubectl get services/mssqlsvc --namespace database -o jsonpath='{.spec.clusterIP}')
tcpHost=$(kubectl get services/database-versions-svc --namespace database-versions -o jsonpath='{.spec.clusterIP}')

filename="yamls/golf-fields-api-deployment.yaml"
filenameCopy="yamls/golf-fields-api-deployment-copy.yaml"

dbSearch="{DB_HOST}"
tcpSearch="{TCP_HOST}"


rm $filenameCopy

cp $filename $filenameCopy

perl -i -pe "s/$dbSearch/$dbHost/g" ./$filenameCopy
perl -i -pe "s/$tcpSearch/$tcpHost/g" ./$filenameCopy

kubectl apply -f yamls/golf-fields-api-deployment-copy.yaml

rm $filenameCopy