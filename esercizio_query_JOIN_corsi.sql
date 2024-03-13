-- USARE SINTASSI JOIN
-- corsi, docenti
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
SELECT docenti.cognome, docenti.nome, docenti.email, corsi.titolo
FROM docenti
JOIN corsi ON docenti.id_corso = corsi.id
ORDER BY docenti.cognome, docenti.nome;

/* 2
Seleziona cognome, nome, email dei docenti
e titolo corso che costa meno di 200€(esclusi)
e ordina per cognome e nome
*/
SELECT docenti.cognome, docenti.nome, docenti.email, corsi.titolo
FROM docenti
JOIN corsi ON docenti.id_corso = corsi.id
WHERE corsi.costo < 200
ORDER BY docenti.cognome, docenti.nome;

/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
SELECT docenti.cognome, docenti.nome, docenti.email
FROM docenti
JOIN corsi ON docenti.id_corso = corsi.id
WHERE corsi.titolo = 'HTML';

/* 4
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
SELECT docenti.cognome, docenti.nome, docenti.email, IFNULL(corsi.titolo, 'Nessun corso assegnato') AS titolo_corso
FROM docenti
LEFT JOIN corsi ON docenti.id_corso = corsi.id
ORDER BY IFNULL(corsi.titolo, 'Nessun corso assegnato'), docenti.cognome, docenti.nome;


/* 5
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I CORSI CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
SELECT docenti.cognome, docenti.nome, docenti.email, IFNULL(corsi.titolo, 'Nessun corso assegnato') AS titolo_corso
FROM corsi
LEFT JOIN docenti ON corsi.id = docenti.id_corso
ORDER BY IFNULL(corsi.titolo, 'Nessun corso assegnato'), docenti.cognome, docenti.nome;


/* 6
Seleziona cognome, nome, email
SOLO DEI DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per cognome e nome
*/
...

/* 7
Seleziona titolo SOLO DEI CORSI 
CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo
*/
SELECT docenti.cognome, docenti.nome, docenti.email
FROM docenti
LEFT JOIN corsi ON docenti.id_corso = corsi.id
WHERE corsi.id IS NULL
ORDER BY docenti.cognome, docenti.nome;


-- studenti, corsi, iscrizioni
/* 8
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per titolo, cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email, corsi.titolo
FROM studenti
JOIN iscrizioni ON studenti.id = iscrizioni.id_studente
JOIN corsi ON iscrizioni.id_corso = corsi.id
ORDER BY corsi.titolo, studenti.cognome, studenti.nome;


/* 9
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email
FROM studenti
JOIN iscrizioni ON studenti.id = iscrizioni.id_studente
JOIN corsi ON iscrizioni.id_corso = corsi.id
WHERE corsi.titolo = 'Java'
ORDER BY studenti.cognome, studenti.nome;


/* 10
Seleziona cognome, nome, email, degli studenti
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email
FROM studenti
JOIN iscrizioni ON studenti.id = iscrizioni.id_studente
JOIN pagamenti ON iscrizioni.id = pagamenti.id_iscrizione
WHERE pagamenti.importo >= 200
ORDER BY studenti.cognome, studenti.nome;


/* 11
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE GLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per titolo, cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email, COALESCE(corsi.titolo, 'Nessun corso') AS titolo_corso
FROM studenti
LEFT JOIN iscrizioni ON studenti.id = iscrizioni.id_studente
LEFT JOIN corsi ON iscrizioni.id_corso = corsi.id
ORDER BY COALESCE(corsi.titolo, 'Nessun corso'), studenti.cognome, studenti.nome;


/* 12
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email, COALESCE(corsi.titolo, 'Nessun corso') AS titolo_corso
FROM corsi
LEFT JOIN iscrizioni ON corsi.id = iscrizioni.id_corso
LEFT JOIN studenti ON iscrizioni.id_studente = studenti.id
ORDER BY COALESCE(corsi.titolo, 'Nessun corso'), studenti.cognome, studenti.nome;


/* 13
Seleziona cognome, nome, email
SOLO DEGLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per cognome e nome
*/
SELECT studenti.cognome, studenti.nome, studenti.email
FROM studenti
LEFT JOIN iscrizioni ON studenti.id = iscrizioni.id_studente
WHERE iscrizioni.id_studente IS NULL
ORDER BY studenti.cognome, studenti.nome;


/* 14
Seleziona titolo del corso
SOLO PER I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
SELECT corsi.titolo
FROM corsi
LEFT JOIN iscrizioni ON corsi.id = iscrizioni.id_corso
WHERE iscrizioni.id_corso IS NULL
ORDER BY corsi.titolo;

