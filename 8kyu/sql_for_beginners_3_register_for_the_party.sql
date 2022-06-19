-- You received an invitation to an amazing party. Now you need to write an insert statement to add yourself to the table of participants.

-- participants table schema

--     name (string)
--     age (integer)
--     attending (boolean)
INSERT INTO participants
VALUES ('Joe Shmoe',89,true);

SELECT * FROM participants;

-- list the field names
INSERT into participants (name, age, attending)
