# kesdict

This project is written in pure QML and aim to work on different platforms, albeit with a focus on KDE Plasma 5.

## Development

### C++ Laucher

The C++ code is a simple basic laucher, to use it, run

```
mkdir build && cd build
cmake ..
make
./kesdict
```

Note: The binary `kesdict` has all the QML and JS files bundled.

### QML

Since it is written in pure QML, you can start the application with the command `qmlscene standalone.qml`.
