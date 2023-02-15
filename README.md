# shop-demo


### Dependency 


npm install -g angular-cli

### Database

#### Create docker volume
docker volume create mysql-volume1

#### Run MYSQL database
docker run -p3306:3306 -v mysql-volume1:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=toor -d mysql/mysql-server:5.6


CREATE DATABASE shop;
CREATE USER 'shop'@'%' IDENTIFIED BY 'shop123';
GRANT ALL ON *.* TO 'shop'@'%';
  
Import database example


### Client

npm install

## Development server

Run `ng serve` and open `http://localhost:4200/`


## Build

Run `ng build` or 'npm run ng serve' to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

### Backend

npm install 

npm run dev
