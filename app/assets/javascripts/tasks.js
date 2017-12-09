$(function(){
  $("#new_task").on("submit", function(e){
    url = this.action
    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'task': {
        'description': $('#task_description').val()
      }

    };

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        debugger
      }
    });

    e.preventDefault()
  })
})
