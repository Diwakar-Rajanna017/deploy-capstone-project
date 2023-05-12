FROM node:latest
RUN apt-get update && apt-get install -y nginx
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN cp -r build/* /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

