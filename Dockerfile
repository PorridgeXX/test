# Используем официальный Python образ с легковесной версией
FROM python:3.11-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt /app/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код проекта в контейнер
COPY . /app/

# Открываем порт 8000
EXPOSE 8000

# Запускаем встроенный Django dev сервер
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
