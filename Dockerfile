FROM alpine:3.12
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
COPY . /src
RUN apk add --no-cache --update --virtual \
      build-dependencies \
        curl \
    && apk add --no-cache --update \
         python3 \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py \
    && pip install --no-cache-dir --no-dependencies --no-binary :all: -r /src/requirements.txt \
    && apk del build-dependencies \
    && pip uninstall -y pip setuptools wheel \
    && rm -rf \
        /root/.cache \
        /tmp/* \
        /var/cache/*
WORKDIR /src
ENV PYTHONPATH '/src/'
EXPOSE 8881/tcp
CMD ["python3", "/src/collector.py"]
