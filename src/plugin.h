/*
 * Paper - Additional Material components for QtQuick.Controls 2
 *
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef PAPER_PLUGIN_H
#define PAPER_PLUGIN_H

#include <QQmlExtensionPlugin>

class PaperPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "io.papyros.Paper")

public:
    void registerTypes(const char *uri);
};

#endif // PAPER_PLUGIN_H
