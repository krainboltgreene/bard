# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.

#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require slides
#= require fancybox
#= require guiders
#= require isotope
#= require progress
#= require alerts
#= require twipsy
#= require popover
#= require modal
#= require buttons
#= require scrollspy
#= require tabs
#= require_tree .

$(".alert-message").alert()
popovers = $("[data-title][data-content]")
popovers.popover
  "title": "data-title",
  "position": popovers.data("position") or "right"
