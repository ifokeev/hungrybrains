$(document).on 'click', '.auth-header .student, .auth-header .company', () ->
  $('.auth-content').removeClass('hide').addClass('hide')

  type = ($(@).hasClass('student') && 'student') || 'company'

  $('.auth-tabs').removeClass('auth-tabs-active')
  $(@).addClass('auth-tabs-active')

  $(".auth-content.#{type}").removeClass('hide')