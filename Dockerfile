FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Skip the problematic SSR build - just run in development mode
ENV NODE_ENV=development
ENV PORT=3000

EXPOSE 3000

# Run in development mode (bypasses build issues)
CMD ["node", "server.js"]
