#Stage 1
# Use an official Node.js runtime as a parent image
FROM node:14-alpine as builder

# Set the working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


#Stage 2
FROM nginx:1.19.0

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
