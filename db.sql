CREATE TABLE accommodation
(
  id          INTEGER      NOT NULL AUTO_INCREMENT,
  number      INTEGER      NOT NULL,
  rent        INTEGER      NOT NULL,
  description VARCHAR(200) NULL    ,
  student_id  INTEGER      NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE accommodation
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE activity
(
  id          INTEGER      NOT NULL AUTO_INCREMENT,
  name        VARCHAR(50)  NOT NULL,
  description VARCHAR(200) NULL    ,
  place       VARCHAR(200) NOT NULL,
  date        DATETIME     NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE activity
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE activity_student
(
  id          INTEGER NOT NULL AUTO_INCREMENT,
  student_id  INTEGER NOT NULL,
  activity_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE activity_student
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE department
(
  id            INTEGER     NOT NULL AUTO_INCREMENT,
  name          VARCHAR(50) NOT NULL,
  speciality_id INTEGER     NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE department
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE speciality
(
  id          INTEGER      NOT NULL AUTO_INCREMENT,
  name        VARCHAR(50)  NOT NULL,
  description VARCHAR(200) NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE speciality
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE student
(
  id            INTEGER     NOT NULL AUTO_INCREMENT,
  name          VARCHAR(50) NOT NULL,
  surname       VARCHAR(50) NOT NULL,
  birthdate     DATE        NOT NULL,
  email         VARCHAR(50) NOT NULL,
  department_id INTEGER     NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE student
  ADD CONSTRAINT UQ_id UNIQUE (id);

ALTER TABLE accommodation
  ADD CONSTRAINT FK_student_TO_accommodation
    FOREIGN KEY (student_id)
    REFERENCES student (id);

ALTER TABLE department
  ADD CONSTRAINT FK_speciality_TO_department
    FOREIGN KEY (speciality_id)
    REFERENCES speciality (id);

ALTER TABLE student
  ADD CONSTRAINT FK_department_TO_student
    FOREIGN KEY (department_id)
    REFERENCES department (id);

ALTER TABLE activity_student
  ADD CONSTRAINT FK_student_TO_activity_student
    FOREIGN KEY (student_id)
    REFERENCES student (id);

ALTER TABLE activity_student
  ADD CONSTRAINT FK_activity_TO_activity_student
    FOREIGN KEY (activity_id)
    REFERENCES activity (id);

INSERT INTO speciality (name, description) 
VALUES 
('Informatique', 'Étude des fondements des processus de calcul'),
('Mathématiques', 'Étude des nombres, des quantités et des formes'),
('Physique', 'Étude de la matière, de l\'énergie et de leur interaction'),
('Littérature', 'Étude des œuvres écrites classiques et modernes'),
('Biologie', 'Étude des organismes vivants'),
('Histoire', 'Étude des événements passés et de leur impact sur le monde moderne');

INSERT INTO department (name, speciality_id) 
VALUES 
('École d\'Ingénierie', 1),
('Faculté des Sciences', 2),
('Faculté des Arts', 3),
('Faculté de Lettres', 4),
('Faculté des Sciences de la Vie', 5),
('Département d\'Histoire', 6);

INSERT INTO student (name, surname, birthdate, email, department_id) 
VALUES 
('Jean', 'Dupont', '1995-02-20', 'jean.dupont@email.com', 1),
('Marie', 'Curie', '1996-05-30', 'marie.curie@email.com', 2),
('Zoé', 'Curie', '1996-05-30', 'zoe.curie@email.com', 4),
('Pierre', 'Leroux', '1997-08-15', 'pierre.leroux@email.com', 3),
('Sophie', 'Martin', '1998-03-22', 'sophie.martin@email.com', 1),
('Arthur', 'Martin', '1992-10-12', 'arthur.martin@email.com', 2),
('Lucas', 'Bernard', '1994-11-11', 'lucas.bernard@email.com', 2),
('Camille', 'Petit', '1997-07-07', 'camille.petit@email.com', 3),
('Thomas', 'Roux', '1996-01-01', 'thomas.roux@email.com', 4),
('Alexandre', 'Roux', '1999-07-21', 'alexandre.roux@email.com', 1),
('Chloé', 'Lefebvre', '1995-09-09', 'chloe.lefebvre@email.com', 5),
('Karim', 'Lefebvre', '1992-09-19', 'karim.lefebvre@email.com', 6),
('Jules', 'Moreau', '1997-06-16', 'jules.moreau@email.com', 6);

INSERT INTO accommodation (number, rent, description, student_id) 
VALUES 
(201, 300, 'Chambre individuelle', (SELECT id FROM student WHERE name='Jean')),
(202, 300, 'Chambre individuelle', (SELECT id FROM student WHERE name='Marie')),
(203, 400, 'Chambre double', NULL),
(204, 500, 'Studio', (SELECT id FROM student WHERE name='Pierre')),
(205, 300, 'Chambre individuelle', NULL),
(206, 400, 'Chambre double', (SELECT id FROM student WHERE name='Sophie')),
(207, 500, 'Studio', NULL),
(208, 300, 'Chambre individuelle', (SELECT id FROM student WHERE name='Lucas')),
(209, 400, 'Chambre double', (SELECT id FROM student WHERE name='Camille'));

INSERT INTO activity (name, description, place, date) 
VALUES 
('Bootcamp de Programmation', 'Un bootcamp pour apprendre le développement web', 'Bâtiment A', '2024-03-15 10:00:00'),
('Club de Mathématiques', 'Réunions hebdomadaires pour discuter des mathématiques avancées', 'Bâtiment A', '2024-03-16 15:00:00'),
('Symposium de Physique', 'Symposium annuel sur la physique moderne', 'Bâtiment C', '2024-03-20 09:00:00'),
('Atelier d\'Écriture', 'Atelier pour les passionnés de littérature', 'Bâtiment L', '2024-03-21 14:00:00'),
('Séminaire de Biologie', 'Conférences sur les dernières découvertes en biologie', 'Bâtiment A', '2024-03-25 13:00:00'),
('Conférence d\'Histoire', 'Série de conférences sur l\'histoire contemporaine', 'Bâtiment H', '2024-03-27 17:00:00');

INSERT INTO activity_student (student_id, activity_id) 
VALUES 
((SELECT id FROM student WHERE name='Jean'), (SELECT id FROM activity WHERE name='Bootcamp de Programmation')),
((SELECT id FROM student WHERE name='Marie'), (SELECT id FROM activity WHERE name='Club de Mathématiques')),
((SELECT id FROM student WHERE name='Karim'), (SELECT id FROM activity WHERE name='Club de Mathématiques')),
((SELECT id FROM student WHERE name='Pierre'), (SELECT id FROM activity WHERE name='Symposium de Physique')),
((SELECT id FROM student WHERE name='Jules'), (SELECT id FROM activity WHERE name='Symposium de Physique')),
((SELECT id FROM student WHERE name='Arthur'), (SELECT id FROM activity WHERE name='Symposium de Physique')),
((SELECT id FROM student WHERE name='Sophie'), (SELECT id FROM activity WHERE name='Atelier d\'Écriture')),
((SELECT id FROM student WHERE name='Zoé'), (SELECT id FROM activity WHERE name='Atelier d\'Écriture')),
((SELECT id FROM student WHERE name='Lucas'), (SELECT id FROM activity WHERE name='Séminaire de Biologie')),
((SELECT id FROM student WHERE name='Marie'), (SELECT id FROM activity WHERE name='Séminaire de Biologie')),
((SELECT id FROM student WHERE name='Camille'), (SELECT id FROM activity WHERE name='Conférence d\'Histoire')),
((SELECT id FROM student WHERE name='Jean'), (SELECT id FROM activity WHERE name='Conférence d\'Histoire'));
