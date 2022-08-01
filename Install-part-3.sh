#!/bin/bash

# install Golf Fields UI pod and expose it

# apiHost=$(kubectl get services/golf-fields-api-service --namespace golf-fields-api -o jsonpath='{.spec.clusterIP}')

filename="yamls/golf-fields-ui-deployment.yaml"
filenameCopy="yamls/golf-fields-ui-deployment-copy.yaml"

# apiSearch="{API_HOST}"
verSearch="{API_VERSION}"
timestampSearch="{TIMESTAMP}"

timestamp=$(date +%s)

rm $filenameCopy

cp $filename $filenameCopy

# perl -i -pe "s/$apiSearch/$apiHost/g" ./$filenameCopy
perl -i -pe "s/$verSearch/v1.0/g" ./$filenameCopy
perl -i -pe "s/$timestampSearch/$timestamp/g" ./$filenameCopy

kubectl apply -f yamls/golf-fields-ui-deployment-copy.yaml

# kubectl port-forward service/golf-fields-api-service --namespace golf-fields-api 5000:5000
# kubectl port-forward service/golf-fields-ui-service --namespace golf-fields-ui 8080:80


rm $filenameCopy