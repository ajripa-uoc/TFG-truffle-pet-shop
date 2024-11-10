
# Stage 1: Build the application
FROM node as build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Truffle globally
RUN npm install -g truffle

# Copy the rest of the application code
COPY . .

# Run application
RUN chmod +x ./entrypoint.sh
CMD ["./entrypoint.sh"]

# # Stage 2: Run the application
# FROM nginx:latest

# COPY --from=build /usr/src/app/src /usr/share/nginx/html
# COPY --from=build /usr/src/app/entrypoint.sh /usr/share/nginx/html

# # Modify config file to set the GANACHE_URL based on th environment variables
# RUN chmod +x ./entrypoint.sh

# # Expose the port
# EXPOSE 3000