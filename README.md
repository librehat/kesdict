# kesdict
An unofficial SpanishDict application.

This project is written in pure QML and JavaScript. It runs on all major desktop platforms, but the focus is on the KDE Plasma 5 environment hence the letter _K_ in the name.

![Screenshot (KDE)](https://github.com/librehat/kesdict/raw/master/screenshots/kesdict_kde.png)

## Standalone Application
Any platforms that have Qt Quick 2.0 support can run this application in the standalone mode.

### Requirements 
 - Qt 5 >= 5.12
 - CMake >= 3.1
 - C++ Compiler (>= C++11)

### Installation
```bash
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
make install
```

Then you can run `kesdict` from the terminal, or launch it from the applications menu.

## KDE Plasma 5 Applet
Applet-specific code can be found in `src/plasmoid` directory. QML and JS files that are shared between the standalone application and the applet are put under the QML module `KesDict` in `src/KesDict` directory.

### Development
For quick development, execute `./run_plasmoid.sh` to test the updated source code without the need of installation.

To distribute, run `./build_plasmoid.sh`. A new plasmoid will be packaged under `dist` directory with the contents from `src/plasmoid`.

### Installation
Recommended: Install from KDE Store.
Alternative: `plasmapkg2 -i com.librehat.kesdict-<version>.plasmoid`

---------------------------------------------------

Disclaimer: This project is in no way affiliated with SpanishDict. Use at your own risk.
