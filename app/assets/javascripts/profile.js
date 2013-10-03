$(function(){
  /* Ajax services
  -----------------------------------------------------------------*/
  /* Education Ajax */
  $("#new_education").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_education .alert-danger").fadeOut('slow');
    var degrees = ["Doctorate", "Master's", "Bachelor's", "Associate's", "Diploma", "High School"];
    if (xhr.status == 201) // create
    {
      education = xhr.responseJSON;
      template = $("#education_template").clone();
      console.log(template);

      template.attr("id", "education" + education.id);
      
      template.find("#title").html("<strong>" + education.school + ", " 
        + degrees[education.degree] + "</strong> | " + education.area_of_study);

      template.find("#action a[data-method='delete']").attr("href", "/educations/" + education.id);
      template.find("#edit_link").attr("href", "#education-" + education.id);
      
      template.find("#term").html(education.from + " ~ " + education.to);
      template.find("#description").html(education.comments);
      // form
      template.find("#education-").attr("id", "education-" + education.id);
      template.find("#education- form").attr("action", "/educations/" + education.id);
      // form elements
      template.find("#education_from").val(education.from);
      template.find("#education_to").val(education.to);
      template.find("#education_area_of_study").val(education.area_of_study);
      template.find("#education_school").val(education.school);
      template.find("#education_description").val(education.comments);
      
      template.css("display", "block");

      $("#education_list").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_education span").html("This education info " + result.name);
    $("#new_education .alert-danger").removeClass('hide');
    $("#new_education .alert-danger").slideDown('slow');
  });

  // Delete
  $("#education_list").on("ajax:success", function(e, data, status, xhr){
    $("#education" + xhr.responseJSON.id).remove();
  });

  /* Other Experience Ajax service
  --------------------------------------------------------------------*/
  $("#new_other_experience").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_other_experience .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      other_experience = xhr.responseJSON;

      template = $("#other-exp-template").clone();
      template.attr("id", "other_experience" + other_experience.id);
      
      template.find("#title").html("<strong>" + other_experience.title + "</strong> | " + other_experience.company_name);
      
      template.find("#action a[data-method='delete']").attr("href", "/other_experiences/" + other_experience.id);
      template.find("#edit_link").attr("href", "#other-exp-" + other_experience.id);

      template.find("#description").html(other_experience.description);
      // form
      template.find("#other-exp-").attr("id", "other-exp-" + other_experience.id);
      template.find("#other-exp- form").attr("action", "/other_experiences/" + other_experience.id);
      // form elements
      template.find("#other_experience_title").val(other_experience.title);
      template.find("#other_experience_description").val(other_experience.description);

      template.css("display", "block");

      $("#other_experience_list").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_other_experience span").html("This other-experience info " + result.name);
    $("#new_other_experience .alert-danger").removeClass('hide');
    $("#new_other_experience .alert-danger").slideDown('slow');
  });
  // Delete
  $("#other_experience_list").on("ajax:success", function(e, data, status, xhr){
    $("#other_experience" + xhr.responseJSON.id).remove();
  });


  /* Pro Experiences Ajax */
  $("#new_pro_experience").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_pro_experience .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      pro_experience = xhr.responseJSON;
      template = $("#pro_experience_template").clone();

      template.attr("id", "pro_experience" + pro_experience.id);
      
      template.find("#title").html("<strong>" + pro_experience.title + "</strong> | " + pro_experience.company_name);
      
      template.find("#action a[data-method='delete']").attr("href", "/pro_experiences/" + pro_experience.id);
      template.find("#edit_link").attr("href", "#professional-exp-" + pro_experience.id);

      template.find("#term").html(pro_experience.from + " ~ " + pro_experience.to);
      template.find("#description").html(pro_experience.description);
      // form
      template.find("#professional-exp-").attr("id", "professional-exp-" + pro_experience.id);
      template.find("#professional-exp- form").attr("action", "/pro_experiences/" + pro_experience.id);
      // form elements
      template.find("#pro_experience_from").val(pro_experience.from);
      template.find("#pro_experience_to").val(pro_experience.to);
      template.find("#pro_experience_title").val(pro_experience.title);
      template.find("#pro_experience_company_name").val(pro_experience.company_name);
      template.find("#pro_experience_description").val(pro_experience.description);

      template.find("#professional-exp- form").attr("id", "edit_pro_experience_" + pro_experience.id);

      template.css("display", "block");
      $("#pro_experience_list").append(template);
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_pro_experience span").html("This professional experience info " + result.name);
    $("#new_pro_experience .alert-danger").removeClass('hide');
    $("#new_pro_experience .alert-danger").slideDown('slow');
  });
  // Delete
  $("#pro_experience_list").on("ajax:success", function(e, data, status, xhr){
    $("#pro_experience" + xhr.responseJSON.id).remove();
  });


  $("#profile .fade-control").on("click", function(){
    var target = $(this).attr("href");
    if ($(target).css('display') == 'block')
      return;
    $("#profile .fade-section").fadeOut("1000");

    $(target).fadeIn('fast');
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
  $('.profile_photo_link').on('click', function(){
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
  $('#profile_phone').mask('(999) 999-9999')
  $('.input-mask-time').mask('99/99/9999 99:99');

  if ($('.date-picker').length > 0)
    $('.date-picker').datepicker({ format: 'yyyy-mm-dd' });

  jQuery.validator.addMethod("greaterThan", 
    function(value, element, params) {
      return value > $(params).val();
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