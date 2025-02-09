# ===========================
# Build Frontend (React)
# ===========================
FROM node:18-alpine as build-client

WORKDIR /app/client

COPY client/package*.json ./
RUN npm install --production

COPY client/ ./
RUN npm run build

# ===========================
# Build Backend (Django)
# ===========================
FROM python:3.9-slim as server

WORKDIR /app/server

# Install dependencies first
COPY server/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django application
COPY server/ ./

# Expose the Django port
EXPOSE 8000

# Use Gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "server.wsgi:application"]
