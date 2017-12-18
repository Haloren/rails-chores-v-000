// $(function() {
//   $('.house-link_' + house.id).on('click', function(e) {
//     e.preventDefault();
//     alert("Yo!")
//   })
// });

(function() {
  $(document).on('mouseover', '.house-link',  function(e) {
    // e.preventDefault()

    var $href = $(this).context.lastElementChild.attributes.href.value

    $.get($href).success(function(json) {

      var $li = $('#house-details_' + this.url.slice(-1))
      $li.html("")

      $li.append(`<h5>${json.city}</h5>`)
    })

  })
})();

(function() {
  $(document).on('mouseout', '.house-link',  function(e) {
    // e.preventDefault()

    var $href = $(this).context.lastElementChild.attributes.href.value

    $.get($href).success(function(json) {

      var $li = $('#house-details_' + this.url.slice(-1))
      $li.empty()

    })

  })
})();


(function() {
  $(document).on("click", ".js-prev", function(e) {
    e.preventDefault();

    alert("Yo!");
  })
})();

(function() {
  $(document).on("click", ".js-next", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/houses/" + nextId + ".json", function(data) {
      console.log(data);
      $(".houseName").text(data["name"]);
      $(".houseCity").text(data["city"]);
      // debugger
      $(".house_choreChoreName").text(data["house_chore"]["chore"]["name"]);
      // re-set the id to the current on the link
      $(".js-next").attr("data-id", data["id"]);
    })
  })
})();
//IIFE
// $(function() {
//   const target = document
//   document.getElementById('target').addEventListener('click', function () {
//
//   })
// })
