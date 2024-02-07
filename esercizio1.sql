/* 1:
Crea una tabella chiamata "prodotti" con i seguenti campi:
- id (intero, chiave primaria)
- nome (stringa di lunghezza massima 50 caratteri)
- prezzo (decimale(6,2))
- quantita (intero)
nb: il valore relativo alla quantità non deve essere superiore a 100
*/
create table if not exists prodotti (
id int auto_increment primary key,
nome varchar(50),
prezzo decimal,
quantita tinyint

);

/* 2:
Modifica la tabella "prodotti" aggiungendo un nuovo campo chiamato "descrizione" di tipo testo.
Inserite il nuovo campo dopo il campo "nome"
*/
alter table prodotti
add descrizione varchar(50) after nome;


/* 3:
Crea una tabella chiamata "ordini" con i seguenti campi:
- id (intero, chiave primaria)
- data_ordine (data)
- totale (decimale(10,2))
- id_cliente (intero)
*/
create table if not exists ordini(
id int auto_increment primary key,
data_ordine date,
total decimal,
id_cliente tinyint
);

/* 4:
Crea una tabella chiamata "clienti" con i seguenti campi:
- id (intero, chiave primaria)
- nome (stringa di lunghezza massima 30 caratteri)
- cognome (stringa di lunghezza massima 30 caratteri)
- email (stringa di lunghezza massima 100 caratteri)
- provincia (stringa di 2 caratteri)
*/
create table if not exists clienti(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(30),
email varchar(100) not null unique,
rovincia char(2)
);

/* 5:
Modifica la tabella "clienti":
modifica la lunghezza massima del campo cognome da 30 caratteri a 50, 
aggiungi un nuovo campo chiamato "telefono" dopo il cognome, di tipo stringa di lunghezza massima 20 caratteri.
Scrivi un unica query.
*/
alter table clienti 
modify cognome varchar(50),
add telefono varchar(20) after cognome; 

/* 6:
Crea le tabelle "americhe", "europa", "africa" (3 query)
Le tabelle hanno i seguenti attributi:
- id (intero, chiave primaria)
- stato (stringa di lunghezza massima 50 caratteri)
- capitale (stringa di lunghezza massima 50 caratteri)
*/

create table if not exists america(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists europa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists africa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);


/* 7
Crea una tabella chiamata "libro" con i seguenti campi:
- id (intero, chiave primaria)
- titolo (stringa di lunghezza massima 100 caratteri)
- prezzo (decimale(6,2))
- pagine (intero)
- id_editore (intero)
*/

create table if not exists libro(
id int auto_increment primary key,
titolo varchar(100),
prezzo decimal,
pagine tinyint,
id_editore tinyint
);

/* 8:
Rinomina la tabella "clienti": il nuovo nome è "customers".
*/

alter table clienti rename to customers;
