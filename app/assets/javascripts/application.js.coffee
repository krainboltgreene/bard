# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.

#= require jquery
#= require jquery_ujs
#= require prefix
#= require slides
#= require guiders
#= require isotope
#= require progress
#= require bootstrap/alerts
#= require bootstrap/buttons
#= require bootstrap/dropdown
#= require bootstrap/alerts
#= require bootstrap/modal
#= require bootstrap/twipsy
#= require bootstrap/popover
#= require jquery/prefix
#= require_tree .

$(".alert-message").alert()
$("form [data-title][data-content]").popover "title" : "data-title"
$("[data-twipsy]").twipsy "title" : "data-twipsy"
$(".error_messages.modal").modal 'show'
$(".error_messages.modal .modal-footer .btn").click ->
  $(".error_messages.modal").modal 'toggle'
