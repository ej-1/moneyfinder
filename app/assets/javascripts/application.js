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
//= require bootstrap

//= require_self
//= require_tree .






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

        //makes sure that bootstrap menu collapses on mobile when clicking an option
        $(".minimize").click(function(event) {
            // check if window is small enough so dropdown is created
            $(".toggle").is(":visible")
                $(".navbar-collapse").toggle();

        });


        // Hides advanced options in mobile format
        //if ($(window).width() < 481) {
          $( ".advanced-search-options" ).hide();
        //}

        $(".hide_speedinfo").hide();
        // Shows sections with Krav / utbetalningsinfo
        $('.show_paymentspeed').click(function(){
          //identify first .smsloanoverview visible in viewport and store it.
          //http://www.appelsiini.net/projects/viewport
          //Tried to used appelsiini to get the first .unseen_action in the viewport, tag it with a class .selected
          // and then find and scroll to it after the toggle action was executed, but the :in-viewport function did
          // not work. Instead it addded the class to all .unseen_actions.
          //var firstselected = $('.unseen_section:in-viewport').addClass("selected");
          //var scrolltothis = $("html").scrollTop(".selected");

          // THIS IS WHAT IS ACTUALLLY SORT OF WORKING BELOW
          //Also tried to get .outerHeight of each unseen action combined and add it to the position of the 
          // viewport before toggle was executed. The sum of pixels, I thought, would be where I should scroll to.
          // It works only if you have the lowest of the loangivers (.unseen_action) in sight. If you have any else then
          // to get it to work properly you have to get the postion where the viewport was before the toggl action was executed
          // and detract the heights of all unseen actions that would happen above the viewport. THis last part I did not get to work.
          
          //screen position when clicked
          postion = $(window).scrollTop();

          //Target anything above a certain coordinate
          //http://stackoverflow.com/questions/4195620/jquery-get-elements-above-a-given-y-position
          $.expr[':'].above = function(obj, index, meta, stack) { 
              return $(obj).offset().top < meta[3];
          }

            //Checks if unseen_actions are visible or not
          var unseenVisibility = $('.unseen_section:visible').size();

              //Toggles on and off
          $('.unseen_section').toggle();

              //Adds class to all above.
          $('.unseen_section:above('+postion+')').addClass('above');

              //Height of all unseen_actions
              //http://stackoverflow.com/questions/13048722/jquery-finding-the-total-height-of-all-divs-children
          var totalHeight = 0;
          $(".unseen_section").each(function(){
              totalHeight += $(this).outerHeight();
          });

              //Height of all unseen_actions that was above viewport
          var totalHeight2 = 0;
          $(".above").each(function(){
              totalHeight2 += $(this).outerHeight();
          });

          if (unseenVisibility == 0) {
            //calculate how much to scroll when toggling on
            var scrollamount = postion + totalHeight - totalHeight2
            $(".hide_speedinfo").show();
            $(".show_speedinfo").hide();            
            //alert(unseenVisibility);
            //alert(totalHeight);
            //alert(totalHeight2);
            //alert("on");
          } else {
            //calculate how much to scroll when toggling off
            $(".hide_speedinfo").hide();
            $(".show_speedinfo").show();
            var scrollamount = postion - totalHeight2
            //alert("off");
            //alert(unseenVisibility);
          }

          // Scroll to variable
          // http://stackoverflow.com/questions/4555724/jquery-store-scroll-position
          $("html, body").animate({ scrollTop: scrollamount }, 600);


        });
        







        //Opens the "Transfer" page tht contains Google Adwords Conversion Tracking Pixel,
        // when clicking an afffiliate link.
        $('a#affiliatelink').click(function(e) {
            window.open('http://www.moneylabs.se/transfer');
            
        });


        if ($(window).width() < 481) {
          //http://tympanus.net/codrops/2010/01/03/scrolling-to-the-top-and-bottom-with-jquery/
          //Check to see if the window is top if not then display button
          $(window).scroll(function(){
            if ($(this).scrollTop() > 700) {
              $('.scrollToTop').fadeIn();
            } else {
              $('.scrollToTop').fadeOut();
            }
          });
          
          //Click event to scroll to top
          $('.scrollToTop').click(function(){
            $('html, body').animate({scrollTop : 0},800);
            return false;
          });
        }
        else {

        }

          //http://tympanus.net/codrops/2010/01/03/scrolling-to-the-top-and-bottom-with-jquery/
          //Check to see if the window is top if not then display button
          $(window).scroll(function(){
            if ($(this).scrollTop() > 700) {
              $('.barshowtime').fadeIn();
            } else {
              $('.barshowtime').fadeOut();
            }
          });

          $(window).scroll(function(){
            if ($(this).scrollTop() > 700) {
              $('.barshowtime-mobile').fadeIn();
            } else {
              $('.barshowtime-mobile').fadeOut();
            }
          });



          //This is for the bar that scrolls to the loantime group



      //One example how to fix navbar collapse: http://stackoverflow.com/questions/21496304/bootstrap-collapse-component-not-closing-menu-on-clicking-away
      //Toggle collapse for navbar options in mobile format.
      $(".navbar-toggle").click(function(event) {
        $('.collapse').collapse('toggle');
      });
      // When clicking somewhere outside the navbar it collapses.
      // $(document).click(function(event) {
      //   $(".navbar-collapse").collapse('toggle');
      // });
      // Collapses menu when clicking on a link in menu.
      // $(".navbar-nav li a").click(function(event) {
      //   $(".navbar-collapse").collapse('toggle');
      // });

      //Flashes red circle
      if ($(window).width() > 768) {
        $(".circle").fadeIn(350).fadeOut(350).fadeIn(350).fadeOut(350).fadeIn(350).fadeOut(350).fadeIn(350);
      }

      // Makes nice colorful bubbles that tells what kind of smsloan it is.
      $(".typeofloan:contains('1')").replaceWith("<div class='typeofloan typeofloan-sms'><div class='hidden-smslan'></div><div class='glyphicon glyphicon-ok float-left typeofloancheckmark'></div><div class='typeofloaninfo'>SMSlån</div></div></div>");
      $(".typeofloan:contains('2')").replaceWith("<div class='typeofloan typeofloan-blancolan'><div class='hidden-smslan'></div><div class='glyphicon glyphicon-ok float-left typeofloancheckmark'></div><div class='typeofloaninfo'>Blancolån</div></div></div>");



      $( ".button_showmeless_than_90d" ).hide()
      // Helps user to filter overview with loantime, because showing all loantimes at once is to much
      // and using side-scrollable tables is mostly messy..
      $( ".button_showmemore_than_90d" ).click(function() {
        // the cells in the table that are hidden
        $( ".less_than_90d" ).hide() 
        $( ".more_than_90d" ).show()
        // Show the right button
        $( ".button_showmeless_than_90d" ).show()
        $( ".button_showmemore_than_90d" ).hide()
      });

      $( ".button_showmeless_than_90d" ).click(function() {
        $( ".less_than_90d" ).show()
        $( ".more_than_90d" ).hide()
        $( ".button_showmemore_than_90d" ).show()
        $( ".button_showmeless_than_90d" ).hide()
      });





      // Code for the "Advancerad filtrering" link
      $( ".glyph" ).click(function() {
        $( ".advanced-search-options" ).slideToggle( "fast", function() {
        });
      });

      // The value of the sliders
      var rangeValues = {
          "1": "14 dagar",
          "2": "21 dagar",
          "3": "30 dagar",
          "4": "45 dagar",
          "5": "60 dagar",
          "6": "90 dagar",
          "7": "1 år"
      };

      $(function () {
          $('#W1').text(rangeValues[$('#slider1').val()]);
          $('#slider1').mousemove(function () {
              $('#W1').text(rangeValues[$(this).val()]);
          });
      });

      var rangeValues2 = {
          "1": "500 kr",
          "2": "1000 kr",
          "3": "2000 kr",
          "4": "3000 kr",
          "5": "4000 kr",
          "6": "5000 kr",
          "7": "6000 kr",
          "8": "7000 kr",
          "9": "8000 kr",
          "10": "9000 kr",
          "11": "10 000 kr",
          "12": "15 000 kr",
          "13": "20 000 kr",
          "14": "25 000 kr",
          "15": "30 000 kr",
      };

      $(function () {
          $('#W2').text(rangeValues2[$('#slider2').val()]);
          $('#slider2').mousemove(function () {
              $('#W2').text(rangeValues2[$(this).val()]);
          });
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
      // siblings() is to hide the buttons in mobile.
      $('input:checked').each(function() {
        $('td:contains("' + $(this).val() + '")').parentsUntil(".smsloanoverview").hide();
      });

      // Counts number of loans shown when moneylabs.se loads.
      if ($('.odd_searchresults_color').length > 0) { //if on loanoverview
        rowCount = $('.odd_searchresults_color:visible').size();
        $('.bold-text.nr_of_loans').text(rowCount + " st långivare visas");
      } else { // else, meaning on searchresults
        rowCount = $('.anti_border_spacing tr:visible').size();
        $('.bold-text.nr_of_loans').text(rowCount + " st lån visas");
      }


      // INPUT FROM CHECKBOX TRIGGERS showHideProducts.
      $('input:checkbox').change(showHideProducts);
      function showHideProducts()
      {
          //Re-wrote this block to accomodate that there are two sets of .smsloaninfo for each loangiver.
          if ($(window).width() > 768) {
            //these ones is for search results.
            $('.smsloan_extrainfo_desk td').parentsUntil(".smsloanoverview").show();
            $(".smsloaninfo.smsloan_extrainfo_desk").show();
            $(".bastards").hide();      
            //this one is for search results.
            $('td').parentsUntil("#table_id2").show();

          } else {
            //these ones is for search results.
            $('.smsloan_extrainfo_tabmob td').parentsUntil(".smsloanoverview").show();
            $(".smsloaninfo.smsloan_extrainfo_tabmob").show();
            $(".bastards").show();
            //this one is for search results.
            $('td').parentsUntil("#table_id2").show();

          }



              //finds the cheapest loan of each loantimegroup.s
              //cheapest_child30d = $('.sms_costnew_searchresult30d:first-child').html().replace(' kr', '');
              //cheapest_child60d = $('.sms_costnew_searchresult60d:first-child').html().replace(' kr', '');

              //sorts the cheapest loans according to size - lowest to highest.
              //var cheap_children = [cheapest_child30d, cheapest_child60d];
              //cheap_children_sorted = cheap_children.sort(function(a, b){return a-b});


              //.parentsUntil("#table_id2")

              //Duplicated below to show the hulk-box after unclicking a checkbox.
              var t14dclicked = ($('#table14d tr:visible').size());
              var t21dclicked = ($('#table21d tr:visible').size());
              var t30dclicked = ($('#table30d tr:visible').size());
              var t60dclicked = ($('#table60d tr:visible').size());
              var t90dclicked = ($('#table90d tr:visible').size());
              var t1yclicked = ($('#table1y tr:visible').size());
              if (t14dclicked === 0){
              }else{
                $('.table14d').show();
                $('.group_14d').show();
              }

              if (t21dclicked === 0){
              }else{
                $('.table21d').show();
                $('.group_21d').show();
              }

              if (t30dclicked === 0){
              }else{
                $('.table30d').show();
                $('.group_30d').show();
              }

              if (t60dclicked === 0){
              }else{
                $('.table60d').show();
                $('.group_60d').show();
              }

              if (t90dclicked === 0){
              }else{
                $('.table90d').show();
                $('.group_90d').show();
              }

              if (t1yclicked === 0){
              }else{
                $('.table1y').show();
                $('.group_1y').show();
              }

              // Counts number of loans shown and informs user after they have unchecked a checkbox.
              if ($('.odd_searchresults_color').length > 0) { //if on loanoverview
                rowCount = $('.odd_searchresults_color:visible').size();
                $('.bold-text.nr_of_loans').text(rowCount + " st långivare visas");
              } else { // else, meaning on searchresults
                rowCount = $('.anti_border_spacing tr:visible').size();
                $('.bold-text.nr_of_loans').text(rowCount + " st lån visas");
              }


          //http://stackoverflow.com/questions/6081608/jquery-check-if-it-is-clicked-or-not
          //if ( $('#smsbutton').data('clicked', true)) {
            //Hide rows with empty cells
          //  $('tr').filter(function() {
          //      return $(this).find('.check_if_empty').filter(function() {
          //        return ! $.trim($(this).text());  
          //      }).length;
          //  }).hide();
          //};

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

                  if ($(window).width() > 768) {
                    $('td:contains("' + $(this).val() + '")').parentsUntil(".smsloanoverview").hide();

                  } else {
                    $('td:contains("' + $(this).val() + '")').parentsUntil(".smsloanoverview").hide();

                  }

                  // had to put this code in from smsloanbutton to make it work together
                  

                  //$('tr').filter(function() {
                  //    return $(this).find('td:visible:not(".smsloangiver")').filter(function() {
                  //      return ! $.trim($(this).text());  
                  //    }).length;
                  //}).hide();
                  var t14dclicked = ($('#table14d tr:visible').size());
                  var t21dclicked = ($('#table21d tr:visible').size());
                  var t30dclicked = ($('#table30d tr:visible').size());
                  var t60dclicked = ($('#table60d tr:visible').size());
                  var t90dclicked = ($('#table90d tr:visible').size());
                  var t1yclicked = ($('#table1y tr:visible').size());

                  if (t14dclicked === 0){
                    $('.table14d').hide();
                    $('.group_14d').hide();
                  }else{
                    $('.table14d').show();
                    $('.group_14d').show();
                  }

                  if (t21dclicked === 0){
                    $('.table21d').hide();
                    $('.group_21d').hide();
                  }else{
                    $('.table21d').show();
                    $('.group_21d').show();
                  }

                  if (t30dclicked === 0){
                    $('.table30d').hide();
                    $('.group_30d').hide();
                  }else{
                    $('.table30d').show();
                    $('.group_30d').show();
                  }

                  if (t60dclicked === 0){
                    $('.table60d').hide();
                    $('.group_60d').hide();
                  }else{
                    $('.table60d').show();
                    $('.group_60d').show();
                  }
 
                  if (t90dclicked === 0){
                    $('.table90d').hide();
                    $('.group_90d').hide();
                  }else{
                    $('.table90d').show();
                    $('.group_90d').show();
                  }

                  if (t1yclicked === 0){
                    $('.table1y').hide();
                    $('.group_1y').hide();
                  }else{
                    $('.table1y').show();
                    $('.group_1y').show();
                  }

                  if (t14dclicked === 0 && t21dclicked === 0 && t30dclicked === 0 && t60dclicked === 0 && t90dclicked === 0 && t1yclicked === 0){
                    $("#tryagain1").replaceWith('<p class="try-again content-top3">Tyvärr fanns ingen långivare som erbjuder det lån du sökte efter!</p>');
                    $("#tryagain2").replaceWith('<p class=try-again>Pröva att ändra lånebelopp eller löptid.</p>');
                    $("#tryagain3").replaceWith('<p class=try-again>Klicka ur några kryssrutor kan också hjälpa.</p>');
                    $('.barshowgroup').hide();
                  }

                  // Counts number of loans shown and informs user after they have clicked a checkbox.
                  if ($('.odd_searchresults_color').length > 0) { //if on loanoverview
                    rowCount = $('.odd_searchresults_color:visible').size();
                    $('.bold-text.nr_of_loans').text(rowCount + " st långivare visas");
                  } else { // else, meaning on searchresults
                    rowCount = $('.anti_border_spacing tr:visible').size();
                    $('.bold-text.nr_of_loans').text(rowCount + " st lån visas");
                  }

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











