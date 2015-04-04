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


//the ready()function with code for hovering and column sorting
$(document).ready(function() {
  zebraRows('tbody tr:odd td', 'odd');

      // Changes link for Akelius for the landing page for facebook ads
      // http://stackoverflow.com/questions/8471892/using-jquery-how-can-i-change-an-href-value-of-an-element-with-a-certain-css-cla


      // get it without clicking button http://www.tutorialrepublic.com/faq/show-hide-divs-based-on-checkbox-selection-in-jquery.php
      //http://www.tutorialrepublic.com/codelab.php?topic=faq&file=jquery-get-values-of-selected-checboxes
      //TRY THIS - IT MAKES THE CHECKBOXES ON SMSLAN PAGE HIE THE CORRECT ROWS IN THE TABLE
      //"jquery hide contains several values checkbox"
      //http://stackoverflow.com/questions/10543854/jquery-product-filter-using-checkboxes-and-contains-show-hide
      //http://jsfiddle.net/WssNb/
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



      $(document).ready(function(){

         // checks if both text fields are filled in by user
        if( !$('#number2').val() || !$('#number').val() ) {
          // nested if statement checks if class number2, which is a text_field in loancalculator.html.haml exist.
          // READ HERE: http://aaronrussell.co.uk/legacy/check-if-an-element-exists-using-jquery/
          if ($("#number2").length > 0){
            $(".content-top").hide()
            }
            
        } 
        else
        {
            $(".content-top").show()
        }


        // preselects 3months
        $(function() {
            var $radios = $('input:radio[name=colorRadio]');
            if($radios.is(':checked') === false) {
                $radios.filter('[value=3months]').prop('checked', true);
                $(".box").hide();
                $(".3months").show();
            }
        });


          // Functions for each radio button
          $('input[type="radio"]').click(function(){
              if($(this).attr("value")=="3months"){
                  $(".box").hide();
                  $(".3months").show();
              }

              if($(this).attr("value")=="1year"){
                  $(".box").hide();
                  $(".1year").show();
              }

              if($(this).attr("value")=="2years"){
                  $(".box").hide();
                  $(".2years").show();
              }
              if($(this).attr("value")=="3years"){
                  $(".box").hide();
                  $(".3years").show();
              }
              if($(this).attr("value")=="5years"){
                  $(".box").hide();
                  $(".5years").show();
              }
              if($(this).attr("value")=="7years"){
                  $(".box").hide();
                  $(".7years").show();
              }
              if($(this).attr("value")=="10years"){
                  $(".box").hide();
                  $(".10years").show();
              }

          });
      });











  //used to apply alternating row styles
    function zebraRows(selector, className)
  {
    $(selector).removeClass(className).addClass(className);
  }


  // CODE FOR MAKING NAVPILL SWITCH COLOR WHEN SELECTED/DESELECTED - FUNKAR INTE
  // http://jsfiddle.net/Y36FV/
  // select first list item
  //$("li:first").addClass("active");

  // select third list item
  //var liToSelect = 3;
  //$(".nav.nav-pills li:eq("+(liToSelect-1)+")").addClass("active");

  // dynamically activate list items when clicked
 // $(".nav.nav-pills li").on("click",function(){
 //     $(".nav.nav-pills li").removeClass("active");
 //     $(this).addClass("active");
 //   });







  //when hovering over
  $('tbody tr').hover(function(){
    $(this).find('td').addClass('hovered');
  }, function(){
    $(this).find('td').removeClass('hovered');
  });

  //column sorting
  //grab all header rows
  $('thead th').each(function(column) {
    $(this).addClass('sortable').click(function(){
      var findSortKey = function($cell) {
        return $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
      };
      var sortDirection = $(this).is('.sorted-asc') ? -1 : 1;
   
      //step back up the tree and get the rows with data
      //for sorting
      var $rows = $(this).parent().parent().parent().find('tbody tr').get();
   
      //loop through all the rows and find
      $.each($rows, function(index, row) {
        row.sortKey = findSortKey($(row).children('td').eq(column));
      });
   



      //compare and sort the rows alphabetically
      $rows.sort(function(a, b) {
          if(! isNaN (a.sortKey - 0) && ! isNaN (b.sortKey - 0) ); 
          return (parseFloat(a.sortKey) - parseFloat(b.sortKey))*sortDirection;
          if (a.sortKey < b.sortKey) return -sortDirection;
          if (a.sortKey > b.sortKey) return sortDirection;
          return 0;
      });
   
      //add the rows in the correct order to the bottom of the table
      $.each($rows, function(index, row) {
          $('tbody').append(row);
          row.sortKey = null;
      });
   
      //identify the column sort order
      $('th').removeClass('sorted-asc sorted-desc');
      var $sortHead = $('th').filter(':nth-child(' + (column + 1) + ')');
      sortDirection == 1 ? $sortHead.addClass('sorted-asc') : $sortHead.addClass('sorted-desc');
   
      //identify the column to be sorted by
      $('td').removeClass('sorted')
                  .filter(':nth-child(' + (column + 1) + ')')
                  .addClass('sorted');
   
      $('.visible td').removeClass('odd');
      zebraRows('.visible:even td', 'odd');
    });
  });
});
// THIS IS WHERE THE CODE FROM CODE.TUTSPLUS ENDS
//http://code.tutsplus.com/tutorials/using-jquery-to-manipulate-and-filter-data--net-5351











