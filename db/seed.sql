-- Maak de database
CREATE DATABASE recepten_db;
USE recepten_db;

-- Tabel voor categorieën
CREATE TABLE categorieen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(100) NOT NULL
);

-- Tabel voor recepten
CREATE TABLE recepten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(255) NOT NULL,
    beschrijving TEXT,
    bereidingstijd INT, -- tijd in minuten
    categorie_id INT,
    FOREIGN KEY (categorie_id) REFERENCES categorieen(id) ON DELETE SET NULL
);

-- Tabel voor ingrediënten
CREATE TABLE ingredienten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(255) NOT NULL
);

-- Tabel voor recept-ingrediënten (veel-op-veel relatie)
CREATE TABLE recept_ingredienten (
    recept_id INT,
    ingredient_id INT,
    hoeveelheid VARCHAR(100),
    PRIMARY KEY (recept_id, ingredient_id),
    FOREIGN KEY (recept_id) REFERENCES recepten(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredienten(id) ON DELETE CASCADE
);

-- Tabel voor bereidingsstappen
CREATE TABLE bereidingsstappen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recept_id INT,
    stap_nummer INT,
    beschrijving TEXT,
    FOREIGN KEY (recept_id) REFERENCES recepten(id) ON DELETE CASCADE
);

-- Voeg wat voorbeeldcategorieën toe
INSERT INTO categorieen (naam) VALUES
('Ontbijt'),
('Lunch'),
('Diner'),
('Dessert')
('Snacks'),
('Dranken');

-- Voeg wat voorbeeldingrediënten toe
INSERT INTO ingredienten (naam) VALUES
('Eieren'),
('Bloem'),
('Melk'),
('Suiker'),
('Zout'),
('Boter'),
('Chocolade'),
('Vanille-extract'),
('Baking soda'),
('Room'),
('Tomaten'),
('Kaas'),
('Kip'),
('Rijst'),
('Aardappelen'),
('Paprika'),
('Olijfolie'),
('Knoflook'),
('Ui');

-- Voeg een voorbeeldrecept toe
INSERT INTO recepten (naam, beschrijving, bereidingstijd, categorie_id) VALUES
('Pannenkoeken', 'Heerlijke luchtige pannenkoeken.', 30, 1),
('Tomatensoep', 'Verse tomatensoep met basilicum.', 45, 2),
('Spaghetti Bolognese', 'Klassieke Italiaanse pastasaus.', 60, 3),
('Chocoladetaart', 'Rijke en smeuïge chocoladetaart.', 90, 4),
('Gezonde Smoothie', 'Frisse smoothie met fruit en spinazie.', 10, 6),
('Nacho\'s', 'Heerlijke krokante nacho\'s met kaas en jalapeño.', 20, 5);

-- Voeg ingrediënten aan het recept toe
INSERT INTO recept_ingredienten (recept_id, ingredient_id, hoeveelheid) VALUES
(1, 1, '2 stuks'),
(1, 2, '200 gram'),
(1, 3, '250 ml'),
(1, 5, 'snufje'),
(1, 6, '20 gram'),
(2, 11, '500 gram'),
(2, 18, '2 tenen'),
(2, 19, '1 stuk'),
(2, 16, '2 el'),
(3, 11, '400 gram'),
(3, 13, '300 gram'),
(3, 17, '3 el'),
(3, 18, '3 tenen'),
(4, 7, '200 gram'),
(4, 4, '100 gram'),
(4, 8, '1 tl'),
(4, 10, '100 ml'),
(5, 14, '1 handvol'),
(5, 15, '1 stuk'),
(5, 16, '2 el');

-- Voeg bereidingsstappen toe
INSERT INTO bereidingsstappen (recept_id, stap_nummer, beschrijving) VALUES
(1, 1, 'Meng de bloem en het zout in een kom.'),
(1, 2, 'Klop de eieren en melk samen en voeg toe aan de droge ingrediënten.'),
(1, 3, 'Verhit boter in een koekenpan en bak de pannenkoeken aan beide kanten goudbruin.'),
(2, 1, 'Snijd de tomaten, ui en knoflook in stukjes.'),
(2, 2, 'Verhit olijfolie in een pan en fruit de ui en knoflook.'),
(2, 3, 'Voeg de tomaten toe en laat 30 minuten koken.'),
(3, 1, 'Bak de knoflook en ui in olijfolie.'),
(3, 2, 'Voeg gehakt toe en bak rul.'),
(3, 3, 'Meng de tomatensaus en laat sudderen.'),
(3, 4, 'Kook de spaghetti en serveer met de saus.'),
(4, 1, 'Smelt de chocolade au bain-marie.'),
(4, 2, 'Meng de suiker en room door de gesmolten chocolade.'),
(4, 3, 'Bak het beslag 30 minuten op 180 graden.'),
(5, 1, 'Doe alle ingrediënten in een blender en mix tot een gladde smoothie.'),
(6, 1, 'Verwarm de oven tot 200 graden.'),
(6, 2, 'Verspreid de nacho\'s op een bakplaat en bestrooi met kaas.'),
(6, 3, 'Bak 10 minuten tot de kaas gesmolten is.');
