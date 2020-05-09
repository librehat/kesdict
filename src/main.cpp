#include <QApplication>
#include <QIcon>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(QStringLiteral(":/kesdict-icon.svg")));

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/modules"));
    engine.load(QUrl(QStringLiteral("qrc:/standalone.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}