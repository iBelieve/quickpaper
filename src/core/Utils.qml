/*
 * Paper - Additional Material components for QtQuick.Controls 2
 *
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.6

pragma Singleton

/*
 * A collection of helpful utility methods. Currently the only utility methods are for
 * working with colors.
 */
QtObject {
    /**
     * A utility method for changing the alpha on colors. Returns a new object, and does not
     * modify the original color at all.
     *
     * @param type:color color The color to change the alpha of.
     * @param type:real alpha The alpha to set on the color.
     * @return type:color A copy of the original color with the alpha set to the specified
     *                    alpha value.
     */
    function alpha(color, alpha) {
        // Make sure we have a real color object to work with (versus a string like "#ccc")
        var realColor = Qt.darker(color, 1)

        realColor.a = alpha

        return realColor
    }

    /**
     * Select a color depending on whether the background is light or dark.
     *
     * @param type:color background The background color to test against.
     * @param type:color lightColor The color used on a light background.
     * @param type:color darkColor is the color used on a dark background.
     * @return type:color The \c lightColor or \c darkColor, based on the background color.
     */
    function lightDark(background, lightColor, darkColor) {
        return isDarkColor(background) ? darkColor : lightColor
    }

    /**
     * Returns \c true if the color is dark and should have light content on top.
     *
     * @param type:color color The color to test.
     * @return type:bool \c true if the color is dark.
     */
    function isDarkColor(color) {
        var temp = Qt.darker(color, 1)

        var a = 1 - ( 0.299 * temp.r + 0.587 * temp.g + 0.114 * temp.b);

        return temp.a > 0 && a >= 0.3
    }
}
