FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Set production environment
ENV NODE_ENV=production

# Install production dependencies (use yarn.lock if present)
COPY package.json yarn.lock ./
RUN npm install --production --no-audit --prefer-offline

# Copy application source
COPY . .

# Run as non-root user
RUN chown -R node:node /usr/src/app
USER node

# Default port (matches server.js fallback)
EXPOSE 8079

# Start command
CMD ["npm", "start"]