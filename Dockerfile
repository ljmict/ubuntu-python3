FROM ubuntu
LABEL maintainer="ljmict@163.com"
ENV PYTHON_INSTALL_PATH=/usr/local/python3 \
    PYTHON_VERSION=3.6.6
RUN apt-get update -y \
    && apt-get -y install gcc wget xz-utils make libssl-dev zlib1g-dev \
    && mkdir -p ${PYTHON_INSTALL_PATH}
RUN wget -P /opt https://www.python.org/ftp/python/${PYTHON_VERSION}/"Python-${PYTHON_VERSION}.tar.xz"
RUN tar xvf /opt/"Python-${PYTHON_VERSION}.tar.xz" -C /opt
WORKDIR /opt/"Python-${PYTHON_VERSION}"
RUN ./configure --prefix=${PYTHON_INSTALL_PATH} --with-ssl \
    && make \
    && make install
RUN ln -s ${PYTHON_INSTALL_PATH}/bin/python3 /usr/bin/python3 \
    && ln -s ${PYTHON_INSTALL_PATH}/bin/pip3 /usr/bin/pip3
CMD [ "/usr/bin/python3" ]
