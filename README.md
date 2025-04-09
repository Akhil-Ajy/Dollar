# MEAN Stack Docker Application with CI/CD

This project demonstrates a complete DevOps setup for a MEAN stack application (MongoDB, Express.js, Angular, Node.js) using Docker containers, CI/CD pipeline, and deployment to a cloud VM.

## Application Overview

The application is a simple CRUD (Create, Read, Update, Delete) system for managing tutorials. Users can:
- Create new tutorials with title, description, and published status
- View a list of all tutorials
- Search for tutorials by title
- Update tutorial information
- Delete tutorials

## Tech Stack

- **Frontend**: Angular 15
- **Backend**: Node.js with Express
- **Database**: MongoDB
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions
- **Reverse Proxy**: Nginx
- **Cloud**: VM on AWS/Azure/GCP

## Architecture

The application consists of three main components:

1. **Frontend** - Angular application served via Nginx
2. **Backend** - Node.js API service 
3. **Database** - MongoDB for data storage

## Local Development Setup

### Prerequisites
- Node.js (v16+)
- Docker and Docker Compose

### Running Locally Without Docker

**Backend:**
```
cd backend
npm install
node server.js
```

**Frontend:**
```
cd frontend
npm install
ng serve --port 8081
```

### Running Locally With Docker

```
docker-compose up -d
```

Access the application at: http://localhost

## Deployment Architecture

The application is deployed using the following architecture:

1. GitHub repository hosts the code
2. GitHub Actions pipeline builds and pushes Docker images on code changes
3. Docker Hub stores the Docker images
4. Ubuntu VM on cloud provider runs the containerized application
5. Nginx serves as a reverse proxy, routing requests to appropriate services

## CI/CD Pipeline

The CI/CD pipeline is implemented using GitHub Actions and consists of the following steps:

1. Trigger on push to the main branch
2. Build the Docker images for frontend and backend
3. Push images to Docker Hub
4. SSH into the VM and deploy the latest images

### Setting Up GitHub Secrets

The following secrets need to be set in the GitHub repository:

- `DOCKERHUB_USERNAME`: Docker Hub username
- `DOCKERHUB_TOKEN`: Docker Hub access token
- `VM_HOST`: IP address of your VM
- `VM_USERNAME`: Username for VM SSH access
- `VM_SSH_KEY`: Private SSH key for VM access

## VM Setup Instructions

1. Create an Ubuntu VM on your preferred cloud provider (AWS, Azure, GCP)
2. Ensure port 80 is allowed in the security group/firewall
3. SSH into the VM
4. Run the deployment script:

```
curl -o deploy.sh https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/deploy.sh
chmod +x deploy.sh
./deploy.sh
```

The script will:
- Install Docker and Docker Compose
- Set up necessary directories
- Deploy the application

## Screenshots

[Include screenshots here]

## Testing the Application

After deploying, you can access the application at: http://YOUR_VM_IP

## Troubleshooting

### Common Issues

1. **Application not accessible**
   - Check if all containers are running: `docker-compose ps`
   - Check the logs: `docker-compose logs`

2. **Database connection issues**
   - Check MongoDB container logs: `docker-compose logs mongodb`
   - Verify environment variables in docker-compose.yml

3. **CI/CD pipeline failures**
   - Check GitHub Actions logs for error details
   - Verify that all the secrets are correctly set

## License

MIT

## Test CI/CD Pipeline

This is a test change to trigger the CI/CD pipeline. When you push this change to your repository, the following should happen:

1. GitHub Actions workflow will start automatically
2. Docker images will be built for frontend and backend
3. Images will be pushed to Docker Hub
4. The application will be deployed to your VM

