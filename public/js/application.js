$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#logout').on('click', function(e){
    e.preventDefault();
    $(this).fadeOut();
    $('#userStats').fadeOut();
    $('#decksPage').fadeOut();
    $('.login_form').fadeIn();
    $('#content_container').fadeOut();
    $.get('/sign_out', function(data){
      $('#content_container').html(data).fadeIn();
    });
  });

  // NEW DECK FORM

  $('#content_container').on('click', '#newDeck', function(){
    $(this).fadeOut();
    $.get('/decks/new', function(response){
      $('#content_container').append(response).find('#newDeckPartial').hide().fadeIn('slow');
    });
  });

  // CREATE DECK

  $('#content_container').on('click', '#createDeckSubmit', function(e){
    e.preventDefault();
    $.post('/decks', $(this).closest('form').serialize(), function(response){
      $('#newDeckPartial').fadeOut('slow').remove();
      $('#newDeck').fadeIn('slow');
      $('#content_container').find('tbody').append(response);
    });
  });

  // START GAME

  $('#content_container').on('click', '.start_game', function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    $('#content_container').fadeOut();
    $.get(url, function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // SUBMIT GUESS

  $('#content_container').on('click', '#submitGuess', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $.post('/guess', $(this).closest('form').serialize(), function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // NEXT CARD

  $('#content_container').on('click', '#nextCard', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $('#content_container').fadeOut();
    $.get(url, function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // CREATE USER

  $('#content_container').on('click', '#createUserSubmit', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $('#logout').fadeIn();
    $('#userStats').fadeIn();
    $('#decksPage').fadeIn();
    $('.login_form').fadeOut();
    $.post('/sign_up', $(this).closest('form').serialize(), function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // SIGN IN

  $('.container').on('click', '#signInUser', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $(this).closest('form').fadeOut();
    $('#logout').fadeIn();
    $('#userStats').fadeIn();
    $('#decksPage').fadeIn();
    $.post('/login', $(this).closest('form').serialize(), function(response){
      $('#content_container').html(response).fadeIn();
    });
    $(this).closest('form').find('input').val('');
  });

  // DECK INDEX

  $('.container').on('click', '#decksPage', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $.get('/choose_deck', function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // QUIT ROUND

  $('#content_container').on('click', "#quitRound", function(e){
    e.preventDefault();
    var url = "/your_results/" + $(this).data('round');
    $('#content_container').fadeOut();
    $.get(url, function(response){
      $('#content_container').html(response).fadeIn();
    });
  });

  // USER STATS

  $('.container').on('click', '#userStats', function(e){
    e.preventDefault();
    $('#content_container').fadeOut();
    $.get('/user_stats', function(response){
      $('#content_container').html(response).fadeIn();
    });
  });
});
