# Используем официальный образ Python 3.11 slim для минимального размера
FROM python:3.11-slim

# Устанавливаем системные зависимости, необходимые для работы Django и psycopg2 (PostgreSQL)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    gettext \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Устанавливаем Python-зависимости
RUN pip install --upgrade pip && pip install django

# Копируем весь проект в контейнер
COPY . /app/

# Устанавливаем переменную окружения для правильной работы Python
ENV PYTHONUNBUFFERED=1

# Команда для сбора статики (если используется)
RUN python manage.py collectstatic --noinput

# По умолчанию запускаем сервер Django с параметрами для production
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]

# Экспонируем порт 8000 для доступа к приложению
EXPOSE 8000
