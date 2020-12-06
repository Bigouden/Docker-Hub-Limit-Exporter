FROM python:3
LABEL maintainer="Thomas GUIRRIEC <thomas@guirriec.fr>"
ADD . /src
RUN pip install -r /src/requirements.txt

WORKDIR /src
ENV PYTHONPATH '/src/'

CMD ["python", "/src/collector.py"]
