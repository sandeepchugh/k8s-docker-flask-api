FROM python:3.8-buster
COPY ./requirement.txt /app/requirement.txt
WORKDIR /app
RUN pip install -r requirement.txt
COPY . /app
ENTRYPOINT ["python"]
CMD ["app.py"]