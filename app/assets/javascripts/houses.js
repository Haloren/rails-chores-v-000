$(function() {
  document.getElementById("div-view").addEventListener("click", function(e) {
  	// e.target is the clicked element!
  	// If it was a list item
  	if(e.target && e.target.nodeName == "A") {
  		// List item found!  Output the ID!
  		console.log("House link ", e.target.id.replace("house-", ""), " was clicked!");
  	}
  })
});
