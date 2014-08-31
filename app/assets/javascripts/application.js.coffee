#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require turbolinks
#= require_tree .
ready = ->
  $('.vacancy-row:last, .company-row:last').addClass('last-row')

$(document).ready(ready)
$(document).on('page:load', ready)

$(document).on 'click', '.pagination a', () ->
  History.pushState(null, null, this.href)

  $.getScript(this.href);
  $('html, body').animate({
    scrollTop: $("#vacancies").offset().top - 100
  }, 'fast')
  return false;
