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

// http://jqueryui.com/tabs/#manipulation
var tabHeaderTemplate = '<li><a href="#{tabId}">{tabTitle}</a><span class="ui-icon ui-icon-close" role="presentation">Remover Aba</span></li>',
    tabContentTemplate = '<iframe id="{tabId}" scrolling="no" class="KPIframeTab" src="{tabUrl}" frameBorder="no"></iframe>';

(function($) {
    $.fn.KPTab = function(opts, isSortable) {
        var options = $.extend({ heightStyle: "fill" }, opts);

        var $KPLocalTab = $(this).tabs(options);

        if (isSortable) {
            $KPLocalTab.find( ".ui-tabs-nav" ).sortable({
                axis: "x",
                // placeholder: "KPHighlightTab",
                stop: function () {
                    $KPLocalTab.tabs("refresh");
                }
            });
        }

        // define the action when user click at the close button
        $KPLocalTab.delegate( "span.ui-icon-close", "click", function() {
            var panelId = $(this).closest("li").remove().attr("aria-controls");
            $("#" + panelId).remove();
            $KPLocalTab.tabs("refresh");
        });
        return this;
    };
})(jQuery);

/**
 * This method adds one new tab.
 *
 * How to use:
 * addNewTab("KPTabControl", "Usuários", "User.aspx");
 * addNewTab("KPTabControl", "Contatos", "Form/Operacional/Cadastro/FrmContato.aspx")
 */
function addNewTab(mainTabId, title, url) {
    closeMenu();
    var mainTab = $("#" + mainTabId);
    var mainTabsContent = $("#" + mainTabId + " .KPTabsContent");

    var tabTotal = mainTabsContent.children().length,
        id = "tab-" + (tabTotal + 1),
        tabHeader = $(tabHeaderTemplate.replace(/\{tabId\}/g, id).replace(/\{tabTitle\}/g, title)),
        tabContent = $(tabContentTemplate.replace(/\{tabId\}/g, id).replace(/\{tabUrl\}/g, url));

    mainTab.find(".ui-tabs-nav").append(tabHeader);
    mainTabsContent.append(tabContent);

    mainTab.tabs("refresh");
    mainTab.tabs("option", "active", tabTotal);
}
