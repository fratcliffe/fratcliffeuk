FROM lipanski/docker-static-website

COPY ./site .

CMD ["/busybox", "httpd", "-f", "-v", "-p", "3000", "-c", "httpd.conf"]
