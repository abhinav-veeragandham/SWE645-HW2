# Team Members

# Abhinav Veeragandham - G01515455
# Pranav Vangavety - G01511443
# Charan Sri Sai Devalla - G01504177
# Bhogeswara Pathakamudi - G01507114
# Durga Shankar Kondaveeti - G01510533

# Use the official NGINX image
FROM nginx:latest

# Copy your HTML file to the NGINX web root
COPY survey.html /usr/share/nginx/html/index.html

# Expose port 80 for the web server
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
