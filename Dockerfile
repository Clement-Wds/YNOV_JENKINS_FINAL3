# Étape de base avec l'image Python
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier de dépendances dans le conteneur
COPY requirements.txt ./

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Installer Gunicorn
RUN pip install gunicorn

# Copier le reste des fichiers sources du projet dans le conteneur
COPY . .

# Indiquer que l'application écoute sur le port 5000
EXPOSE 5000

# Définir la commande pour lancer l'application avec Gunicorn
# Utilisez 'main:app' si votre application Flask est nommée 'app' dans 'main.py'
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:5000", "main:app"]