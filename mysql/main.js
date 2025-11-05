// npm install mysql2

import mysql from "mysql2";

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "dein_passwort",
  database: "testdb"
});

db.connect();

db.query("CREATE TABLE IF NOT EXISTS test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50))");
db.query("INSERT INTO test (name) VALUES ('Hallo Welt')");
db.query("SELECT * FROM test", (err, rows) => {
  if (err) throw err;
  console.log(rows);
  db.end();
});

