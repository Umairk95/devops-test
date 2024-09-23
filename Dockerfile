# Use official Node.js alpine image as a base
FROM node:alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Copy code to /app dir
COPY index.js ./

# Argument for environment.
ARG METRICS_HOST=localhost
ARG APP_ENV=DEV

# Set the environment variable
ENV APP_ENV=${APP_ENV}
ENV METRICS_HOST=${METRICS_HOST}

# Install dependencies based on the environment
RUN if [ "$APP_ENV" = "production" ]; then \
        npm install --production; \
    else \
        npm install; \
    fi

# Command to run the Node.js app
ENTRYPOINT [ "node", "index.js"]
