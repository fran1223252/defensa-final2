FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalamos las dependencias base
# Si usas Tailwind, la librería oficial en Django suele ser 'django-tailwind'
RUN pip install --upgrade pip
RUN pip install django pillow django-tailwind

# Copiamos el resto del proyecto
COPY . /app/

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]