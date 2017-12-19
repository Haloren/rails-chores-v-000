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
    var prevId = parseInt($(".js-prev").attr("data-attribute")) -1;

    $.get("/houses/" + prevId + ".json", function(data) {
      console.log(data)
      $(".houseName").text(data["name"]);
      $(".houseCity").text(data["name"]);

      // re-set the id to the current on the link
      $(".js-prev").attr("data-attribute", data["id"]);
    })
  })
})();

(function() {
  $(document).on("click", ".js-next", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-attribute")) + 1;

    $.get("/houses/" + nextId + ".json", function(data) {
      // console.log(data);
      $(".houseName").text(data["name"]);
      $(".houseCity").text(data["city"]);
      // $(".choreName").text(data["chore"]["name"]);
      // re-set the id to the current on the link
      $(".js-next").attr("data-attribute", data["id"]);
    });
  });
})();

// function nextBook(){
//   $(".next_link").on("click", function(e){
//     e.preventDefault();
//     var nextId = parseInt($(".next_link").attr("data-attribute")) + 1;
//     $.get("/books/" + nextId + ".json", function(data) {
//       $(".bookTitle").text(data["title"]);
//       $(".bookAuthor").text(data["author"]);
//       $(".bookSummary").text(data["summary"]);
//       // re-set the id to current on the link
//       $(".next_link").attr("data-attribute", data["id"]);
//       debugger;
//     });
//   });
// }
//IIFE
// $(function() {
//   const target = document
//   document.getElementById('target').addEventListener('click', function () {
//
//   })
// })
