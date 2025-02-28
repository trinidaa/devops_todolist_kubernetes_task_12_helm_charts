#!/bin/bash

kind create cluster --config ./cluster.yml
kubectl label nodes kind-worker kind-worker2 app=mysql
kubectl taint nodes kind-worker kind-worker2 app=mysql:NoSchedule
helm dependency build ./helm-chart/todoapp/
helm install todoapp ./helm-chart/todoapp --debug
kubectl get pods -A -o wide
helm list
helm dependency list ./helm-chart/todoapp/
