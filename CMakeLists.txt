cmake_minimum_required(VERSION 3.1)

project(kesdict
        VERSION 0.1.0
        LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Qt5 COMPONENTS Core Widgets Quick QuickControls2 REQUIRED)

add_executable(${PROJECT_NAME} "src/main.cpp" "src/qml.qrc")
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Widgets Qt5::Quick Qt5::QuickControls2)

install(TARGETS ${PROJECT_NAME}
        RUNTIME DESTINATION bin)

if (UNIX AND NOT APPLE)
    install(FILES src/KesDict.desktop DESTINATION share/applications)
    install(FILES src/kesdict-icon.svg DESTINATION share/icons/hicolor/512x512/apps)
endif()
