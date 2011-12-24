# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#type_select .type .btn input').change ->
    $('#type_select .type .btn').removeClass 'primary'
    $('#type_select .type').removeClass 'well'
    if $(this).is ':checked'
      $(this).parent().addClass 'primary'
    else
      $(this).parent().removeClass 'primary'
    $('fieldset #type_form .type').hide()
    $('fieldset #type_details .detail').hide()
    switch $(this).attr 'value'
      when 'king'
        $('fieldset #type_form #king').fadeIn 'veryfast'
        $('fieldset #type_details #king').slideDown 'veryfast'
      when 'storyteller'
        $('fieldset #type_form #storyteller').fadeIn 'veryfast'
        $('fieldset #type_details #storyteller').slideDown 'veryfast'
      when 'hero'
        $('fieldset #type_form #hero').fadeIn 'veryfast'
        $('fieldset #type_details #hero').slideDown 'veryfast'
