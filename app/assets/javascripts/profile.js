$(function(){
  /* Ajax services
  -----------------------------------------------------------------*/
  /* Education Ajax */
  $("#new_education").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_education .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      education = xhr.responseJSON;
      template = $("tr#education-template").clone();
      template.attr("id", "education" + education.id);
      template.find("td#from").html(education.from);
      template.find("td#to").html(education.to);
      template.find("td#school").html(education.school);
      template.find("td#area_of_study").html(education.area_of_study);
      template.find("td a[data-method='delete']").attr("href", "/educations/" + education.id);
      template.css("display", "table-row");

      $("#education_list tbody").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_education span").html("This education info " + result.name);
    $("#new_education .alert-danger").removeClass('hide');
    $("#new_education .alert-danger").slideDown('slow');
  });

  // Delete
  $("#education_list").on("ajax:success", function(e, data, status, xhr){
    $("tr#education" + xhr.responseJSON.id).remove();
  });

  /* Other Experience Ajax service
  --------------------------------------------------------------------*/
  $("#new_other_experience").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_other_experience .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      other_experience = xhr.responseJSON;
      template = $("tr#other-exp-template").clone();
      template.attr("id", "other_experience" + other_experience.id);
      template.find("td#name").html(other_experience.name);
      template.find("td#description").html(other_experience.description);
      template.find("td a[data-method='delete']").attr("href", "/other_experiences/" + other_experience.id);
      template.css("display", "table-row");

      $("#other_experience_list tbody").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_other_experience span").html("This other-experience info " + result.name);
    $("#new_other_experience .alert-danger").removeClass('hide');
    $("#new_other_experience .alert-danger").slideDown('slow');
  });
  // Delete
  $("#other_experience_list").on("ajax:success", function(e, data, status, xhr){
    $("tr#other_experience" + xhr.responseJSON.id).remove();
  });


  /* Pro Experiences Ajax */
  $("#new_pro_experience").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_pro_experience .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      pro_experience = xhr.responseJSON;
      template = $("tr#pro-exp-template").clone();

      template.attr("id", "pro_experience" + pro_experience.id);
      console.log(template.attr("id"));
      template.find("td#from").html(pro_experience.from);
      template.find("td#to").html(pro_experience.to);
      template.find("td#company_name").html(pro_experience.company_name);
      template.find("td#title").html(pro_experience.title);
      template.find("td a[data-method='delete']").attr("href", "/pro_experiences/" + pro_experience.id);

      template.css("display", "table-row");
      $("#pro_experience_list tbody").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_pro_experience span").html("This professional experience info " + result.name);
    $("#new_pro_experience .alert-danger").removeClass('hide');
    $("#new_pro_experience .alert-danger").slideDown('slow');
  });
  // Delete
  $("#pro_experience_list").on("ajax:success", function(e, data, status, xhr){
    console.log(xhr.responseJSON.id);
    console.log($("tr#pro_experience" + xhr.responseJSON.id));
    $("tr#pro_experience" + xhr.responseJSON.id).remove();
  });




  /* Skills */
  $("#new_skill").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_skill .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      $("#skill_list").append(
        '<li id="skill' + data.id + '">' + 
          '<a rel="nofollow" data-remote="true" data-method="delete" href="/skills/'+ data.id + '">' + data.name + 
            '<i class="icon-remove"></i>' + 
          '</a>' + 
        '</li>');

    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_skill span").html("This skill " + result.name);
    $("#new_skill .alert-danger").removeClass('hide');
    $("#new_skill .alert-danger").slideDown('slow');
  });

  $("#skill_list").on("click", "li", function(event){
    $(this).remove();
  });


  /* profile image
  -----------------------------------------------------------------*/
  $('#profile_photo_link').on('click', function(){
    $('#profile_photo').click();
  });

  $('#profile_photo').on('change', function(input){
    
    evt = input.target;
    if (evt.files && evt.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#photo')
              .attr('src', e.target.result)
              .width(150);
      };

      reader.readAsDataURL(evt.files[0]);
      $("#photo_form").submit();
    }
  });

  $.mask.definitions['~']='[+-]';
  $('.input-mask-date').mask('99/99/9999');
  $('.input-mask-time').mask('99/99/9999 99:99');

  $('.date-picker').datepicker({ format: 'yyyy-mm-dd' });

  jQuery.validator.addMethod("greaterThan", 
    function(value, element, params) {
      return value < $(params).val();
    },'Must be greater than From date.'
  );

  $("#new-profile form").validate();
  $("#profile-overview form").validate();

  $("#new_other_exp").validate();

  $("#new_education").validate({
    rules: {
        'education[to]': { greaterThan: "#education_from" }
    }
  });

  // $("#pro_experience_to").rules('add', { greaterThan: "#pro_experience_from" });
  $("#new_pro_experience").validate({
    rules: {
        'pro_experience[to]': { greaterThan: "#pro_experience_from" }
    }
  });

  $("#new_skill").validate();

});