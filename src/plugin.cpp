/*
 * Paper - Additional Material components for QtQuick.Controls 2
 *
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include "plugin.h"

#include <QtQml>

#include "core/device.h"

class PaperRegisterHelper {

public:
    PaperRegisterHelper(const char *uri) {
        qmlRegisterSingletonType<Device>(uri, 0, 1, "Device", Device::qmlSingleton);
    }
};

void PaperPlugin::registerTypes(const char *uri)
{
    // @uri Material
    Q_ASSERT(uri == QStringLiteral("Paper"));

    PaperRegisterHelper helper(uri);
}

// When using QPM, the C++ plugin is not used and the QML types must be registered manually
#ifdef QPM_INIT
    static PaperRegisterHelper registerHelper("Paper");
#endif
