// $(function() {
//   $('.house-link_' + house.id).on('click', function(e) {
//     e.preventDefault();
//     alert("Yo!")
//   })
// });

(function() {
  $(document).on('click', '.house-link',  function(e) {
    e.preventDefault()

    var $href = $(this).context.lastElementChild.attributes.href.value

    $.get($href).success(function(json) {

      // console.log(json)
      var $ul = $('#house-details_' + this.url.slice(-1))
      $ul.html("")

      $ul.append(`${json.city}`)
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
