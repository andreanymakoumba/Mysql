-- STEP 1
-- Creare database libro
-- assegnare i privilegi all'utente app_tss
-- esegiure lo script di creazione tabelle e popolamento dei record fornito su classroom

-- STEP 2
-- individuare le FOREIGN KEY
-- aggiungere le FOREIGN KEY in modo che:
-- quando voglio eliminare un editore se ci sono righe della tabella libri che lo contengono blocco l'operazione
-- se aggiorno l'identifcativo dell'editore aggiorno le chiavi esterne corrispondenti nella tabella libri

-- quando voglio eliminare un libro se ci sono righe della tabella autori_libri che lo contengono elimino a cascata
-- se aggiorno l'identifcativo del libro aggiorno le chiavi esterne corrispondenti nella tabella autore_libri
-- quando voglio eliminare un autore se ci sono righe della tabella autori_libro che lo contengono blocco l'operazione
-- se aggiorno l'identifcativo dell'autore aggiorno le chiavi esterne corrispondenti nella tabella autore_libri
-- scrivere di seguito l'SQL
...
  -- Creazione della tabella autori_libri che collega autori a libri
CREATE TABLE autori_libri (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_autore INT,
    id_libro INT,
    FOREIGN KEY (id_autore) REFERENCES autori(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_libro) REFERENCES libri(id) ON UPDATE CASCADE ON DELETE CASCADE
);
...

-- provate ad eliminare un editore per il quale ci sono libri a catalogo (esiste editore_id in tabella libri)
-- provate con editore_id = 1
DELETE FROM libri WHERE editore_id = 1;

-- Ora puoi eliminare l'editore con editore_id = 1
DELETE FROM editori WHERE id = 1;
...
-- se avete implementato correttamente le foreign key l'operazione viene bloccata

-- se proprio volete eliminare quell'editore devo eliminare prima i record figli nella tabella libri
-- eliminate i record con editore_id = 1 dalla tabella libri
...
  DELETE FROM libri WHERE editore_id = 1;

-- provate ad eleiminare un editore per il quale NON ci sono libri a catalogo (NON esiste editore_id in tabella libri)
-- provate con editore_id = 11
...
DELETE FROM editori WHERE id = 11;
-- il record viene eliminato
si perché non esiste editore_id = 11 nella tabella libri.
  
-- provate ad eliminare un libro a cui sono asssociati gli autori
-- provate con libro_id = 14
...
  DELETE FROM libri WHERE id = 14;

-- il record viene eliminato e a cascata vengono eliminate le righe nella tabella autori_libri che contengono libro_id eliminato

-- provate ad eliminare un autore a cui sono asssociati dei libri
-- provate con autore_id = 15
...
  DELETE FROM autori WHERE id = 15;
-- se avete implementato correttamente le foreign key l'operazione viene bloccata
