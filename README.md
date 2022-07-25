# Microservice with Kubernetes

Docker pre installed is required to run it locally.

The command

```sh Install.sh```

will setup a minikube and pods of the microservice application with the following structure:

* Database (Microsoft SQL Server)
* Database Versions app (the app sending to Web Api app *.sql files with database updates)
* .NET 6 Web Api app

![Microservice app](https://github.com/tkarpenko/MicroserviceWithKubernetes/blob/main/Microservice.jpg)

Source code of pods:
* Database versions - https://github.com/tkarpenko/DatabaseVersions
* .NET 6 Web Api - https://github.com/tkarpenko/GolfFieldsApi
* TcpLib package - https://github.com/tkarpenko/TcpLib