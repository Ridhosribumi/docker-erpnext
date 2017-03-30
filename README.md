# ERPNext (Single Container)

This Dockerfile build latest version of ERPNext using install.py script that fetched from [ERPNext repository](https://github.com/frappe/erpnext).


---
### Build
Clone this repo to your local machine and change the default password to your desired MariaDB and Administrator password in `Dockerfile`

    MARIADB_PASSWORD=12345678 \
    ADMIN_PASSWORD=12345678 \

leave everything else as it is and save it, then build using this command.

    docker build -t erpnext .

### Docker Image

You can pull automatic build ERPNext image from [Docker Hub](https://hub.docker.com/r/lukptr/erpnext7/)

    docker pull lukptr/erpnext7

*note: default password in this images is `12345678` you may change it later once inside container's shell.*

---
### Run
Run using this command if you build yourself

    docker run -d --name erpnext  -p 80:80 erpnext

or this if you pull from [Docker Hub](https://hub.docker.com/r/lukptr/erpnext7/)

    docker run -d --name erpnext  -p 80:80 lukptr/erpnext7


----------
### Usage
Use this command to get inside container's shell

    docker exec -it erpnext bash

Once inside the container's shell, you can run `bench` command as usual
e.g

    bench update
    bench migrate
    bench backup

####Restore database

Add `$PWD/` before `sites/` 

    bench --force restore $PWD/sites/site1.local/private/backups/database.sql.gz


----------
### License
MIT License (see LICENSE)

The Documentation is licensed as Creative Commons (CC-BY-SA-3.0) and the copyright is owned by Ridho Sribumi.

----------
### Trademark
The brand name ERPNext and the logo are trademarks of Frappe Technologies Pvt. Ltd.

Docker and the Docker logo are trademarks or registered trademarks of Docker, Inc. in the United States and/or other countries. Docker, Inc. and other parties may also have trademark rights in other terms used herein.
