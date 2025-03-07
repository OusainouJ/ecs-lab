FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all important files
COPY package.json yarn.lock tsconfig.dev.json babel.config.json ./

# Install yarn
RUN yarn install

# Copy the rest of the files
COPY . .

# Build app
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Run the app
CMD ["npx", "serve", "-s", "build"]
