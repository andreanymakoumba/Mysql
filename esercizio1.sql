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
provincia char(2)
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

use tss2024;
-- Esercizio 2

/* 
Crea una "insert" unica per ogni tabella, le query risultanti saranno tre
*/
/* 
inserisci i seguenti record:

Tabella "americhe":
1) Stati Uniti, New York
2) Canada, Ottawa   
3) Brasile, Brasilia 
*/

insert into america(stato, capitale)
values('Stati Uniti', 'New York'),
('Canada', 'Ottawa'), ('Brasile','Brasilia');
select * from america;

/* 
Tabella "africa":
1) Egitto, Il Cairo      
2) Sudafrica, Port Elizabeth
3) Marocco, Rabat    
*/
insert into africa(stato, capitale)
values('Cameroun', 'Douala'),
('Repubblica Democratica del congo', 'Kinshasa'), ('Congo','Brazzaville');
select * from africa;

/* 
Tabella "europa":
1) Italia, Roma
2) Francia, Lione
3) Germania, Berlino
*/
insert into europa(stato, capitale)
values('Italia', 'Roma'),
('Francia', 'parigi'), ('Germania','Berlino');
select * from europa;

/* 2:
Aggiorna il record relativo alla capitale degli Stati Uniti con il valore corretto:
Washington D.C.
*/
update america
set capitale = 'Washington D:C'
where capitale = 'New York';

-- per cancellare la tabella dato che avevo fatto un errore
delete from america;

/* 3:
Aggiorna il record relativo alla capitale del Sudafrica con il valore corretto:
Città del Capo
*/
/* 
sicoome avevo cambiato i nomi , sono dovuto andare a modificare in base a quello
che avevo scritto preccedentemente (scusi prof)
*/
update africa
set capitale = 'Douala'
where capitale = 'Yaounde';


/* 4:
Aggiorna il record relativo alla capitale della Francia con il valore corretto:
Parigi
*/
-- stessa cosa anche per questo esercizio 

update europa
set capitale = 'Lione'
where capitale = 'Parigi';


/* 5:
inserisci nella tabella libro i record seguenti:
1)

titolo: Marcovaldo
prezzo: 13.00
pagine: 204
editore_id: 1
2)
titolo: La coscienza di Zeno
prezzo: 14.00
pagine: 664
editore_id: 2
3)
titolo: Furore
prezzo: 12.50
pagine: 478
editore_id: 1
4)
titolo: Il Piccolo Principe
prezzo: 10.50
pagine: 124
editore_id: 1

ATTENZIONE: Crea una "insert" unica
*/
alter table libro modify prezzo decimal(6.2);
alter table libro modify pagine float;

insert into libro(titolo, prezzo, pagine, id_editore)
values('Marcovaldo', '13.00', '204', '1'),
('La coscienza di Zeno', '14.00','664','2'), 
(' Furore','12.50','478',' 1'),
(' Il Piccolo Principe','10.50','124','1');
select * from libro;


/* 6:
inserisci nella tabella clienti i record seguenti:
1)
nome: Pippo
cognome: Costanzo
telefono: 3212345678
email: pippo.costanzo@gmail.com
provincia: to
2)
nome: Maria
cognome: Filippi
telefono: 3332345687
email: maria.filippi@gmail.com
provincia: mi
3)
nome: Mario
cognome: Liberato
telefono: 3357000678
email: mario.liberato@gicloud.com
provincia: cn
4)
nome: Grazia
cognome: Alcanto
telefono: 3212345678
email: graziaalcanto@gmail.com
provincia: mi
5)
nome: Francesco
cognome: Franco
telefono: 3481112345
email: franco.francesco@icloud.com
provincia: mi

ATTENZIONE: Crea una "insert" unica
*/

insert into clienti(nome, cognome, telefono, email, provincia)
values(' Pippo', 'Costanzo', '3212345678', 'pippo.costanzo@gmail.com','to'),
('Maria', 'Filippi','3332345687','maria.filippi@gmail.com','mi'), 
('Mario','Liberato','3357000678','mario.liberato@gicloud.com','cn'),
('Grazia','Alcanto','3212345678','graziaalcanto@gmail.com','mi'),
(' Francesco','Franco','3481112345','franco.francesco@icloud.com','mi');
select * from clienti;

/* 7:
Aggiorna la provincia (tabella clienti) con il valore 'al' solo per i clienti la cui provincia è 'mi'
*/
update clienti
set provincia = 'al'
where provincia = 'mi';

/* 8:
Cancella dalla tabella clienti i record la cui provincia è = 'al'
*/
delete from clienti 
where provincia = 'al';
