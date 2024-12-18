FROM python:3.11-slim

# Installer netcat-openbsd et les autres dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
    gcc \
    pkg-config \
    libmariadb-dev \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
