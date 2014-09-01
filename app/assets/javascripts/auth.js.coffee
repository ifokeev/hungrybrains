ready = ->
  updateMenu = (state) ->
    $('.auth-content').removeClass('hide').addClass('hide')

    $('.auth-tabs').removeClass('auth-tabs-active')

    $(".auth-tabs.#{state}").addClass('auth-tabs-active')
    $(".auth-content.#{state}").removeClass('hide')

  checkState = () ->
    params = $.url().param()

    if params['company'] == ""
      updateMenu('company')
    else
      updateMenu('student')

  checkState()

  $( '.auth-header .student, .auth-header .company').on 'click', () ->
    type = ($(@).hasClass('student') && 'student') || 'company'
    updateMenu(type)

$(document).ready(ready)
$(document).on('page:load', ready)

