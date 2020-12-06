FROM python:3
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
COPY . /src
RUN pip install --no-cache-dir  -r /src/requirements.txt

WORKDIR /src
ENV PYTHONPATH '/src/'

CMD ["python", "/src/collector.py"]
