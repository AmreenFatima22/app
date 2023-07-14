FROM python
WORKDIR /fast-api
COPY ./requirments.txt/fast-api/
RUN pip install --no-cache-dir --upgrade -r /fast-api/requirements.txt
COPY . /fast-api
RUN mkdir -p /fast-api/data
CMD ["uvicorn","app.main:app", "--host", "0.0.0.0","--port","8000"]
