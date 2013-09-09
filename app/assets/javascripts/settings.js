$(function(){

  /* Job type ajax services
  -------------------------------------------------------------------*/

  $("#new_job_type").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_job_type .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      $("#job_type_list").append(
        '<li id="job_type' + data.id + '">' + 
          '<a rel="nofollow" data-remote="true" data-method="delete" href="/job_types/'+ data.id + '">' + data.name + 
            '<i class="icon-remove"></i>' + 
          '</a>' + 
        '</li>');
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_job_type span").html("This job type " + result.name);
    $("#new_job_type .alert-danger").removeClass('hide');
    $("#new_job_type .alert-danger").slideDown('slow');
  });

  $("#job_type_list").on("click", "li", function(event){
    $(this).remove();
  });

  /* Skill tag ajax services 
  -------------------------------------------------------------------*/

  $("#new_skill_tag").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_skill_tag .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      $("#skill_tag_list").append(
        '<li id="skill_tag' + data.id + '">' + 
          '<a rel="nofollow" data-remote="true" data-method="delete" href="/skill_tags/'+ data.id + '">' + data.name + 
            '<i class="icon-remove"></i>' + 
          '</a>' + 
        '</li>');
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_skill_tag span").html("This job type " + result.name);
    $("#new_skill_tag .alert-danger").removeClass('hide');
    $("#new_skill_tag .alert-danger").slideDown('slow');
  });

  $("#skill_tag_list").on("click", "li", function(event){
    $(this).remove();
  });

});