# Use a Node.js base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the application code
COPY . .

# Set the environment variables
ENV NODE_ENV production
ENV PORT 8079

# Expose port 8079
EXPOSE 8079

# Start the application
CMD ["node", "server.js"]