FROM python:3.6

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app


COPY Pipfile Pipfile.lock /app/
RUN apt update
RUN apt install -y unixodbc-dev unixodbc tdsodbc
RUN pip install pipenv && pipenv install --system

COPY . /app/
