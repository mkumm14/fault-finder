# ===========================
# Build Frontend (React)
# ===========================
FROM node:18-alpine AS build-client

WORKDIR /app/client

# Install dependencies
COPY client/package*.json ./
RUN npm install

# Copy the source code and build
COPY client/ ./
RUN npm run build 
RUN ls -la /app/client/dist  # Debugging step to verify build output

# =========================
# Final Client Image (Using Serve)
# ===========================
FROM node:18-alpine AS client

WORKDIR /app/client

# Copy built files from previous stage
COPY --from=build-client /app/client/dist ./

# Install serve
RUN npm install -g serve

# Expose the frontend port
EXPOSE 3000

# Run serve in production mode
CMD ["serve", "-s", ".", "-l", "3000"]



# ===========================
# Build Backend (Django)
# ===========================
FROM python:3.9-slim AS build-server

WORKDIR /app/server

# Install system dependencies
RUN apt-get update && apt-get install -y gcc python3-dev musl-dev

# Install dependencies
COPY server/requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django source code
COPY server/ ./

# ===========================
# Final Backend Image (Production)
# ===========================
FROM python:3.9-slim AS server

WORKDIR /app/server

# Copy only necessary files from the build stage
COPY --from=build-server /app/server /app/server

# Ensure Django is installed
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r /app/server/requirements.txt



# Expose the Django port
EXPOSE 8000

# Use Gunicorn for production
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8000", "--log-file","1.logfile.log","faultfinder.wsgi:application"]
