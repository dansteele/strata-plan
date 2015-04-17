$(document).ready(function() {
  $('.delete-button').click(function() {
    var _this = this;
    $.ajax({
      parent: _this,
      method: "DELETE",
      url: "http://localhost:3000/waypoints/" + _this.parentElement.id, // TODO: Make dynamic 
      success: function(res) {
        $(this.parent.parentElement).hide(300);
      }
    })
  })
})