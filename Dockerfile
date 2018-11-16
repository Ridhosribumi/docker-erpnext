FROM lukptr/ubuntu:16.04-23112016
MAINTAINER lukptr <ridhosribumi.com>

ENV FRAPPE_USER=frappe \
    MYSQL_PASSWORD=12345678 \
    ADMIN_PASSWORD=12345678 \
    DEBIAN_FRONTEND=noninteractive
RUN useradd $FRAPPE_USER && mkdir /home/$FRAPPE_USER && chown -R $FRAPPE_USER.$FRAPPE_USER /home/$FRAPPE_USER
WORKDIR /home/$FRAPPE_USER
RUN wget https://raw.githubusercontent.com/frappe/bench/master/playbooks/install.py && \
    sed -i -e 's,frappe/bench,lukptr/bench-docker,' install.py && apt update && \
    python install.py --production --user $FRAPPE_USER --mysql-root-password $MYSQL_PASSWORD --admin-password $ADMIN_PASSWORD && \
    su - $FRAPPE_USER -c "cd /home/$FRAPPE_USER/.bench && git remote set-url origin https://github.com/frappe/bench && \
    git fetch && git reset --hard origin/master" && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ /home/$FRAPPE_USER/.cache
COPY production.conf /etc/supervisor/conf.d/
WORKDIR /home/$FRAPPE_USER/frappe-bench
EXPOSE 80

CMD ["/usr/bin/supervisord","-n"]
