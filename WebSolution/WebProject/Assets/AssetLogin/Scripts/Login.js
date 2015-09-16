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

$(function () {
    $(".username").focus(function () {
        // $(".user_icon").css("left","-48px");
        $(".user_icon").animate({ left: '-48px' }, 200, function () { });
    });

    $(".username").blur(function () {
        // $(".user_icon").css("left","0px");
        $(".user_icon").animate({ left: '0px' }, 200, function () { });
    });

    $(".password").focus(function () {
        // $(".pass_icon").css("left","-48px");
        $(".pass_icon").animate({ left: '-48px' }, 200, function () { });
    });

    $(".password").blur(function () {
        // $(".pass_icon").css("left","0px");
        $(".pass_icon").animate({ left: '0px' }, 200, function () { });
    });

    $('#FormBase').submit(function () {
        $(".header_description").removeClass("error-message");
        $(".header_description").html("Aguarde enquanto seus dados são validados!!");
        $(".user_icon, .pass_icon, .full_content").css("display", "none");
        $(".loading_bar").css("display", "inline-block");
    });
});

function setErrorOnLogin( message ) {
    $(".user_icon, .pass_icon, .full_content").css("display", "block");
    $(".loading_bar").css("display", "none");

    $(".header_description").addClass("error-message");
    $(".header_description").html(message);

    $("#wrapper").effect("shake", { distance: 25, times: 2, easing: "easeOutCirc" }, 600);
}