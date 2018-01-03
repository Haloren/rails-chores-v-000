$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});

// var HouseChore = function(json) {
//   this.name = json.chore.name;
// }
//
// HouseChore.prototype.getHTML = function() {
//   return `${this.userName}`
// };

$(function(){
  $("a.load_user_chores").on("click", function(e){
    e.preventDefault();
    $("div.user_chores ol").toggle('slow');

  $.get(this.href).success(function(json) {
    var $ol = $("div.user_chores ol")
    $ol.html("")

    $ol.append(`<h2> Current Chore Cycle: </h2>`)
      json.forEach(function(user_chore) {

        $ol.append(`
          <li><h3>${user_chore.user.username} ||
          ${user_chore.house_chore.chore.name} ||
          ${user_chore.due_date} </h3></li>
          `);
      })
    })
  })
})


$(function() {
  $("a.overdue").on( "click", function(e)  {
    e.preventDefault()
    $("div.overdue_chores ol").toggle('slow');

    $.get(this.href).success(function(json) {
      var $ol = $("div.overdue_chores ol")
      $ol.html("")

      $ol.append(`<h2> Overdue Chores: </h2>`)
        json.forEach(function(overdue_chore) {
          $ol.append(`<li><h3>${overdue_chore.user.username} || ${overdue_chore.house_chore.chore.name}</h3></li>`);
      })
    })
  })
})
