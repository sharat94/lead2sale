var ready = function() {

	setTimeout(function(){
    $('#flash').remove();
  }, 3000);

}
$(document).ready(ready);
  $(document).on('page:load', ready);
