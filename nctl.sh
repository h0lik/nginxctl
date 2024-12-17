#!/bin/bash
# shellcheck disable=SC1017
set -e
source $PWD/lib/create_domain
source $PWD/lib/help
fync_status() {
if sudo pidof -x nginx > /dev/null
  then
	  echo -e "Nginx............. \e[32m ok!\e[0m"
		exit 0
else
       echo -e "\e[32m Nginx............\e[31m error!\e[0m"
		exit 0
fi
}
while [ -n "$1" ]
       do
       case "$1" in
            help )
            reset
            menu
            ;;
           start )
                 systemctl start nginx
           ;;
           stop )
                systemctl start nginx
           ;;
           restart )
                systemctl restart nginx
           ;;
           reload )
                systemctl reload nginx
           ;;
           status )fync_status;;
           add-domain )add_domians;;
           )help;;
        esac
    shift
 done
