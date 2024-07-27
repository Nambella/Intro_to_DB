import mysql.connector

def create_database():
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(host="localhost",user="root",passwd="Namrud@1709")

        # Create a cursor
        cursor = connection.cursor()

        # Create the database if it doesn't exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
      

