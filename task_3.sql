-- Create a stored procedure to list tables in a specific database
DELIMITER //
CREATE PROCEDURE ListTables(IN dbName VARCHAR(255))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(255);
    DECLARE cur CURSOR FOR
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = dbName;

    -- Create a temporary table to store table names
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_tables (table_name VARCHAR(255));

    -- Open the cursor
    OPEN cur;

    -- Fetch table names and insert into the temporary table
    read_loop: LOOP
        FETCH cur INTO tableName;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO temp_tables (table_name) VALUES (tableName);
    END LOOP;

    -- Close the cursor
    CLOSE cur;

    -- Select table names from the temporary table
    SELECT table_name FROM temp_tables;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_tables;
END //
DELIMITER ;

-- Call the stored procedure to list tables in alx_book_store
CALL ListTables('alx_book_store');
SHOW TABLES;
USE alx_book_store;