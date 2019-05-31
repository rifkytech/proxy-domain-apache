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
# USAGE: proxy_domain [DOMAIN] [PORT]
#
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo ""
  echo "Usage : proxy_domain DOMAINTOPOINTING DOMAIN:PORT"
  echo ""
  echo "Options Information : "
  echo ""
  echo "DOMAINTOPOINTING      Domain to proxy pointing"
  echo "DOMAIN:PORT           Domain & Port value for proxy"
  echo ""
  echo "Need Help? Please dont hesitate to contact rifky@mexious.com"
  exit 0
elif [ "$1" = "-v" ] || [ "$1" = "--version" ]; then
  echo "Copyright (c) 2019 Muhammad Rifky Abimayu <rifky@mexious.com>"
	echo ""
	echo "Run command : proxy_domain --help to more information command "
	echo "This is open source software, under the GNU General Public license: https://www.gnu.org/licenses/gpl.html"
	echo "If You Find a New Bug, Please Report to : rifky@mexious.com"
	echo "Keep Visit : https://mexious.com"
  exit 0
elif [ "$1" = "" ] || [ "$2" = "" ]; then
  echo ""
  echo "Run 'proxy_domain --help' for more Information command"
  echo ""
  exit 1
fi

echo " "
echo "Domain :" $1
echo "Domain & Port   :" $2
echo ""
echo "process to proxy domain......"
sleep 3s
cat << EOF > /etc/apache2/sites-available/$1.conf
<VirtualHost *:80>
    ProxyPreserveHost On
    ServerName $1
    ServerAlias www.$1
    ProxyPass / http://$2/
    ProxyPassReverse / http://$2/
</VirtualHost>
EOF
sudo a2ensite $1.conf
sudo systemctl restart apache2
sudo certbot --apache -d $1
sleep 3s
