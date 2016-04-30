Paper for QtQuick.Controls 2
============================

[![ZenHub.io](https://img.shields.io/badge/supercharged%20by-zenhub.io-blue.svg)](https://zenhub.io)

[![License](https://img.shields.io/github/license/iBeliever/quickpaper.svg)](https://github.com/iBeliever/quickpaper)
[![GitHub release](https://img.shields.io/github/release/iBeliever/quickpaper.svg)](https://github.com/iBeliever/quickpaper)
[![Build Status](https://travis-ci.org/iBeliever/quickpaper.svg?branch=develop)](https://travis-ci.org/iBeliever/quickpaper)
[![GitHub issues](https://img.shields.io/github/issues/iBeliever/quickpaper.svg)](https://github.com/iBeliever/quickpaper/issues)
[![Maintained](https://img.shields.io/maintenance/yes/2016.svg)](https://github.com/iBeliever/quickpaper/commits/master)

Paper is a set of QtQuick components extending QtQuick.Controls for building applications specifically designed with Material Design. It is completely cross platform, and runs on Android, Linux, OS X, and Windows.

**Using QtQuick.Controls 1? Check out [QML Material](https://github.com/papyros/qml-material).**

### Dependencies

 * Qt 5.7 or higher
 * QtQuick.Controls 2

### Per-project installation using QPM

QPM package coming soon!

Just install using:

    qpm install io.papyros.paper

### Per-project installation using git submodules

Add the submodule:

    git submodule add git@github.com:iBeliever/quickpaper.git quickpaper

Add the `.pri` file to your project:

    include(quickpaper/quickpaper.pri)

### System-wide installation

From the root of the repository, run:

    mkdir build; cd build
    qmake ..
    make
    make install # use sudo if necessary

### Icons usage

When using the `Icon` component or the `iconName` property, qml-material looks for icons in the form of `qrc:/icons/<category>/<name>.svg`. Only a core set of icons used by qml-material icons are actually bundled with qml-material. To use icons in your own programs, you can either manually create a qrc file, or you can create `icons.yml` file and use the `icons.py` script from qml-material.

To use the `icons.py` script, create a file called `icons.yml` that looks like this:

    icons:
      - action/settings
      - alert/warning
      - ...

Run `icons.py`, located in the `scripts` folder of the repository. This will download the latest version of all the icons listed in this file, storing them in a folder called `icons`. It also generates a resource file called `icons/icons.qrc`, which you should add to your QMake or CMake project.

Now whenever you add icons to the `icons.yml` file, just rerun `icons.py` and the new icons will be downloaded. To update your icons, just delete the `icons` folder and rerun `icons.py`.


### Licensing

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
