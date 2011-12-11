# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#TypeSelect .type .btn input').change ->
    $('#TypeSelect .type .btn').removeClass 'primary'
    if $(this).is ':checked'
      $(this).parent().addClass 'primary'
    else
      $(this).parent().removeClass 'primary'
    $('fieldset #TypeForm .type').fadeOut 'fast'
    switch $(this).attr 'value'
      when 'king'
        $('fieldset #TypeForm #king_form.type').fadeIn 'fast'
      when 'storyteller'
        $('fieldset #TypeForm #storyteller_form.type').fadeIn 'fast'
      when 'hero'
        $('fieldset #TypeForm #hero_form.type').fadeIn 'fast'
