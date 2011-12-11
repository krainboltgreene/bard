# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#TypeSelect .type .btn input').change ->
    $('#TypeSelect .type .btn').removeClass 'primary'
    $('#TypeSelect .type').removeClass 'well'
    if $(this).is ':checked'
      $(this).parent().addClass 'primary'
    else
      $(this).parent().removeClass 'primary'
    $('fieldset #TypeForm .type').hide()
    $('fieldset #TypeDetails .detail').hide()
    switch $(this).attr 'value'
      when 'king'
        $('fieldset #TypeForm #king_form').fadeIn 'veryfast'
        $('fieldset #TypeDetails #king_details').slideDown 'veryfast'
      when 'storyteller'
        $('fieldset #TypeForm #storyteller_form').fadeIn 'veryfast'
        $('fieldset #TypeDetails #storyteller_details').slideDown 'veryfast'
      when 'hero'
        $('fieldset #TypeForm #hero_form').fadeIn 'veryfast'
        $('fieldset #TypeDetails #hero_details').slideDown 'veryfast'
