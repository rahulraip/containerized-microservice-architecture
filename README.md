# 🐳 containerized-microservice-architecture

> 📌 Designed and implemented a microservices architecture using Docker containers.
> It demonstrates the impact of caching in distributed systems and streamlined deployments using Docker Compose for consistent, scalable environments.

🛠️ __Tech Stack__ 
1. Docker
2. Docker Compose
3. Flask
4. Redis
5. PostgreSQL

✅ __Implementation Steps__

1. Break monolithic app into microservices
2. Create Docker images for each service
3. Set up inter-service communication
4. Implement Redis for caching
5. Configure PostgreSQL database
6. Use Docker Compose for orchestration

## Project Structure

📂 user-service  (_1st Microservice_) <br>
This folder contains the main application code along with its Dockerfile for creating the container image.

Main Script: app.py
- Handles user registration and stores user information in a PostgreSQL database.
- Docker Support: Ready-to-build image using the provided Dockerfile.
- requirements.txt – Lists the Python dependencies required inside the container.

📂 data-service (_2nd Microservice_) <br>
This folder contains:
- app.py – Responsible for reading user data from the Redis database on the first request for caching purposes.
- Dockerfile – Used to build the Docker image for this service.
- requirements.txt – Lists the Python dependencies required inside the container.
