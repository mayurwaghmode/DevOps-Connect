# 🐳 Kubernetes Basics

A simple guide to help beginners **understand Kubernetes concepts** and learn its **basic commands**.

---

## 📖 Table of Contents
1. [What is Kubernetes?](#what-is-kubernetes)
2. [Key Components](#key-components)
3. [Playground Environment](#playground-environment)
4. [Basic Commands](#basic-commands)
5. [Useful Tips](#useful-tips)
6. [Resources](#resources)

---

## What is Kubernetes?
Kubernetes (often abbreviated as **K8s**) is an **open-source container orchestration platform** that automates:
- Deployment  
- Scaling  
- Management of containerized applications  

Think of it as the **“operating system” for your container workloads**.

---

## Key Components
| Component      | Description                                               |
|----------------|-----------------------------------------------------------|
| **Pod**       | Smallest deployable unit that can run one or more containers |
| **Node**      | A worker machine where pods run                            |
| **Cluster**   | A set of nodes managed by Kubernetes                        |
| **Deployment**| Declarative way to manage replica pods                      |
| **Service**   | Exposes a set of pods as a network service                  |
| **ConfigMap & Secret** | Store configuration data and sensitive information |

---

## Playground Environment
No local installation required!  
Use the **KillerCoda Kubernetes Playground** to practice directly in your browser:

👉 [**Start the Playground**](https://killercoda.com/playgrounds/scenario/kubernetes)

It launches a ready-to-use Kubernetes cluster with `kubectl` pre-installed.

---

## Basic Commands

### Cluster Info
```bash
kubectl version               # Check client & server versions
kubectl cluster-info          # Show cluster master & services
kubectl get nodes             # List all nodes
```
### Work with Pods
```bash
kubectl get pods              # List pods in current namespace
kubectl describe pod <pod>    # Detailed info about a pod
kubectl logs <pod>            # View logs from a pod
kubectl exec -it <pod> -- /bin/sh  # Access pod shell
```

### Deployments
```bash
kubectl create deployment myapp --image=nginx   # Create a deployment
kubectl get deployments                        # List deployments
kubectl scale deployment myapp --replicas=3     # Scale to 3 replicas
kubectl rollout status deployment/myapp         # Check rollout
kubectl delete deployment myapp                 # Delete deployment
```

### Services
```bash
kubectl expose deployment myapp --type=NodePort --port=80   # Expose app
kubectl get svc                                             # List services
```

###Namespaces
```bash
kubectl get namespaces
kubectl create namespace dev
kubectl config set-context --current --namespace=dev
```
