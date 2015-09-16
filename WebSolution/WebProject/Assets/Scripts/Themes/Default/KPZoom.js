/*
 * Copyright 2011-2015 Numeric Technology
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

var MAXIMIZED = "maximized";
var MINIMIZED = "minimized";
var NORMAL = "normal";

var DEFAULT_WINDOW_CONTAINER = ".Content";
var DEFAULT_WINDOW_MIN_WIDTH = 150;
var DEFAULT_WINDOW_MIN_HEIGHT = 150;

KPZoomWindow = function (isModal, width, height, data, container) {
    setModal(isModal);

    if (isNotSetVariable(container) || isEmptyOrNull(container)) {
        container = DEFAULT_WINDOW_CONTAINER;
    }

    var windowWidth = validateSize(width, 400);
    var windowHeight = validateSize(height, 300);

    var KPLocalZoomWindow = $(".KPWindow.KPFormWindow.KPFormZoom");

    KPLocalZoomWindow.attr("state", NORMAL);
    KPLocalZoomWindow.css("z-index", "999");

    KPLocalZoomWindow.draggable({
        iframeFix: true,
        handle: ".KPFormTitle",
        stack: ".KPWindow",
        start: function (event) {
            if (KPLocalZoomWindow.attr("state") != NORMAL) {
                event.preventDefault();
            } else {
                //add a mask over the Iframe to prevent IE from stealing mouse events
                KPLocalZoomWindow.append(getWindowMaskString());
            }
        },
        stop: function (event, ui) {
            //remove mask when dragging ends
            $("#IframeMask").remove();
        },
        drag: function (event) {
            if (KPLocalZoomWindow.attr("state") != NORMAL) {
                event.preventDefault();
            }
        },
        containment: container
    });

    KPLocalZoomWindow.css("display", "block");
    KPLocalZoomWindow.css("width", windowWidth + "px");
    KPLocalZoomWindow.css("height", windowHeight + "px");
    KPLocalZoomWindow.center(20); //20 because, 40 is the height of the KPActionBar

    KPLocalZoomWindow.resizable({
        iframeFix: true,
        grid: 10,
        minWidth: DEFAULT_WINDOW_MIN_WIDTH,
        minHeight: DEFAULT_WINDOW_MIN_HEIGHT,
        start: function (event, ui) {
            //add a mask over the Iframe to prevent Browsers from stealing mouse events
            KPLocalZoomWindow.append(getWindowMaskString());
        },
        stop: function (event, ui) {
            //remove mask when dragging ends
            $("#IframeMask").remove();
        }
    });

    function getWindowMaskString() {
        return "<div id=\"IframeMask\" style=\"background-image:url(/Assets/Imgs/Themes/Default/spacer.png); position: absolute; z-index: 2; left: 0pt; top: 0pt; right: 0pt; bottom: 0pt;\"></div>"
    }

    return KPLocalZoomWindow;
};

function closeZoomWindow(extraScript) {
    setModal(false);

    if (!isNotSetVariable(extraScript)) {
        eval(extraScript);
    }
}

