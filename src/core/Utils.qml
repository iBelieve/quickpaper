/*
 * Paper - Additional Material components for QtQuick.Controls 2
 *
 * Copyright (C) 2014-2016 Michael Spencer <sonrisesoftware@gmail.com>
 *               2015 Bogdan Cuza <bogdan.cuza@hotmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.6

pragma Singleton

QtObject {
    /*!
       A utility method for changing the alpha on colors. Returns a new object, and does not modify
       the original color at all.
     */
    function alpha(color, alpha) {
        // Make sure we have a real color object to work with (versus a string like "#ccc")
        var realColor = Qt.darker(color, 1)

        realColor.a = alpha

        return realColor
    }

    /*!
       Select a color depending on whether the background is light or dark.

       \c lightColor is the color used on a light background.

       \c darkColor is the color used on a dark background.
     */
    function lightDark(background, lightColor, darkColor) {
        return isDarkColor(background) ? darkColor : lightColor
    }

    /*!
       Returns true if the color is dark and should have light content on top
     */
    function isDarkColor(background) {
        var temp = Qt.darker(background, 1)

        var a = 1 - ( 0.299 * temp.r + 0.587 * temp.g + 0.114 * temp.b);

        return temp.a > 0 && a >= 0.3
    }
}
