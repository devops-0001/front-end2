# Generated Dockerfile for Node.js Express front-end
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN apk add --no-cache --virtual .gyp python3 make g++ \
  && yarn install --frozen-lockfile --production \
  && apk del .gyp

# Copy app source
COPY . .

# Expose default port used by server.js
ENV PORT=8079
EXPOSE 8079
ENV NODE_ENV=production

# Start application
CMD ["node", "server.js"]