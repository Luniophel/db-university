CREATE DATABASE university;

USE university;

-- Creo le tables

CREATE TABLE dipartimenti
(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	indirizzo VARCHAR(40),
	telefono VARCHAR(10) NOT NULL,
	email VARCHAR(25) NOT NULL,
	direttore VARCHAR(50) NOT NULL,
	amministratore VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE corso_di_laurea
(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	sede VARCHAR(40),
	classe VARCHAR(6) NOT NULL,
	anni_attivi SMALLINT NOT NULL,
	coordinatore VARCHAR(40) NOT NULL,
	vicecoordinatore VARCHAR(40) NOT NULL,
	segretario VARCHAR(40) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE corsi
(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	ore_previste INT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE studenti
(
	matricola BIGINT NOT NULL,
	nome VARCHAR(40) NOT NULL,
	cognome VARCHAR(40) NOT NULL,
	cf VARCHAR(20) NOT NULL,
	indirizzo VARCHAR(20) NOT NULL,
	email VARCHAR(25) NOT NULL,
	id_cdl INT NOT NULL,
	PRIMARY KEY(matricola),
	FOREIGN KEY(id_cdl) REFERENCES corso_di_laurea(id)
);

CREATE TABLE insegnanti
(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	cognome VARCHAR(40) NOT NULL,
	cf VARCHAR(20) NOT NULL,
	indirizzo_ufficio VARCHAR(20) NOT NULL,
	email VARCHAR(25) NOT NULL,
	ricevimento VARCHAR(10),
	PRIMARY KEY (id)
);

-- Table ponte tra cordi di laurea e corsi
CREATE TABLE cdl_corsi
(
	id_cdl INT NOT NULL,
	id_corsi INT NOT NULL,
	FOREIGN KEY (id_cdl) REFERENCES corso_di_laurea(id),
	FOREIGN KEY (id_corsi) REFERENCES corsi(id)
);

CREATE TABLE corsi_insegnanti
(
	id_corsi INT NOT NULL,
	id_insegnanti INT NOT NULL,
	FOREIGN KEY (id_corsi) REFERENCES corsi(id),
	FOREIGN KEY (id_insegnanti) REFERENCES insegnanti(id)
);

ALTER TABLE corso_di_laurea  ADD COLUMN id_dipartimento INT;
ALTER TABLE corso_di_laurea ADD FOREIGN KEY(id_dipartimento) REFERENCES dipartimenti(id);

-- Inserisco dati nel dipartimento
INSERT INTO university.dipartimenti
(nome, indirizzo, telefono, email, direttore, amministratore)
VALUES('Dipartimento delle patatine', 'Non casa mia', 'No, grazie', 'nonloso@boh.it', 'Mario', 'Piergirgiofranco');

INSERT INTO university.corso_di_laurea
(nome, sede, classe, anni_attivi, coordinatore, vicecoordinatore, segretario, id_dipartimento)
VALUES('Scienze delle Merendine', 'Babilonia', 'ML-01', 1, 'Assurbanipal', 'Piero', 'Michela', 1);

INSERT INTO university.corsi
(nome, ore_previste)
VALUES('Varietà di fritturine miste', 25);

INSERT INTO university.corsi
(nome, ore_previste)
VALUES('Merendine varie', 40);




INSERT INTO university.cdl_corsi
(id_cdl, id_corsi)
VALUES(1, 1);

INSERT INTO university.cdl_corsi
(id_cdl, id_corsi)
VALUES(1, 2);
