#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Missing param: cluster-name"
fi

# Set the kubectl context
aws eks --region "us-west-2" update-kubeconfig --name $1

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
kubectl apply -f dashboard-adminuser.yaml 
kubectl apply -f cluster-role-binding.yaml

./get-dashboard-token.sh

kubectl proxy