$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});

$(function(){
  $("a.load_user_chores").on("click", function(e){
    // fire some ajax
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(response){
      $("div.user_chores").html(response)
      // we'drally want to load that data into the DOM
    });
    // get a response

    // load that response into the DOM
    e.preventDefault();
  })
})
