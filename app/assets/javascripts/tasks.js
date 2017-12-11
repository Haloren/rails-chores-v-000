$(function(){
  $("#new_task").on("submit", function(e){
    const url = this.action;
    const authToken = $("input[name='authenticity_token']").val();
    data = {
      'authenticity_token': authToken,
      'task': {
        'description': $('#task_description').val()
      }

    };

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        const $newEl = $(`
          <li>
          <div class="view">
            <label>${response.description}</label>
            <form class="button_to" method="post" action="${response.delete_path}>
              <input type="hidden" name="_method" value="delete">
              <input class="destroy" type="submit" value="x">
              <input type="hidden" name="authenticty_token" value="${authToken}">
            </form>
          </div>
          </li>
          `);
          $('.todo-list').append($newEl);
        }
      });

    e.preventDefault()
  })
})
