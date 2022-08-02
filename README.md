# Microservice with Kubernetes

Yaml files in the repository will setup a minikube and pods of the microservice application with the following structure:

* Web UI (React+Redux)
* Web Api (.NET 6)
* Database Versions app (.NET 6)
* Database (Microsoft SQL Server)

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/Microservice.jpg)


Source code of pods and packages:
* Web UI - https://github.com/tkarpenko/golf-fields-ui
* Web Api - https://github.com/tkarpenko/GolfFieldsApi
* Database versions - https://github.com/tkarpenko/DatabaseVersions
* TcpCommunicationTest package - https://github.com/tkarpenko/TcpLib


## Run it locally

To enrich API endpoints do the following:
* Install docker on your machine

* ```> git clone https://github.com/tkarpenko/MicroserviceWithKubernetes.git```

* ```> cd MicroserviceWithKubernetes```

* Run ```> sh Install-part-1.sh```

* Check database and database-versions pods and wait the `Running` status

```> kubectl get pods --namespace database```

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/db-pod.jpg)

```> kubectl get pods --namespace database-versions```

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/db-v-pod.jpg)

* Run ```> sh Install-part-2.sh```

* Check Web API pod and wait the `Running` status

```> kubectl get pods --namespace golf-fields-api```

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/api-pod.jpg)

* Run ```> sh Install-part-3.sh```

* Check Web API pod and wait the `Running` status
```> kubectl get pods --namespace golf-fields-ui```

* Run
```> kubectl port-forward service/golf-fields-api-service --namespace golf-fields-api 5000:5000```

* Open new tab in terminal and run
```> kubectl port-forward service/golf-fields-ui-service --namespace golf-fields-ui 3000:80```

* Open in any browser the address http://localhost:3000
![localhost](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/localhost.jpg)


* Open Postman

* do POST request to `http://localhost:5000/api/v1.0/User/Auth` with the payload `{"phone": "+380633333333"}`

![postman](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/postman1.jpg)

![postman](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/docs/postman2.jpg)
