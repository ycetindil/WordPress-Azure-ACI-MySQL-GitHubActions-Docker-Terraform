FROM wordpress:latest

# Below values should match with the Terraform variables
ENV WORDPRESS_DB_HOST=ycetindil-wordpress.mysql.database.azure.com
ENV WORDPRESS_DB_USER=ycetindil
ENV WORDPRESS_DB_PASSWORD=Password1234
ENV WORDPRESS_DB_NAME=wordpress

EXPOSE 80
