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

//= require jquery-ui



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

      // Code for the "Advancerad filtrering" link
      $( ".glyph" ).click(function() {
        $( ".advanced-search-options" ).slideToggle( "fast", function() {
        });
      });


      $("#slider1").mousemove(function () {
        var newValue = $('#slider1').val();

          if (newValue === '1') {
            newValue2 = "14 dagar";
          }
          if (newValue === '2') {
            newValue2 = "21 dagar";
          }
          if (newValue === '3') {
            newValue2 = "30 dagar";
          }
          if (newValue === '4') {
            newValue2 = "45 dagar";
          }
          if (newValue === '5') {
            newValue2 = "60 dagar";
          }
          if (newValue === '6') {
            newValue2 = "90 dagar";
          }
          if (newValue === '7') {
            newValue2 = "1 år";
          }

          $("#W1").text(newValue2);
      });


      $("#slider2").mousemove(function () {
        var newValue = $('#slider2').val();

          if (newValue === '1') {
            newValue2 = "500 kr";
          }
          if (newValue === '2') {
            newValue2 = "1000 kr";
          }
          if (newValue === '3') {
            newValue2 = "2000 kr";
          }
          if (newValue === '4') {
            newValue2 = "3000 kr";
          }
          if (newValue === '5') {
            newValue2 = "4000 kr";
          }
          if (newValue === '6') {
            newValue2 = "5000 kr";
          }
          if (newValue === '7') {
            newValue2 = "6000 kr";
          }
          if (newValue === '8') {
            newValue2 = "7000 kr";
          }
          if (newValue === '9') {
            newValue2 = "8000 kr";
          }
          if (newValue === '10') {
            newValue2 = "9000 kr";
          }
          if (newValue === '11') {
            newValue2 = "10 000 kr";
          }
          if (newValue === '12') {
            newValue2 = "15 000 kr";
          }
          if (newValue === '13') {
            newValue2 = "20 000 kr";
          }
          if (newValue === '14') {
            newValue2 = "25 000 kr";
          }
          if (newValue === '15') {
            newValue2 = "30 000 kr";
          }


          $("#W2").text(newValue2);
      });


      // When clicking "Vanliga frågor" in navbar the view scrolls down if you are on smslan page, if not then it changes page and scrolls down.
      if ($(".scrollhere").length) { 
        $(".vanliga-fragor").click(function() {
                $('html,body').animate({
                    scrollTop: $(".scrollhere").offset().top},
                    'slow');
            });
      

      } else if ($(".scrollhere").length === 0) {
            $(".vanliga-fragor").click(function() {
              window.location.replace("http://www.moneylabs.se/smslan#scrollhere");

              });
            }

      //http://stackoverflow.com/questions/21718282/check-if-url-contains-string-with-jquery
      if (window.location.href.indexOf("smslan#scrollhere") > -1) {
          $('html,body').animate({
              scrollTop: $(".scrollhere").offset().top
          },
              'slow');
      }


      // get it without clicking button http://www.tutorialrepublic.com/faq/show-hide-divs-based-on-checkbox-selection-in-jquery.php
      //http://www.tutorialrepublic.com/codelab.php?topic=faq&file=jquery-get-values-of-selected-checboxes
      //TRY THIS - IT MAKES THE CHECKBOXES ON SMSLAN PAGE HIE THE CORRECT ROWS IN THE TABLE
      //"jquery hide contains several values checkbox"
      //http://stackoverflow.com/questions/10543854/jquery-product-filter-using-checkboxes-and-contains-show-hide
      //http://jsfiddle.net/WssNb/

      //If one checks checkboxes and then refreshes the site then the checkboxes are still in effect.
      $('input:checked').each(function() {
        $('td:contains("' + $(this).val() + '")').parent().hide();
      });

      $('input:checkbox').change(showHideProducts);
      function showHideProducts()
      {
          $('td').parent().show();
          
          //http://stackoverflow.com/questions/6081608/jquery-check-if-it-is-clicked-or-not
          if ( $('#smsbutton').data('clicked', true)) {
            //Hide rows with empty cells
            $('tr').filter(function() {
                return $(this).find('.check_if_empty').filter(function() {
                  return ! $.trim($(this).text());  
                }).length;
            }).hide();
          };


          // had to put this code in from smsloanbutton to make it work together
          //$('tr').filter(function() {
          //    return $(this).find('td:visible:not(".smsloangiver")').filter(function() {
          //      return ! $.trim($(this).text());  
          //    }).length;
          //}).hide();

          $('input:checked').each
          (
              function()
              {
                  // had to put this code in from smsloanbutton to make it work together
                  $('td:contains("' + $(this).val() + '")').parent().hide();
                  //$('tr').filter(function() {
                  //    return $(this).find('td:visible:not(".smsloangiver")').filter(function() {
                  //      return ! $.trim($(this).text());  
                  //    }).length;
                  //}).hide();
              }            
          );
      }




      //http://stackoverflow.com/questions/4323848/how-to-handle-button-click-events-in-jquery

      //Get value from slider bar control
      //http://stackoverflow.com/questions/14457106/how-to-get-current-slider-values-from-jquery-slider

      // Test to print value slidervalue
      // http://stackoverflow.com/questions/6916300/jquery-print-value-of-variable

      // Changes link for Akelius for the landing page for facebook ads
      // http://stackoverflow.com/questions/8471892/using-jquery-how-can-i-change-an-href-value-of-an-element-with-a-certain-css-cla


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
  /*
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
  */
});
// THIS IS WHERE THE CODE FROM CODE.TUTSPLUS ENDS
//http://code.tutsplus.com/tutorials/using-jquery-to-manipulate-and-filter-data--net-5351











