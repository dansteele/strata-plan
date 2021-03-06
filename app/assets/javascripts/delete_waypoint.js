$(document).ready(function() {
  addDeleteListener();
})

function addDeleteListener() {
  $('.delete-button').click(function() {
    var _this = this;
    $.ajax({
      parent: _this,
      method: "DELETE",
      url: "http://strata-plan.herokuapp.com/waypoints/" + _this.id, // TODO: Make dynamic 
      success: function(res) {
        $(this.parent.parentElement).hide(300, function() {
          $(this).remove()
          map.drawMap("#map-canvas")
        });
      }
    })
  })
}
