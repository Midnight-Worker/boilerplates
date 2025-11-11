#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtSql>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("testdb");
    db.setUserName("root");
    db.setPassword("dein_passwort");

    if (db.open()) {
        QSqlQuery q;
        q.exec("CREATE TABLE IF NOT EXISTS test (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50))");
        q.exec("INSERT INTO test (name) VALUES ('Hallo Welt')");
    }

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}

