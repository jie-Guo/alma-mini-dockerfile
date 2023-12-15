FROM almalinux:9-minimal
#FROM almalinux:8-minimal

# 时区、字符集 || openssh-clients telnet
RUN microdnf -y upgrade && microdnf -y install glibc-langpack-en.x86_64 && microdnf clean all && \
    echo -e 'export LANG=en_US.UTF-8\nexport LC_CTYPE=en_US.UTF-8\nexport LC_NUMERIC=en_US.UTF-8\nexport LC_TIME=en_US.UTF-8\nexport LC_COLLATE=en_US.UTF-8\nexport LC_MONETARY=en_US.UTF-8\nexport LC_MESSAGES=en_US.UTF-8\nexport LC_PAPER=en_US.UTF-8\nexport LC_NAME=en_US.UTF-8\nexport LC_ADDRESS=en_US.UTF-8\nexport LC_TELEPHONE=en_US.UTF-8\nexport LC_MEASUREMENT=en_US.UTF-8\nexport LC_IDENTIFICATION=en_US.UTF-8\nexport LC_ALL=en_US.UTF-8' > /etc/profile.d/locale.sh && \
    cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 时区、字符集---环境变量
ENV LANG=en_US.UTF-8
ENV TZ=Asia/Shanghai

CMD ["/bin/bash"]
