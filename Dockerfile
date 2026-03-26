FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN DJANGO_SECRET_KEY=build-dummy-key python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "myapp.wsgi:application", "--bind", "0.0.0.0:8000"]
