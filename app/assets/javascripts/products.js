$(function(){
  /* profile image
  -----------------------------------------------------------------*/
  $('#book_cover_link').on('click', function(){
    $('#product_cover').click();
  });

  $('#book_cover').on('click', function(){
    $('#product_cover').click();
  });

  $('#product_cover').on('change', function(input){
    
    evt = input.target;
    if (evt.files && evt.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#book_cover')
              .attr('src', e.target.result)
              .width(150);
      };

      reader.readAsDataURL(evt.files[0]);
    }
  });

  $(".product_product_type select").on('change', function(input){

    var index = $(this).find("option:selected").val();

    if (index == 0)
    {
      $('div.product_session_type').css("display", "block");
      $('div.product_session_length').css("display", "block");
      $('div.product_cover').css("display", "none");
      $('div.product_url').css("display", "none");
    }
    else if (index == 1)
    {
      $('div.product_session_type').css("display", "none");
      $('div.product_session_length').css("display", "none");
      $('div.product_cover').css("display", "none");
      $('div.product_url').css("display", "none");
    }
    else if (index == 2)
    {
      $('div.product_session_type').css("display", "none");
      $('div.product_session_length').css("display", "none");
      $('div.product_cover').css("display", "block");
      $('div.product_url').css("display", "block");
    }
  });

  $("#add-product form").validate({
    rules: {
      "product[price]": {
        number: true
      },
      "product[session_length]": {
        number: true
      }
    }
  });

});