#include <QApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(QStringLiteral(":/kesdict-icon.svg")));

#ifdef Q_OS_WIN
    QQuickStyle::setStyle(QStringLiteral("Universal"));
#elif defined(Q_OS_MACOS)
    QQuickStyle::setStyle(QStringLiteral("macintosh"));
#endif

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/modules"));
    engine.load(QUrl(QStringLiteral("qrc:/standalone.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
