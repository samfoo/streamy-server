NAME=streamy

package:
	rm -f streamy*.deb
	fpm -s dir -t deb -n $(NAME) -a armhf --prefix /apps/streamy service/
