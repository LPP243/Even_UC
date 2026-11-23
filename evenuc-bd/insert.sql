-- 1. UTILISATEURS (2 ORGANISATEURS + 4 ETUDIANTS)
-- Mot de passe en clair pour tous les comptes de test : Password123!
INSERT INTO utilisateur (nom, courriel, mot_de_passe, role) VALUES
('Club Techno', 'techno@collegeuniversel.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ORGANISATEUR'),
('Association Sportive', 'sport@collegeuniversel.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ORGANISATEUR'),
('Léa Roy', 'lea.roy@etudiant.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ETUDIANT'),
('Karim Benali', 'karim.benali@etudiant.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ETUDIANT'),
('Alice Tremblay', 'alice.tremblay@etudiant.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ETUDIANT'),
('Sam Côté', 'sam.cote@etudiant.ca', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ETUDIANT');

-- 2. CATEGORIES (5 catégories)
INSERT INTO categorie (nom) VALUES
('Conférence'),
('Atelier'),
('Sport'),
('Social'),
('Carrière');

-- 3. EVENEMENTS (8 événements : 1 complet [id=2], 1 passé/terminé [id=8], 6 à venir)
INSERT INTO evenement (titre, description, lieu, date_debut, date_fin, capacite, statut, organisateur_id, categorie_id) VALUES
('Conférence IA', 'Introduction aux modèles de langage et démonstrations pratiques.', 'Salle B-204', '2026-12-18 13:00:00', '2026-12-18 15:00:00', 40, 'PUBLIE', 1, 1),
('Tournoi de soccer', 'Tournoi amical 5 contre 5 entre programmes.', 'Gymnase principal', '2026-12-19 10:00:00', '2026-12-19 14:00:00', 2, 'PUBLIE', 2, 3),
('Atelier CV et LinkedIn', 'Optimisez votre CV technique avant les stages d''hiver.', 'Local A-101', '2026-12-20 15:30:00', '2026-12-20 17:30:00', 20, 'PUBLIE', 1, 5),
('Soirée jeux de société', 'Détente de fin de session avec jeux modernes et collations.', 'Café étudiant', '2026-12-21 18:00:00', '2026-12-21 22:00:00', 30, 'PUBLIE', 2, 4),
('Atelier Git et GitHub', 'Maîtriser les branches, pull requests et résolutions de conflits.', 'Labo C-305', '2026-12-22 13:00:00', '2026-12-22 15:30:00', 15, 'PUBLIE', 1, 2),
('Journée Carrière TI', 'Rencontrez des employeurs de la région de Gatineau-Ottawa.', 'Agora du campus', '2027-01-14 09:00:00', '2027-01-14 15:00:00', 80, 'PUBLIE', 1, 5),
('Tournoi d''échecs rapide', 'Parties blitz de 10 minutes ouvertes à tous les niveaux.', 'Bibliothèque', '2027-01-16 12:00:00', '2027-01-16 14:00:00', 16, 'PUBLIE', 2, 4),
('Hackathon d''automne', 'Défi de programmation de 8 heures en équipe.', 'Salle B-204', '2026-11-10 09:00:00', '2026-11-10 17:00:00', 25, 'TERMINE', 1, 2);

-- 4. INSCRIPTIONS (10 inscriptions aux statuts variés)
INSERT INTO inscription (etudiant_id, evenement_id, statut) VALUES
-- Événement 1 (Conférence IA)
(3, 1, 'EN_ATTENTE'),  -- Léa Roy
(4, 1, 'CONFIRMEE'),   -- Karim Benali
(5, 1, 'EN_ATTENTE'),  -- Alice Tremblay
-- Événement 2 (Tournoi de soccer - capacité 2 -> COMPLET avec 2 CONFIRMEE)
(3, 2, 'CONFIRMEE'),   -- Léa Roy
(6, 2, 'CONFIRMEE'),   -- Sam Côté
-- Événement 3 (Atelier CV)
(4, 3, 'REFUSEE'),     -- Karim Benali
(5, 3, 'ANNULEE'),     -- Alice Tremblay
-- Événement 4 (Soirée jeux)
(6, 4, 'CONFIRMEE'),   -- Sam Côté
-- Événement 8 (Hackathon passé/TERMINE -> PRESENT et ABSENT)
(3, 8, 'PRESENT'),     -- Léa Roy
(4, 8, 'ABSENT');      -- Karim Benali