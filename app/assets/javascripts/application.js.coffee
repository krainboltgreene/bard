#= require jquery
#= require jquery_ujs
#= require prefix
#= require slides
#= require guiders
#= require isotope
#= require progress
#= require smoke
#= require bootstrap/alerts
#= require bootstrap/buttons
#= require bootstrap/dropdown
#= require bootstrap/alerts
#= require bootstrap/modal
#= require bootstrap/twipsy
#= require bootstrap/popover
#= require jquery/prefix
#= require_tree .

dom_errors = ".error_messages"

$(".alert-message").alert()

$("form [data-title][data-content]").popover "title" : "data-title"

$("[data-twipsy]").twipsy "title" : "data-twipsy"

$(dom_errors + ".modal").modal 'show'

$(dom_errors + " .modal-footer .btn").click ->
  $(dom_errors + ".modal").modal 'toggle'
