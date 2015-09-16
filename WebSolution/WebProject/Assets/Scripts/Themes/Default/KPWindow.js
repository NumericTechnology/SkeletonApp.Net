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

KPWindow = function (title, url, isModal, width, height, data, container) {
    setModal(isModal);

    if (isNotSetVariable(container) || isEmptyOrNull(container)) {
        container = DEFAULT_WINDOW_CONTAINER;
    }

    var windowWidth = validateSize(width, 400);
    var windowHeight = validateSize(height, 300);

    // var KPIframe = $("<iframe style='border: none'></iframe>").appendTo(container);
    // var KPLocalWindow = $("<div class='KPWindow Loading'></div>").appendTo(KPIframe);
    // var KPLocalWindow = $("<div class='KPWindow'></div>").appendTo(container);

    var windowString = "<div class='KPWindow KPFormWindow' style='padding-top: 34px;'>" +
                       "   <div class='KPFormTitle'>" +
                       "      <p class='KPTitleLabel'>" + title + "</p>" +
                       "      <img class='KPCloseButton' src='/Assets/Imgs/Themes/Default/window-close.png'>" +
                       "   </div>" +
                       "</div>";

    var KPLocalWindow = $(windowString).appendTo(container);
    var KPWindowFrame = $("<iframe style='border: none; width:100%; height:100%;' frameBorder='no' scrolling='no' src='" + url + "'></iframe>");
    KPWindowFrame.uniqueId();
    KPLocalWindow.append(KPWindowFrame);

    KPLocalWindow.attr("state", NORMAL);

    KPLocalWindow.draggable({
        iframeFix: true,
        handle: ".KPFormTitle",
        stack: ".KPWindow",
        start: function (event) {
            if (KPLocalWindow.attr("state") != NORMAL) {
                event.preventDefault();
            } else {
                //add a mask over the Iframe to prevent IE from stealing mouse events
                KPLocalWindow.append(getWindowMaskString());
            }
        },
        stop: function (event, ui) {
            //remove mask when dragging ends
            $("#IframeMask").remove();
        },
        drag: function (event) {
            if (KPLocalWindow.attr("state") != NORMAL) {
                event.preventDefault();
            }
        },
        containment: container
    });

    // KPLocalWindow.css("display", "block");
    // KPLocalWindow.css("height", windowHeight + "px");
    // KPLocalWindow.css("width", windowWidth + "px");

    var KPCloseButton = KPLocalWindow.find(".KPCloseButton");
    KPCloseButton.click(function (event) {
        var innerDoc = KPWindowFrame.get(0).contentDocument || KPWindowFrame.get(0).contentWindow.document;
        var closeButton = $(innerDoc).find(".KPActionBar input.KPFormCloseButton");
        if (closeButton && closeButton.length > 0) {
            closeButton.click();
        } else {
            KPLocalWindow.remove();
            setModal(false);
        }
    });

    KPLocalWindow.css("display", "block");
    KPLocalWindow.css("width", windowWidth + "px");
    KPLocalWindow.css("height", windowHeight + "px");
    KPLocalWindow.center();

    KPLocalWindow.resizable({
        iframeFix: true,
        grid: 10,
        minWidth: DEFAULT_WINDOW_MIN_WIDTH,
        minHeight: DEFAULT_WINDOW_MIN_HEIGHT,
        start: function (event, ui) {
            //add a mask over the Iframe to prevent Browsers from stealing mouse events
            KPLocalWindow.append(getWindowMaskString());
        },
        stop: function (event, ui) {
            //remove mask when dragging ends
            $("#IframeMask").remove();
        }
    });


    function getWindowMaskString() {
        return "<div id=\"IframeMask\" style=\"background-image:url(/Assets/Imgs/Themes/Default/spacer.png); position: absolute; z-index: 2; left: 0pt; top: 0pt; right: 0pt; bottom: 0pt;\"></div>"
    }

    return KPLocalWindow;
};

function closeWindow(id, extraScript) {
    $(".KPWindow.KPFormWindow").remove();
    setModal(false);

    if (!isNotSetVariable(extraScript)) {
        eval(extraScript);
    }
}

function reloadPanel(id) {
    if ($("#" + id).length > 0) {
        __doPostBack(id, '');
    }
}

function setWindowTitle(title) {
    $('.KPWindow.KPFormWindow .KPFormTitle .KPTitleLabel', window.parent.document).last().html(title);
}