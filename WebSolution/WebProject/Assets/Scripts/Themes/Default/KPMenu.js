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

(function ($) {
    $.fn.KPMenu = function (opts) {
        var $ddMenu = $(this).find(".DropdownMenu"),
            options = $.extend({
                activate: activateSubmenu,
                deactivate: deactivateSubmenu
            }, opts);

        $ddMenu = $ddMenu.menuAim(options);

        $ddMenu.find("li").click(function () {
            var link = $(this).find("a");
            if (link.hasClass("MaintainHover")) {
                link.removeClass("MaintainHover");
                deactivateSubmenu(this);
            } else {
                $ddMenu.find("li").each(function () {
                    var link = $(this).find("a");
                    link.removeClass("MaintainHover");
                    deactivateSubmenu(this);
                });

                link.addClass("MaintainHover");
                activateSubmenu(this);
            }
        });

        $(this).find(".MenuItem .MenuItemTitle").click(function () {
            if ($ddMenu.hasClass("DropdownMenuHidden")) {
                $ddMenu.removeClass("DropdownMenuHidden");
                openMenu();
            } else {
                closeMenu();
            }
        });

        function activateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId),
                offset = $ddMenu.offset(),
                height = $ddMenu.outerHeight(),
                width = $ddMenu.outerWidth();

            // Show the submenu
            $submenu.css({
                display: "block",
                top: offset.top,
                left: offset.left + width - 5  // main should overlay submenu
                //  height: height - 4  // padding for main dropdown's arrow
            });

            // Keep the currently activated row's highlighted look
            $row.find("a").addClass("MaintainHover");
        };

        function deactivateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId);

            // Hide the submenu and remove the row's highlighted look
            $submenu.css("display", "none");
            $row.find("a").removeClass("MaintainHover");
        };

        return this;
    };
})(jQuery);


function openMenu() {
    var mainMenu = $(".DropdownMenu");
    mainMenu.removeClass("DropdownMenuHidden");
    mainMenu.parent().find(".MenuItemTitle").addClass("MenuItemTitleToggle");
    mainMenu.closest(".MainMenuBar").addClass("MainMenuBarToggle");
    
}

function closeMenu() {
    var mainMenu = $(".DropdownMenu");
    mainMenu.addClass("DropdownMenuHidden");
    mainMenu.find(".MaintainHover").removeClass("MaintainHover");
    mainMenu.menuAim.deactivateAll();

    mainMenu.parent().find(".MenuItemTitle").removeClass("MenuItemTitleToggle");
    mainMenu.closest(".MainMenuBar").removeClass("MainMenuBarToggle");
    
    $(".PopOverMenu").css("display", "none");
}

