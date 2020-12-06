FROM python:3

ADD . /src
RUN pip install -r /src/requirements.txt

WORKDIR /src
ENV PYTHONPATH '/src/'

CMD ["python", "/src/collector.py"]
