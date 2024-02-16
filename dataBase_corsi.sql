use corsi;
create table if not exists docenti(
id int auto_increment primary key,
nome varchar(50) not null,
cognome varchar(50) not null,
email varchar(100) unique not null 
);

create table if not exists corsi(
id int auto_increment primary key,
titolo varchar(100) not null,
prezzo decimal(6,2),
docente_id int
);

create table if not exists iscrizioni(
id int auto_increment primary key,
corso_id int not null,
studente_id int not null,
prezzo decimal(6,2),
data_acquisto timestamp null default current_timestamp
);

/*create table if not exists studenti(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(30) not null,
genere enum('m','f','nb'),
indirizzo varchar(100),
citta varchar(30),
provincia char(2) default 'To',
regione varchar(20) default 'Piemonte',
email varchar(100) not null unique,
data_nascita date,
-- primary key
ins timestamp default current_timestamp on update current_timestamp
); */

create table corsi.studenti like tss2024.studenti;
