# This code does not execute properly. Try to figure out why.
# SELECT price + amount AS total FROM items
SELECT price * amount AS total FROM items

# some people are unamused
DROP TABLE items;
CREATE TABLE items (total FLOAT);
INSERT INTO items (total) VALUES (20);
INSERT INTO items (total) VALUES (45);
INSERT INTO items (total) VALUES (80);
SELECT total FROM items;

#
SELECT 
CASE WHEN CAST(price AS float) IS NULL
  THEN 0.0
  ELSE CAST(price AS float) 
  END
*
CASE WHEN CAST(amount AS float) IS NULL 
    THEN 0.0
    ELSE CAST(amount AS float)
    END
    AS total 
FROM items
