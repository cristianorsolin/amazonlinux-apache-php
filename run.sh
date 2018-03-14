#!/bin/bash

if [ "$PHP_XDEBUG_ENABLED" = "**False**" ]; then
    unset PHP_XDEBUG_ENABLED
    rm /etc/php-5.5.d/xdebug.ini
else
    { \
		echo -e "zend_extension=xdebug.so"; \
		echo -e "xdebug.remote_autostart=true"; \
		echo -e "xdebug.remote_mode=req"; \
		echo -e "xdebug.remote_handler=dbgp"; \
		echo -e "xdebug.remote_connect_back=1"; \
		echo -e "xdebug.remote_port=9000"; \
		echo -e "xdebug.remote_host=127.0.0.1"; \
		echo -e "xdebug.remote_enable=1"; \
	} | tee /etc/php-5.5.d/xdebug.ini
fi

exec /usr/sbin/httpd -D FOREGROUND
