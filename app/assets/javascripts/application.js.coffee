#= require jquery
#= require bootstrap-sprockets
#= require bootstrap-datepicker.js
#= require bootstrap-datepicker.ru.js
#= require jquery_ujs
#= require turbolinks
#= require moment
#= require moment/ru.js
#= require_tree .

ready = ->
  $('.vacancy-row:last, .company-row:last').addClass('last-row')

  window.dp = $(document).find('#datepicker-container div').datepicker({
    todayBtn: true,
    language: "ru",
    todayHighlight: true,
    format: "yyyy/mm/dd"
  }).on('changeDate', (e) ->
    Turbolinks.visit('/events/date/' + e.format(0, 'yyyymmdd'))
  )


$(document).ready(ready)
$(document).on('page:load', ready)

$(document).on 'click', '.today', () ->
  Turbolinks.visit('/events/date/' + moment().format('YYYYMMDD') )

$(document).on 'click', '.pagination a', () ->
  History.pushState(null, null, this.href)

  $.getScript(this.href);
  $('html, body').animate({
    scrollTop: $("#vacancies").offset().top - 100
  }, 'fast')
  return false;
