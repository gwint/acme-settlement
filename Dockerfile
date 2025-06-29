FROM ubuntu:22.04
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y python3-pip
COPY settlementapi /code/settlementapi
COPY requirements.in /code/requirements.in
COPY requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
WORKDIR /code/settlementapi
ENV PYTHONPATH="/code"
CMD ["uvicorn", "settlementapi.main:app", "--reload", "--reload-dir", "/code/settlementapi", "--host", "0.0.0.0", "--port", "8000"]
