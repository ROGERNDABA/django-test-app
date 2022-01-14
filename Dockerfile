FROM python:3.7

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app


COPY Pipfile Pipfile.lock /app/
RUN apt update
RUN apt install -y unixodbc-dev unixodbc tdsodbc
RUN apt install -y  python3-psycopg2
RUN pip install pipenv && pipenv --python 3.7 install --system

COPY . /app/
