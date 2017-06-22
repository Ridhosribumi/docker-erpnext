FROM lukptr/ubuntu:16.04-23112016
MAINTAINER lukptr <lukptr@ridhosribumi.com>

ENV FRAPPE_USER=frappe \
    MYSQL_PASSWORD=12345678 \
    ADMIN_PASSWORD=12345678 \
    DEBIAN_FRONTEND=noninteractive
RUN useradd $FRAPPE_USER && mkdir /home/$FRAPPE_USER && chown -R $FRAPPE_USER.$FRAPPE_USER /home/$FRAPPE_USER
WORKDIR /home/$FRAPPE_USER
RUN wget https://raw.githubusercontent.com/frappe/bench/master/playbooks/install.py && sed -i "s/'', ''/'$MYSQL_PASSWORD', '$ADMIN_PASSWORD'/g" install.py
COPY setup.sh /
RUN bash /setup.sh
COPY all.conf /etc/supervisor/conf.d/
EXPOSE 80 25

CMD ["/usr/bin/supervisord","-n"]
