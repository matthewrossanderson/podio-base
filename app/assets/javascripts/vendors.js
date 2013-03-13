$(document).ready(function() {
    // Handler for .ready() called.

  $(".btn-collapse").on('click', function () {
   if ($(this).html().indexOf("-") !== -1 ) {
    $(this).html(" + ");
   }
   else if ($(this).html().indexOf("+") !== -1 ) {
    $(this).html(" - ");
   }
  });
    
  if ($("#vendor-search").length>0){
    getAllVendors();
  }

  if ($("#update-vendors").length>0){
    $("#update-vendors").click(function(){
      updateVendors()
    });
  }

  function getAllVendors() {
    var opts = {
      lines: 13, // The number of lines to draw
      length: 7, // The length of each line
      width: 4, // The line thickness
      radius: 10, // The radius of the inner circle
      corners: 1, // Corner roundness (0..1)
      rotate: 0, // The rotation offset
      color: '#000', // #rgb or #rrggbb
      speed: 1.3, // Rounds per second
      trail: 60, // Afterglow percentage
      shadow: false, // Whether to render a shadow
      hwaccel: false, // Whether to use hardware acceleration
      className: 'spinner', // The CSS class to assign to the spinner
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      top: 'auto', // Top position relative to parent in px
      left: 'auto' // Left position relative to parent in px
    };
    var target = document.getElementById('spinner');
    var spinner = new Spinner(opts).spin(target);
    //ajax to all
    var vendors;
    var options = { keys: ['account_name'], threshold: 0.2 }
    var fuse;

    var request = $.ajax({
      url: "/vendors/all",
      type: "GET"
    });
     
    request.done(function(response) {
        //parse the object
        vendors = jQuery.parseJSON(response);
        fuse = new Fuse(vendors, options);
        //spinner stop
        spinner.stop();
        $("#vendor-search_btn").click(function(){
            searchVendors();
        });

        $("#vendor-search").keyup(function(){
            searchVendors();
        });
            $("#vendor-show-all").click(function(){
            showAllVendors();
        });
    });
     
    request.fail(function(jqXHR, textStatus) {    
      console.log( "Request failed: " + textStatus );
      spinner.stop();
      $("#vendors").html("Error. Please refresh.");
    });

     function searchVendors() {
        $("#vendors").html("");
        //search the object, get a subset array
        var results = fuse.search($('#vendor-search').val());
        //output a shiny table to the dom 
        $.each(results, function(){
            $("#vendors").append('<div class="vendor"><a href="/vendors/' + this.id + '">' + this.account_name + '</a></div>');
        }); 
    }

    function showAllVendors(){
      $('#vendor_search').val("")
        $("#vendors").html("");
        $.each(vendors, function(){
            $("#vendors").append('<div class="vendor"><a href="/vendors/' + this.id + '">' + this.account_name + '</a></div>');
        }); 
    }
  }

  function updateVendors() {
    console.log("Updating Vendors");
    var request = $.ajax({
      url: "/vendors/update",
      type: "GET"
    });
  }

});






