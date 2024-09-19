FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the index.html file to the working directory
COPY . /usr/share/nginx/html

# Expose port 80 (the port Nginx listens on)
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
