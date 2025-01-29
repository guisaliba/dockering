# syntax=docker/dockerfile:1
FROM python:3.10-slim

# build stage for song app
WORKDIR /src

COPY /src/models.py .
COPY /src/routes.py .

RUN pip install -r requirements.txt

CMD psql -U postgres -d song_db