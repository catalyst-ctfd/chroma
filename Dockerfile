FROM registry.access.redhat.com/ubi9/python-312

USER 0
RUN wget https://www.sqlite.org/2024/sqlite-autoconf-3460000.tar.gz \
    && tar xvf sqlite-autoconf-3460000.tar.gz \
    && rpm -e sqlite sqlite-devel \
    && cd sqlite-autoconf-3460000 \
    && ./configure --prefix=/usr \
    && make \
    && make install
USER 1001

RUN pip install chromadb

CMD chroma run --port 8080
