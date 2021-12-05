#!/bin/bash

# Set the kubectl context
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
kubectl apply -f dashboard-adminuser.yaml 
kubectl apply -f cluster-role-binding.yaml
