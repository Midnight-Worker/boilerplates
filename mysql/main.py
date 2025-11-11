# pip install mysql-connector-python

import mysql.connector

con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="dein_passwort",
    database="testdb"
)

cur = con.cursor()
cur.execute("CREATE TABLE IF NOT EXISTS test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50))")
cur.execute("INSERT INTO test (name) VALUES ('Hallo Welt')")
con.commit()

cur.execute("SELECT * FROM test")
for row in cur:
    print(row)

con.close()

