// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap

//= require_tree .
//IF YOU NEED TO REFRESH PAGE FOR IT TO LOAD THEN REMOVE = require turbolinks
// http://stackoverflow.com/questions/17881384/jquery-gets-loaded-only-on-page-refresh-in-rails-4-application


//TROUBLESHOOTING: If script does not load the first time, only after refreshing web page
// Answer is to put code that calls for jquery in the views/layout/application.html.erb insidse body intead of head
//https://forum.jquery.com/topic/script-only-works-after-a-refresh
//https://forum.jquery.com/topic/script-not-running-unless-i-refresh-page

//HOW TO ADD HOVERING, COLUMN SORTING AND ZEBRA PATTERN
//http://code.tutsplus.com/tutorials/using-jquery-to-manipulate-and-filter-data--net-5351


// get it without clicking button http://www.tutorialrepublic.com/faq/show-hide-divs-based-on-checkbox-selection-in-jquery.php
//http://www.tutorialrepublic.com/codelab.php?topic=faq&file=jquery-get-values-of-selected-checboxes


//TRY THIS
//"jquery hide contains several values checkbox"
//http://stackoverflow.com/questions/10543854/jquery-product-filter-using-checkboxes-and-contains-show-hide
//http://jsfiddle.net/WssNb/
$(document).ready(function(){   
    $('input:checkbox').change(showHideProducts);

    function showHideProducts()
    {
        $('.product').parent().show();
        $('input:checked').each
        (
            function()
            {
                $('td:contains("' + $(this).val() + '")').parent().hide();
            }            
        );
    }
});

