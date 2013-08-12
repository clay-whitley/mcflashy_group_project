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

  $('#content_container').on('click', '#newDeck', function(){
    $(this).fadeOut();
    $.get('/decks/new', function(response){
      $('#content_container').append(response).find('#newDeckPartial').hide().fadeIn('slow');
    });
  });

  $('#content_container').on('click', '#createDeckSubmit', function(e){
    e.preventDefault();
    $.post('/decks', $(this).closest('form').serialize(), function(response){
      $('#newDeckPartial').fadeOut('slow').remove();
      $('#newDeck').fadeIn('slow');
      $('#content_container').find('tbody').append(response);
    });
  });

  $('#content_container').on('click', '.start_game', function(e){
    e.preventDefault();
    url = $(this).attr("href");
    $('#content_container').fadeOut();
    $.get(url, function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  $('#content_container').on('click', '#submitGuess', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $.post('/guess', $(this).closest('form').serialize(), function(response){
      $('#content_container').html(response);
      $('#content_container').fadeIn();
    });
  });

  $('#content_container').on('click', '#nextCard', function(e){
    e.preventDefault();
    url = $(this).attr('href');
    $('#content_container').fadeOut();
    $.get(url, function(response){
      $('#content_container').html(response);
      $('#content_container').fadeIn();
    });
  });
});
