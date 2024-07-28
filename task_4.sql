-- Prints the full description of the table books in my MySQL server
SHOW CREATE TABLE `books`;
-- Prints the full description of the table Books in my MySQL server
SELECT COLUMN_NAME, COLUMN_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store'
  AND TABLE_NAME = 'Books';
