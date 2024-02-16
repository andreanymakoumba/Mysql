/*
1
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome è uguale a 'verdi' e ordinate per cognome
*/
use tss2024;
show grants for current_user;

select cognome,nome,email,data_nascita
from studenti   
where cognome like 'verdi%' order by nome;

/*
2
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'femmina' e ordinate per cognome
*/
select cognome,nome,email,data_nascita
from studenti   
where genere like 'f%' order by nome;

/*
3
seleziona il cognome, il nome, la città, l'email e la data di nascita
dalla tabella studenti
la cui città NON è 'Torino' e ordinate per città e per cognome
*/
select cognome,nome,citta,email,data_nascita
from studenti   
where Not citta='Torino' order by cognome, citta;

/*
4
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è maggiore dell'anno 2000 compreso
ordinate per data di nascita dalla più recente alla più remota
*/
select cognome,nome,email,data_nascita
from studenti   
where data_nascita >'$2000' order by cognome, citta;

/*
5
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'maschio' e la provincia è 'Alessandria' e ordinate per cognome
*/

select cognome,nome,email,data_nascita
from studenti   
where genere='m' and provincia='AL' order by cognome;


/*
6
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui provincia è Asti o Novara e ordinate per provincia, cognome e nome
*/

select cognome,nome,email,data_nascita
from studenti   
where provincia='At' or provincia='No' order by cognome,nome;

/*
7
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui provincia è Cuneo o Asti o Novara o Alessandria e ordinate per provincia, cognome e nome
*/

select cognome,nome,email,data_nascita
from studenti   
where provincia regexp'^At|No|Al$' order by cognome,nome;

/*
8
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è compresa tra il 1990 e il 2000
e il cui genere è 'femmina' e ordinate per data di nascita dalla più recente alla più remota
*/

select cognome,nome,email,data_nascita
from studenti   
where data_nascita between '1990-01-01' and '2000-12-31' and genere= 'f' order by data_nascita desc;
