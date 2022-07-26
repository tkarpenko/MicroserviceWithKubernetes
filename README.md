# Microservice with Kubernetes

The command

```sh Install.sh```

will setup a minikube and pods of the microservice application with the following structure:

* Database (Microsoft SQL Server)
* .NET 6 Web Api app
* Database Versions app (the app sending to Web Api app *.sql files with database updates)

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/Microservice.jpg)


Source code of pods and packages:
* .NET 6 Web Api - https://github.com/tkarpenko/GolfFieldsApi
* Database versions - https://github.com/tkarpenko/DatabaseVersions
* TcpCommunicationTest package - https://github.com/tkarpenko/TcpLib


##Run it locally

To enrich API endpoints do the following:
* Install docker on your machine
* ```> git clone https://github.com/tkarpenko/MicroserviceWithKubernetes.git```
* ```> cd MicroserviceWithKubernetes```
* Run 
```> sh Install-part-1.sh```
* Check database and database-versions pods and wait the `Running` status
```> kubectl get pods --namespace database```
```> kubectl get pods --namespace database-versions```
* Run 
```> sh Install-part-2.sh```

* Check Web API pod and wait the `Running` status
```> kubectl get pods --namespace golf-fields-api```
* Run
```> kubectl port-forward service/golf-fields-api-service --namespace golf-fields-api 5000:5000```
* open Postman
* do POST request to `http://localhost:5000/api/v1.0/User/Auth`
![postman](https://github.com/tkarpenko/GolfFieldsApi/blob/main/docs/postman1.jpg)
![postman](https://github.com/tkarpenko/GolfFieldsApi/blob/main/docs/postman2.jpg)
