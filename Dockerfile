# Use the official NGINX image
FROM nginx:latest

# Copy your HTML file to the NGINX web root
COPY survey.html /usr/share/nginx/html/index.html

# Expose port 80 for the web server
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
