CONFIG += c++11
QT += qml quick

android {
    QT += androidextras svg xml
}

HEADERS += $$PWD/src/plugin.h \
           $$PWD/src/core/device.h

SOURCES += $$PWD/src/plugin.cpp \
           $$PWD/src/core/device.cpp

RESOURCES += $$PWD/src/paper.qrc \
             $$PWD/src/core/core.qrc
             
OTHER_FILES = $$PWD/README.md
