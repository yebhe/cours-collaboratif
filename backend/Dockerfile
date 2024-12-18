# Utiliser l'image Python officielle
FROM python:3.11-slim

# Installer les dépendances système nécessaires pour mysqlclient (avec libmariadb-dev)
RUN apt-get update && \
    apt-get install -y \
    gcc \
    pkg-config \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de requirements
COPY requirements.txt /app/

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le projet dans le conteneur
COPY . /app/

# Exposer le port de l'application Django
EXPOSE 8000

# Commande pour démarrer Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
