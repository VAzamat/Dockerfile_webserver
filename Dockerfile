# Используем базовый образ Python
FROM dockerhub.timeweb.cloud/python:3.14-rc

# Устанавливаем рабочую директорию в контейнере
WORKDIR /webserver

# Копируем зависимости в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения в контейнер
COPY . .

# Команда для запуска приложения при старте контейнера
CMD ["python", "dummy-web-server.py"]