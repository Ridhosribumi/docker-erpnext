#!/bin/bash

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
apt install -y fontconfig libfontenc1 libxfont1 libxrender1 x11-common xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils libjpeg-turbo8 libx11-6 libxext6
dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

exit 0
