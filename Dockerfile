FROM alpine:3.17.0

# Install toolchain
RUN apk update && \
    apk upgrade && \
    apk add git \
            python3 \
            py3-pip \
            cmake \
            build-base \
            libusb-dev \
            bsd-compat-headers \
            newlib-arm-none-eabi \
            gcc-arm-none-eabi && \
    apk add --update openssh dos2unix tar rsync ninja autoconf && \
    apk add curl && apk add --upgrade curl && \
    rm -rf /tmp/* /var/cache/apk/*

RUN echo "root:root" | chpasswd

# Raspberry Pi Pico SDK
ARG SDK_PATH=/usr/share/pico_sdk
RUN git clone --depth 1 --branch 1.5.1 https://github.com/raspberrypi/pico-sdk.git $SDK_PATH \
    && cd $SDK_PATH \
    && git submodule update --init

ENV PICO_SDK_PATH=$SDK_PATH

# Picotool installation
RUN git clone --depth 1 --branch 1.1.2 https://github.com/raspberrypi/picotool.git /home/picotool \
    && cd /home/picotool \
    && mkdir build \
    && cd /home/picotool/build \
    && cmake .. \
    && make \
    && cp /home/picotool/build/picotool /bin/picotool \
    && rm -rf /home/picotool

# Needed for CLion
RUN ( \
	echo 'Port 22'; \
	echo '#AddressFamily any'; \
	echo '#ListenAddress 0.0.0.0'; \
	echo '#ListenAddress ::'; \
	echo 'HostKey /etc/ssh/ssh_host_rsa_key'; \
	echo 'HostKey /etc/ssh/ssh_host_dsa_key'; \
	echo 'HostKey /etc/ssh/ssh_host_ecdsa_key'; \
	echo 'HostKey /etc/ssh/ssh_host_ed25519_key'; \
	echo 'PermitRootLogin yes'; \
	echo '#PasswordAuthentication yes'; \
	echo 'AuthorizedKeysFile .ssh/authorized_keys'; \
	echo 'Subsystem sftp /usr/lib/ssh/sftp-server'; \
  ) > /etc/sshd_config_test_clion

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/sshd_config_test_clion"]
