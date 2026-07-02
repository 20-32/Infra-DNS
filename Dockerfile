FROM rockylinux:9

RUN dnf -y install bind bind-utils && dnf clean all

COPY named.conf /etc/named.conf
COPY example.com.zone /var/named/example.com.zone
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    chown root:named /etc/named.conf && \
    chown named:named /var/named/example.com.zone

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/entrypoint.sh"]