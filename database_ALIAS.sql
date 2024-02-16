select * from corsi;
select * from docenti;

select cognome, nome, titolo, docenti.id, corsi.docente_id
from docenti, corsi
where docenti.id = corsi.docente_id
order by cognome;

-- condizioni di join (n-1) dove n è 
select cognome, nome, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
order by cognome;

alter table iscrizioni modify studente_id int after id; 
desc docenti;

select s.cognome `Cognome studente`, s.nome `Nome studente`, 
titolo `corso`, d.cognome `Cognome docente`
from studenti s, corsi c, iscrizioni i, docenti d
where s.id = i.studente_id
and c.id = i.corso_id
and d.id = c.docente_id
order by `Cognome studente`;
