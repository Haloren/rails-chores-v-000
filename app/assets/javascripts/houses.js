// exposes house.city(json) on mouseover-event of a.house-link
(function() {
  $(document).on('mouseover', '.house-link',  function(e) {
    var $href = $(this).context.lastElementChild.attributes.href.value
// AJAX request (using .get)
    $.get($href).success(function(json) {
      var $li = $('#house-details_' + this.url.slice(-2))
      $li.html("")

      $li.append(`<h5>${json.city}</h5>`)
    })
  })
})();

// restores a.house-link to natural state
(function() {
  $(document).on('mouseout', '.house-link',  function(e) {
    var $href = $(this).context.lastElementChild.attributes.href.value

    $.get($href).success(function(json) {

      var $li = $('#house-details_' + this.url.slice(-2))
      $li.empty()

    })

  })
})();

// click-event to go to previous house
(function() {
  $(document).on("click", ".js-prev", function(e) {

    e.preventDefault();
    var prevId = parseInt($(".js-prev").attr("data-attribute"));
    console.log(prevId)
    var $ul = $('.todo-list')

    $ul.html("")
    $.get("/houses/" + prevId + ".json", function(data) {

      console.log(data)
      $(".houseName").text(data["name"]);
      $(".houseCity").text(`The cleanest house in ${data["city"]}!`);
      for (var i = 0; i < data["chores"].length; i++) {
        var chore = data["chores"][i]
        var newHtml = " "
        newHtml += `<li>`
        newHtml += `<div class="view">`
        newHtml += `<label>`
        newHtml += `<a href="/house_chores/${chore.id}"</a>${chore.name}`
        newHtml += `</label>`
        newHtml += `<form class="button_to" method="post" action="/house_chores/${chore.id}">`
        newHtml += `<input type="hidden" name="_method" value="delete">`
        newHtml += `<input class="destroy" type="submit" value="x">`
        newHtml += `</div>`
        newHtml += `</li>`
        $ul.append(newHtml)
      }
      // re-set the id to the current on the link
      $(".js-prev").attr("data-attribute", data["id"]);
      $(".js-next").attr("data-attribute", data.id - 1);
    }).fail(function(e) {
      $.get("/houses/29.json", function(data) {
        $(".houseName").text(data["name"]);
        $(".houseCity").text(`The cleanest house in ${data["city"]}!`);
        for (var i = 0; i < data["chores"].length; i++) {
          var chore = data["chores"][i]
          var newHtml = " "
          newHtml += `<li>`
          newHtml += `<div class="view">`
          newHtml += `<label>`
          newHtml += `<a href="/house_chores/${chore.id}"</a>${chore.name}`
          newHtml += `</label>`
          newHtml += `<form class="button_to" method="post" action="/house_chores/${chore.id}">`
          newHtml += `<input type="hidden" name="_method" value="delete">`
          newHtml += `<input class="destroy" type="submit" value="x">`
          newHtml += `</div>`
          newHtml += `</li>`
          $ul.append(newHtml)
        }
        // re-set the id to the current on the link
        $(".js-prev").attr("data-attribute", data["id"]);
        $(".js-next").attr("data-attribute", data.id - 1);
      })
    })
  })
})();

// click event to go to next house
(function() {
  $(document).on("click", ".js-next", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-attribute")) + 1;
    var $ul = $('.todo-list')
    $ul.html("")
    $.get("/houses/" + nextId + ".json", function(data) {
      console.log(data);
      $(".houseName").text(data["name"]);
      $(".houseCity").text(`The cleanest house in ${data["city"]}!`);
      for (var i = 0; i < data["chores"].length; i++) {
        var chore = data["chores"][i]
        var newHtml = " "
        newHtml += `<li>`
        newHtml += `<div class="view">`
        newHtml += `<label>`
        newHtml += `<a href="/house_chores/${chore.id}"</a>${chore.name}`
        newHtml += `</label>`
        newHtml += `<form class="button_to" method="post" action="/house_chores/${chore.id}">`
        newHtml += `<input type="hidden" name="_method" value="delete">`
        newHtml += `<input class="destroy" type="submit" value="x">`
        newHtml += `</div>`
        newHtml += `</li>`
        $ul.append(newHtml)
      }

      // re-set the id to the current on the link

      $(".js-next").attr("data-attribute", data["id"]);
      $(".js-prev").attr("data-attribute", data.id - 1);
    }).fail(function(e) {
      $.get("/houses/27.json", function(data) {
        $(".houseName").text(data["name"]);
        $(".houseCity").text(`The cleanest house in ${data["city"]}!`);
        for (var i = 0; i < data["chores"].length; i++) {
          var chore = data["chores"][i]
          var newHtml = " "
          newHtml += `<li>`
          newHtml += `<div class="view">`
          newHtml += `<label>`
          newHtml += `<a href="/house_chores/${chore.id}"</a>${chore.name}`
          newHtml += `</label>`
          newHtml += `<form class="button_to" method="post" action="/house_chores/${chore.id}">`
          newHtml += `<input type="hidden" name="_method" value="delete">`
          newHtml += `<input class="destroy" type="submit" value="x">`
          newHtml += `</div>`
          newHtml += `</li>`
          $ul.append(newHtml)
        }
        // re-set the id to the current on the link
        $(".js-prev").attr("data-attribute", data["id"]);
        $(".js-next").attr("data-attribute", data.id - 1);
      })
    })
  });
})();
