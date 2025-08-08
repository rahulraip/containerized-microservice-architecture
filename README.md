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

📂 user-service  <br>
This folder contains the main application code along with its Dockerfile for creating the container image.

Main Script: app.py
- Handles user registration and stores user information in a PostgreSQL database.
- Docker Support: Ready-to-build image using the provided Dockerfile.
- requirements.txt – Lists the Python dependencies required inside the container.

📂 data-service <br>
This folder contains:
- app.py – Responsible for reading user data from the Redis database on the first request for caching purposes.
- Dockerfile – Used to build the Docker image for this service.
- requirements.txt – Lists the Python dependencies required inside the container.

## 📄 Docker Compose Setup

`docker-compose.yml` file defines the multi-container setup for the project:
- user-service – Flask-based microservice connecting to PostgreSQL
- data-service – Flask-based microservice connecting to Redis and PostgreSQL
- postgres – PostgreSQL database with initialization script (init.sql)
- redis – In-memory cache database

__Persistent Storage:__
PostgreSQL data is stored in a named volume pgdata.

To run the setup:

`docker-compose up --build`

To stop services:

`docker-compose down`

To remove all containers & volumes:

`docker-compose down -v`

## Screenshots for reference

__Running the Setup__


<img width="1920" height="1020" alt="Screenshot 2025-07-28 231724" src="https://github.com/user-attachments/assets/e103c830-f3f2-437f-8cb7-ab8ecbdd2b08" />
---
<img width="1920" height="1020" alt="Screenshot 2025-07-28 232246" src="https://github.com/user-attachments/assets/f21dbfb9-85e3-4e5d-a17a-0968ea1827ad" />
---
<img width="1920" height="1020" alt="Screenshot 2025-07-28 232309" src="https://github.com/user-attachments/assets/c97a401b-1c5e-415c-87b8-a4ba86a01dc0" />
---
<img width="1920" height="1020" alt="Screenshot 2025-07-28 232327" src="https://github.com/user-attachments/assets/b3e8ecf6-1bd1-4b23-b884-9fa29c3c1aa5" />
---
<img width="1181" height="378" alt="Screenshot 2025-07-28 232344" src="https://github.com/user-attachments/assets/028821b0-cc9b-443f-a3b5-49412b9b6f0d" />



__Lists Running Containers__

<img width="1919" height="673" alt="Screenshot 2025-07-29 114437" src="https://github.com/user-attachments/assets/90ad41ee-48be-4469-9c26-6d067e004f67" />

__Registering the User through CLI with curl command__

<img width="1920" height="1020" alt="Screenshot 2025-07-31 154755" src="https://github.com/user-attachments/assets/85ae4cbd-c106-4f72-b4bc-12c3162fed3b" />

Notice that the 1st curl command hits on the register user app (port: 5000) that will register the user and store it in postgresql database.
And the 2nd curl command connects to the different app (port: 5001) for fetching the details.

- Important thing is; as redis db which is a caching database is also integrated, so when user fetches his data for the first time, the program checks first on the redis database.
- If not found then only it goes to postgresql. This concept is called as 'miss' in the world of caching.
- SEE: `cached:"false"`
- But next time the data loads on redis db base (in-memory), so the accessing speed of the data will be very fast.
- SEE: `cached:"true"`

## CONCLUSION:

This setup not only improves performance but also illustrates the real-world use of caching in distributed applications.

