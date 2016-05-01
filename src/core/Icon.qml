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

import QtQuick 2.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import Paper 0.1

/**
 * @brief Displays an icon from the Material Design icon collection.
*/
Item {
    id: icon

    /**
     * The color of the icon. Defaults to \c Theme.light.iconColor. For dark backgrounds, use
     * \c Theme.dark.iconColor.
     */
    // FIXME: Theme doesn't exist in QtQuick.Controls 2, so use a property on the
    // Material attached property.
    property color color: Theme.light.iconColor

    /**
     * The size of the icon. Defaults to 24dp.
     */
    property real size: 24

    /**
     * The name of the icon to display.
     *
     * @sa source
     */
    property string name

    /**
     * A URL pointing to an image to display as the icon. By default, this is
     * a special URL representing the icon named by \ref name from the Material Design
     * icon collection or FontAwesome. The icon will be colorized using the specified \ref color,
     * unless you put ".color." in the filename, for example, "app-icon.color.svg", or set the
     * \ref colorize property to \c false.
     *
     * @sa name
     */
    property string source: name ? "icon://" + name : ""

    /**
     * \c true if the icon is valid and fully loaded.
     */
    readonly property bool valid: image.status == Image.Ready

    /**
     * Set to \c false if you want the icon to use the original image's colors and not be
     * colored using the specified \ref color.
     */
    property bool colorize: icon.source.indexOf(".color.") === -1

    width: size
    height: size

    Image {
        id: image

        anchors.fill: parent
        visible: !colorize

        source: {
            if (icon.source.indexOf('icon://') === 0) {
                var name = icon.source.substring(7)

                if (name)
                    return "qrc:/icons/" + name + '.svg'
                else
                    return ""
            } else {
                return icon.source
            }
        }

        sourceSize {
            width: size * Screen.devicePixelRatio
            height: size * Screen.devicePixelRatio
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: Utils.alpha(icon.color, 1)
        cached: true
        visible: icon.valid && colorize
        opacity: icon.color.a
    }
}
