# Build Phase: Where the react app is build for deployment
FROM node:alpine as builder
# Specify the working directory inside the image
WORKDIR "/app"
# Copy the package.json file to the /app directory
COPY package.json .
RUN npm install

# Copy everything else from the current to the image's /app directory
COPY . .
# Create the build folder => /app/build
RUN npm run build

# Run/Deployment Phase: Where the production/deployed app is run
FROM nginx
# From the builder phase above, copy the build folder to the ..../html folder
COPY --from=builder /app/build /usr/share/nginx/html
# No need to specify to start the nginx container <-- As this is the default command