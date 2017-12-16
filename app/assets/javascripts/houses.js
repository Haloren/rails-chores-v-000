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

      var $p = $('#house-details_' + this.url.slice(-1))
      $p.html("")

      $p.append(`<h5>${json.city}</h5>`)
    })

  })
})();

(function() {
  $(document).on('mouseout', '.house-link',  function(e) {
    // e.preventDefault()

    var $href = $(this).context.lastElementChild.attributes.href.value

    $.get($href).success(function(json) {

      var $p = $('#house-details_' + this.url.slice(-1))
      $p.empty()

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
