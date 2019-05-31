#!/bin/sh
# Copyright (c) 2019 Mexious Media.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#  (http://www.gnu.org/copyleft/gpl.html)
#
# 3 April 2019	Muhammad Rifky Abimayu	Created this.
#
# USAGE: proxy_domain [DOMAINTOPOINTING] [DOMAIN:PORT]
#

check_cmd() {
    command -v "$1" >/dev/null 2>&1
}
echo "Proxy Domain Installation Script, please wait..."
echo ""
if check_cmd proxy_domain; then
  echo "Proxy Domain is already installed with new version"
  exit 1
elif check_cmd apache2; then
    echo "OK, Nginx Web Server is Installed"
else
    echo "Installing Apache2 with Reverse Proxy............."
    sudo apt update
    sudo apt upgrade
    sudo apt install apache2
    sudo a2enmod proxy
    sudo a2enmod proxy_http
    sudo a2enmod proxy_balancer
    sudo a2enmod lbmethod_byrequests
    sudo systemctl restart apache2
fi
curl https://raw.githubusercontent.com/rifkytech/proxy-domain/master/proxy_domain > proxy_domain
chmod +x proxy_domain
cp proxy_domain /usr/bin/
rm -rf proxy_domain
echo "Installation Success ! run proxy_domain -v "
echo "Exit to Installation"
sleep 3s
exit 0
