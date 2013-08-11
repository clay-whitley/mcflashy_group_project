$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#logout').on('click', function(e){
    e.preventDefault();
    $.get('/sign_out', function(data){
      $('#content_container').html(data);
    });
  });
});
