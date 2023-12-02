import mysql.connector
from mysql.connector import Error

connection = mysql.connector.connect(host="localhost",
user="root",
passwd="admin",
db="pysports")

cursor = connection.cursor()
query = "DELETE FROM player WHERE first_name = 'Smeagol'"

cursor.execute(query)

connection.commit()

print(cursor.rowcount, "record(s) affected")

connection.close()