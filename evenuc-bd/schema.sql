DROP TABLE IF EXISTS inscription CASCADE;
DROP TABLE IF EXISTS evenement CASCADE;
DROP TABLE IF EXISTS categorie CASCADE;
DROP TABLE IF EXISTS utilisateur CASCADE;

CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    courriel VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('ETUDIANT', 'ORGANISATEUR')),
    date_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorie (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE evenement (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    lieu VARCHAR(150) NOT NULL,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,
    capacite INT NOT NULL CHECK (capacite > 0),
    statut VARCHAR(20) NOT NULL DEFAULT 'PUBLIE' CHECK (statut IN ('PUBLIE', 'ANNULE', 'TERMINE')),
    organisateur_id INT NOT NULL REFERENCES utilisateur(id),
    categorie_id INT NOT NULL REFERENCES categorie(id),
    CONSTRAINT chk_dates_evenement CHECK (date_fin > date_debut)
);

CREATE TABLE inscription (
    id SERIAL PRIMARY KEY,
    etudiant_id INT NOT NULL REFERENCES utilisateur(id),
    evenement_id INT NOT NULL REFERENCES evenement(id),
    statut VARCHAR(20) NOT NULL DEFAULT 'EN_ATTENTE'
        CHECK (statut IN ('EN_ATTENTE', 'CONFIRMEE', 'REFUSEE', 'ANNULEE', 'PRESENT', 'ABSENT')),
    date_demande TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_etudiant_evenement UNIQUE (etudiant_id, evenement_id)
);