function Task(attributes) {
  this.description = attributes.description;
  this.id = attributes.id;
}

$(function() {
  Task.templateSource = $('#task-template').html()
  Task.template = Handlebars.compile(Task.templateSource);
})


Task.prototype.renderLi = function() {
  return Task.template(this)
}
// working AJAX:
$(function(){
  $("form#new_task").on("submit", function(e){
    e.preventDefault()
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();


    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      $('#task_description').val("");
      var task = new Task(json);
      var taskLi = task.renderLi()
      $('ul.todo-list').append(taskLi);

    })
    .error(function(response) {
      console.log("Error", response)
    })
  })
})
