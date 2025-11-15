FROM node:18-slim

# Create app directory
WORKDIR /usr/src/app

# Install dependencies (use npm ci when lockfile present, otherwise npm install)
COPY package.json package-lock.json* ./
RUN if [ -f package-lock.json ]; then \
      npm ci --only=production; \
    else \
      npm install --only=production; \
    fi

# Copy application source
COPY . .

# Set production environment
ENV NODE_ENV=production

# Use unprivileged user (node image provides 'node')
USER node

# The app listens on this port by default; can be overridden with $PORT
EXPOSE 8079

# Start the app using the package.json start script
CMD ["npm", "start"]