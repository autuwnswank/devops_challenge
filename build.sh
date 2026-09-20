#!/bin/bash
sudo apt update && upgrade -y;
sudo apt install kind;
sudo snap install kubectl;
kind create cluster --name nginx-cluster;
kubectl create namespace nginx-cluster;
docker build -t helloworld-js:v1 .;
docker build -t nginx-proxy:v1 nginx/;
kind load docker-image helloworld-js:v1 --name nginx-cluster;
kind load docker-image nginx-proxy:v1 --name nginx-cluster;
kubectl apply -f app-deployment.yaml;
kubectl apply -f nginx-deployment.yaml;

