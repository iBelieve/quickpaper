/*
 * Paper - Additional Material components for QtQuick.Controls 2
 *
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtGraphicalEffects 1.0

RectangularGlow {
    property var shadow
    property var sourceRadius
    property bool fullWidth: false
    property bool fullHeight: false

    anchors {
        centerIn: parent
        verticalCenterOffset: shadow.offset
    }

    width: parent.width + 2 * shadow.spread + (fullWidth ? 2 * cornerRadius : 0)
    height: parent.height + 2 * shadow.spread + (fullHeight ? 2 * cornerRadius : 0)
    glowRadius: shadow.blur/2
    spread: 0.05
    cornerRadius: shadow.blur + (sourceRadius || 0)
}
