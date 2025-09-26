# 🐳 Docker Basics

A beginner-friendly guide to help you **understand Docker concepts** and practice its **basic commands** directly in your browser.

---

## 📖 Table of Contents
1. [What is Docker?](#what-is-docker)
2. [Key Concepts](#key-concepts)
3. [Playground Environment](#playground-environment)
4. [Basic Commands](#basic-commands)
5. [Useful Tips](#useful-tips)
6. [Resources](#resources)

---

## What is Docker?
Docker is an **open-source platform** that lets you **build, package, and run applications inside containers**.  
Containers are lightweight, portable units that include everything needed to run an application.

Key benefits:
- Consistency across environments  
- Faster development & deployment  
- Easy scaling with orchestration tools (like Kubernetes)

---

## Key Concepts
| Concept       | Description                                           |
|---------------|-------------------------------------------------------|
| **Image**    | A read-only template that defines the container’s content (OS, libraries, app code). |
| **Container**| A running instance of an image.                        |
| **Dockerfile**| A text file with instructions to build an image.      |

---

## Playground Environment
No installation required!  
Practice Docker directly in your browser using the **KillerCoda Docker Playground**:

👉 [**Start the Playground**](https://labs.play-with-docker.com/)

This provides a Linux environment with Docker pre-installed so you can run commands right away.

---

## Basic Commands

### Version & Info
```bash
docker --version             # Check installed Docker version
docker info                  # Detailed system-wide info
```

### Working with Images
```bash
docker pull nginx            # Download an image from Docker Hub
docker images                # List all images
docker rmi <image_id>        # Remove an image
```

### Running Containers
```bash
docker run hello-world                 # Run a test container
docker run -it ubuntu bash             # Run an Ubuntu container interactively
docker run -d -p 8080:80 nginx         # Run nginx in detached mode with port mapping
docker ps                               # List running containers
docker ps -a                            # List all containers (including stopped)
docker stop <container_id>              # Stop a running container
docker rm <container_id>                # Remove a container
```

### Building Images
Build an image from a Dockerfile in the current directory
```bash
docker build -t myapp:latest .
```

### Useful Tips

Remove Unused Data:
```bash
docker system prune
```


### Logs & Exec:
```bash
docker logs <container_id>            # View container logs
docker exec -it <container_id> sh     # Execute a shell inside a running container
```

Tagging: Always tag your images (myapp:1.0) for better version control.
