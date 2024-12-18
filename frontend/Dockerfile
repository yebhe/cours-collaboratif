# Utiliser l'image Node.js officielle
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json /app/

# Installer les dépendances
RUN npm install

# Copier tout le projet
COPY . /app/

# Construire l'application React
RUN npm run build

# Exposer le port de l'application React
EXPOSE 3000

# Démarrer l'application React
CMD ["npm", "start"]
