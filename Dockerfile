FROM binhex/arch-privoxyvpn:latest

# install stubby to enable DNS-over-TLS
RUN pacman -Syu \
    && pacman -S --noconfirm stubby

# clean stubby config
RUN mkdir -p /etc/stubby \
    && rm -f /etc/stubby/stubby.yml

# install stubby config
RUN mkdir -p /temp
ADD stuff /temp

#Expose port
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 9118/tcp
EXPOSE 9118/udp

# run init script
CMD ["/bin/bash", "/temp/startup.sh"]
