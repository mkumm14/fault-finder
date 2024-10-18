# Bug Tracker Application

A bug tracking system built with Django on the backend and React JS on the frontend. This application allows users to report, track, and resolve bugs within software projects.

## Features
- Report bugs with details such as description, priority, and status.
- Assign bugs to specific users.
- Update bug status (open, in progress, resolved).
- Create and modify projects.
- Filter and search bugs by status, priority, or assignee.

## Tech Stack
- **Frontend**: React JS, RTK Query
- **Backend**: Django REST Framework
- **Database**: PostgreSQL
- **Other**: JWT Authentication, Docker

### Prerequisites
- Docker
- Docker Compose

### Steps to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/mkumm14/fault-finder.git
   cd fault-finder
   ```

2. Run the project with Docker Compose:
    ```bash
    docker-compose up --build
    ```

3. Access the application:
    - Backend: The Django API will be available at [http://localhost:8000](http://localhost:8000)
    - Frontend: The React application will be available at [http://localhost:5173](http://localhost:5173)

## Project Structure

### Client

The `client` folder contains the frontend code built with React JS. Here are some key files and directories:

- `src/`: Contains the source code for the React application.
  - `App.tsx`: The main application component.
  - `components/`: Contains reusable React components.
  - `features/`: Contains feature-specific components and logic.
  - `hooks/`: Contains custom React hooks.
  - `assets/`: Contains static assets like images and styles.
  - `config/`: Contains configuration files.
- `index.html`: The main HTML file.
- `package.json`: Contains the dependencies and scripts for the frontend.
- `tailwind.config.js`: Configuration file for Tailwind CSS.
- `vite.config.ts`: Configuration file for Vite, the build tool.

### Server

The `server` folder contains the backend code built with Django. Here are some key files and directories:

- `faultfinder/`: Contains the main Django project settings and URLs.
  - `manage.py`: The command-line utility for administrative tasks.
- `bugs/`: Contains the bug tracking application.
  - `models.py`: Defines the database models for bugs.
  - `serializers.py`: Defines the serializers for converting model instances to JSON.
  - `views.py`: Contains the API views for handling bug-related requests.
- `projects/`: Contains the project management application.
  - `models.py`: Defines the database models for projects.
  - `serializers.py`: Defines the serializers for converting model instances to JSON.
  - `views.py`: Contains the API views for handling project-related requests.
- `users/`: Contains the user management application.
  - `models.py`: Defines the database models for users.
  - `serializers.py`: Defines the serializers for converting model instances to JSON.
  - `views.py`: Contains the API views for handling user-related requests.
- `requirements.txt`: Lists the dependencies for the backend.

## API Documentation (Django REST Framework)

### Authentication
- `POST /auth/login`: User login
- `POST /auth/registration/`: User registration

### Bugs
- `GET /bugs/<int:pk>/project-bugs/`: Get bugs by project


### Projects
- `GET /projects/user-projects/`: Fetch all projects
- `POST /projects/create/`: Create a new project
- `PUT /projects/update/<int:pk>/`: update a project
- `GET /projects/<int:pk>/`: Get details of a specific project
- `DELETE /projects/delete/<int:pk>/`: Delete a project

### Users
- `GET /users/`: Fetch all users
