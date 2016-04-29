TEMPLATE = lib
TARGET = paper

CONFIG += c++11
QT += qml quick

android {
    QT += androidextras svg xml
}

HEADERS += plugin.h \
           core/device.h

SOURCES += plugin.cpp \
           core/device.cpp

target.path = $$[QT_INSTALL_QML]/Paper

material.files += qmldir \
                  core/*
material.path = $$[QT_INSTALL_QML]/Paper

listitems.files += listitems/*
listitems.path = $$[QT_INSTALL_QML]/Paper/ListItems

qmldir.target = $$[QT_INSTALL_QML]/Paper/qmldir
qmldir.commands = sed \"s/$$LITERAL_HASH plugin paper/plugin paper/\" $$PWD/qmldir > $$qmldir.target
qmldir.depends = $$PWD/qmldir
qmldir.path = $$[QT_INSTALL_QML]/Paper

INSTALLS += target material listitems qmldir

OTHER_FILES += $$material.files $$listitems.files 
