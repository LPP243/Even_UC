# Even_UC
Projet final pour application mobile

## 1. Démarrer la base de données (`evenuc-bd/`)
Dans le dossier `evenuc-bd/`, créez un fichier `.env` avec les variables suivantes :
```env
POSTGRES_DB=evenuc
POSTGRES_USER=evenuc_user
POSTGRES_PASSWORD=EvenUC_Dev_2026!

## 2. Lancez ensuite le conteneur PostgreSQL
Lancer l'application Docker

cd evenuc-bd
docker compose up -d

## 3. Lancer l'API
cd evenuc-api
$env:DB_PASSWORD="EvenUC_Dev_2026!"
$env:JWT_SECRET="UneCleSecreteTresLonguePourSignerLesJetonsJWT2026!"
.\mvnw spring-boot:run

## 4. Démmarer l'application Adroid
Ouvrir le dossier evenuc-android avec Android Studio
Lancer l'émulateur
Faire run
