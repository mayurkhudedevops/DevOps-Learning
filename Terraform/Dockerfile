# Use official Nginx image
FROM nginx:alpine

# Optional: Add custom index.html
COPY index.html /usr/share/nginx/html/index.html

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]