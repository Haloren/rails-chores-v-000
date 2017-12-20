function Task(attributes) {
  this.description = attributes.description;
  this.id = attributes.id;
}
// class Task {
//   constructor(id, description) {
//     this.id = id
//     this.description = description
//   }
// }
//
// Task.prototype.taskHtml = function() {
//   let newHtml = " "
//   newHtml += `<li class="task" id="task_${this.id}">`
//   newHtml += `<div class="view">`
//   newHtml += `<label>${this.description}</label>`
//   newHtml += `<form class="button_to" method="post" action="/house_chores/<%= @house_chore.id %>/tasks/${this.id}">`
//   newHtml += `<input type="hidden" name="_method" value="delete">`
//   newHtml += `<%= hidden_field_tag :authenticity_token, form_authenticity_token %>`
//   newHtml += `</form>`
//   newHtml += `</div>`
//   newHtml += `</li>`
//   return newHtml
// };

$(function() {
  Task.templateSource = $('#task-template').html()
  Task.template = Handlebars.compile(Task.templateSource);
});


Task.prototype.renderLI = function() {
 return Task.template(this)
}
// working AJAX:
$(function(){
  $("#new_task").on("submit", function(e){
    e.preventDefault()
    const $form = $(this);
    const action = $form.attr("action");
    const params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
      $('#task_description').val("");
      var task = new Task(json);
      var taskLi = task.renderLil()
      

      $('ul.todo-list').append(taskLi)
    })
    .error(function(response) {
      console.log("Error", response)
    })
  })
})
