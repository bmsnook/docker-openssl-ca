FROM bmsnook/baseimage-ssh

# Openssl already included in phusion/baseimage
# RUN apt-get -q update && \
#    DEBIAN_FRONTEND=noninteractive apt-get install -y \
#        openssl && \
#    apt-get clean && rm -rf /tmp/* /var/cache/apt/*

# Sudo is not already included in phusion/baseimage; 
#   install it if planning to connect as a non-root user

RUN ls -al /etc/

# RUN apt -q update && \
#     DEBIAN_FRONTEND=noninteractive apt install -y \
#         sudo \
#         zsh && \
#     DEBIAN_FRONTEND=noninteractive apt clean && \
#     rm -rf /tmp/* /var/cache/apt/*

# CA files path
ENV CA_PATH=/opt/ca
VOLUME      /opt/ca

# Add CA files
ADD files	/root
ADD my_init.d	/etc/my_init.d

# Expose SSH port
EXPOSE 22

# Change to scripts directory
WORKDIR /root/scripts
