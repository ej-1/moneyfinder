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

      //Hide certain columns on SMSloan page
      $(".hidden-smslan").hide();
      //Hide columns with cost for amount and time on SMSloan page
      $(".box2").hide();

      // Documentation for UI sliders https://api.jqueryui.com/slider/#method-values
      // slider bar control
      // http://www.jqueryscript.net/form/Smooth-Customizable-Range-Slider-Plugin-with-jQuery-jRange.html
      // http://www.jqueryscript.net/tags.php?/Range%20Slider/
      // FINALLY GOT IT THE SLIDER TO TAKE AND PRESENT THE VALUE http://jsfiddle.net/mericson/5TTm4/6/

      // Custom intervals http://stackoverflow.com/questions/3336709/custom-range-variable-set-with-jquery-ui-slider
      // USED THIS CODE IN THE END: Custom start value http://stackoverflow.com/questions/11206912/jquery-ui-slider-display-values
      var labelArr = new Array("", "14 dagar", "21 dagar", "30 dagar", "45 dagar","60 dagar","90 dagar","1 år","2 år","3 år","4 år","5 år");
      $( "#smstime-slider" ).slider({
        value:1,
        min: 1,
        max: 11,
        step: 1,
        slide: function( event, ui ) {
          $("#smstime-value").html(labelArr[ui.value]);
        }
      });
      //Get value and show value
      $("#smstime-value").html(labelArr[$( "#smstime-slider" ).slider( "value" )]);
        


      // Custom intervals http://stackoverflow.com/questions/3336709/custom-range-variable-set-with-jquery-ui-slider
      // USED THIS CODE IN THE END: Custom start value http://stackoverflow.com/questions/11206912/jquery-ui-slider-display-values
      var labelArr2 = new Array("", "500 kr", "1000 kr", "2000 kr", "3000 kr", "4000 kr","5000 kr","6000 kr", "7000 kr", "8000 kr", "9000 kr","10000 kr","15000 kr","20000 kr","25000 kr","30000 kr");
      $( "#smsamount-slider" ).slider({
        value:1,
        min: 1,
        max: 15,
        step: 1,
        slide: function( event, ui ) {
          $("#smsamount-value").html(labelArr2[ui.value]);
        }
      });
      //Get value and show value
      $("#smsamount-value").html(labelArr2[$( "#smsamount-slider" ).slider( "value" )]);
        



      // THIS PIECE SHOWS THE COLUMN WITH THE LOANTIME AND AMOUNT THAT THE USER
      // SELECTS IN THE SLIDERS AND HIDES ALL OTHER SIMILAR COLUMNS.
      // Take the values from the sliders via the display span ids, put them together to filter away columns
      $("#smsbutton").click(function(){

              // How to turn html element to variable (var) http://stackoverflow.com/questions/13845313/store-generated-html-in-variable
              var smstime = $("#smstime-value").html().replace(" dagar","d").replace(" år", "year");
              var smstime2 = $("#smstime-value").html().replace(" dagar","d ").replace(" år", "year ");
              var smsamount = $("#smsamount-value").html().replace("000 kr", "k").replace("500 kr", "5h");
              //var smstime2 = $("#smstime-value").html().replace(" dagar", "d_").replace(" år", "year_");
              //var smsamount2 = $("#smsamount-value").html().replace("000 kr", "k");

              // How to remove characters from variable, not needed anymore. (remove '000' from '2000') http://stackoverflow.com/questions/4308934/how-to-delete-last-character-from-a-string-using-jquery
              var smstitle = smstime + smsamount;
              var smstitle2 = smstime2 + smsamount;
              //var smstitle2 = smstime2 + smsamount2;

              // TEST - Use to show what smstitle becomes
              //document.getElementById("demo").innerHTML = smstitle;
              //document.getElementById("demo2").innerHTML = smstitle2;

              // not used. Contains variable http://stackoverflow.com/questions/2191419/jquery-contains-with-a-variable-syntax

              // Finally solved how to hide a variable as a class selector.
              // http://stackoverflow.com/questions/12293587/jquery-select-elements-by-class-using-name-from-variable
              $(".box2").hide();
              $('.' + smstitle).show(); // cost old debtors
              $('.n' + smstitle).show(); // cost new debtors
              $('.' + smstitle).css({"font-weight": "bold"});
              //$("#test").replace("Loantime", "hej");
              //http://wowmotty.blogspot.se/2011/05/jquery-findreplace-text-without.html
              $('th').html(function(i, v) {
                  return v.replace('Loantime ' + smstitle2, 'Kostnad - Ny kund');
              });
              $('th').html(function(i, v) {
                  return v.replace('Newdebtorloantime ' + smstitle2, 'Kostnad - Redan kund');
              });
              // TRIED TO JUST GET THE TIME AND AMOUNT VALUE FROM THE DATABASE, BUT DID NOT GET IT TO WORK. WORTH TRYING AGAIN
              //$("td:contains('= smsloan.loantime_14d_2k')").text().replace('= smsloan.loantime_14d_2k', '= smsloan.loantime_14d_3k.html_safe');

      });


      //http://stackoverflow.com/questions/4323848/how-to-handle-button-click-events-in-jquery

          //    button click



      //Get value from slider bar control
      //http://stackoverflow.com/questions/14457106/how-to-get-current-slider-values-from-jquery-slider

    

      // Test to print value slidervalue
      // http://stackoverflow.com/questions/6916300/jquery-print-value-of-variable


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


        //CALCULATION OF SMSLOANS
        // The radio button filled in. Show on



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











