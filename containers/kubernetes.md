# Kubernetes

## List kubenetes clusters

```
 kubectl config get-contexts 
```

## Select a kubernetes cluster

```
 kubectl config use-context context1 
```

## Show namespaces

```
 kubectl get namespaces 
```

## Select cluster and namespace

```
 kubectl config set-context context1 --namespace="namespace1" 
```

## List nodes

```
 kubectl get nodes 
```

## List pods

```
 kubectl get pods 
```

## List pods verbose

```
 kubectl get pods --namespace='namespace1' -o wide
```

## List pods in all namespace 
```
kubectl get pods --all-namespaces
```

## Dump logs from a pod

```
 kubectl logs pod1-v001-mn6xn 
```

## Delete a pod with app label

```
 kubectl --context=context1 --namespace=namespace1 delete pods -l app=label1
```

## Delete a pod by pod name

```
 kubectl --context=context1 --namespace=namespace1 delete pods pod1-v008-qhmpn 
```

## Describe a pod

```
 kubectl describe pods pod1-j4524 --context=context1 --namespace=namespace1
```

## Show pod activity

```
 kubectl --namespace=namespace1 top pod pod1-86d477fb9b-4wqgp
```

## Execute command in pod

```
 kubectl --namespace=namespace1 top pod pod1-86d477fb9b-4wqgp
```

## Execute command in pod

```
 kubectl exec my-pod -- ls /
```

## Drain a node

```
 kubectl drain my-node
```

## Show metrics

```
 kubectl top node my-node
```

## Describe a node

```
 kubectl -n namespace1 describe node ip-10-10-142-47.us-west-2.compute.internal
```

## Describe a node

```
 kubectl describe nodes my-node
```

## Get all services

```
 kubectl get services
```

## Get events

```
 kubectl get events --sort-by=.metadata.creationTimestamp
```

## Get a bash terminal

```
 kubectl exec -it shell-demo -- /bin/bash
```

## Show all labels for pods

```
 kubectl --namespace='namespace1' get pods -l stack=timerestriction --show-labels
```

## Get nodes in json format

```
 kubectl get nodes -o json
```

## Search for hosts

```
 kubectl get nodes -o json | jq '.items[] | "\(.metadata.name) \(.metadata.labels."node-role") \(.spec.externalID)"' | grep 73da
```

## Show services

```
 kubectl -n namespace1 get svc
```

## Scale up pods

```
 kubectl -n namespace1 deployment deployment1 --replicas=20
```
