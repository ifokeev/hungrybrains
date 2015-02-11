
function checkForStudentTab() {
  return $('.student').hasClass('auth-tabs-active');
}

function setError(element, company, msg) {
  var type = element.type;
  if (element.type == 'text') type = 'name';
  if (msg) {
    element.classList.add('errorClass');
    $('.' + company + type + '-error').html(msg);
  } else {
    element.classList.remove('errorClass');
    $('.' + company + type + '-error').html('');
  }
}

function validate(element) {
  var valided = true;
  var company = '';
  if (!checkForStudentTab()) company = 'company';

  if (element.type == 'email') {
    if (!element.value.match(/.+?@(.+?\.)+.+/i)) {
      setError(element, company, 'Введите корректный email');
    } else {
      setError(element, company);
    }
  }
  if (element.type == 'password') {
    if (element.value.length < 5) {
      setError(element, company, 'Выберите более длинный пароль');
    } else if (!element.value.match(/\d/)) {
      setError(element, company,'Пароль должен содержать хотя бы 1 цифру');
    } else setError(element, company);
  }
  if (company == 'company' && element.type == 'text') {
    if (element.value.length == 0) setError(element, company,'Введите название');
      else setError(element, company)
  }

  if (!checkForStudentTab()) {
    inputs.forEach(function(element) {
      if (element.classList.contains('errorClass') && element.id.split('_')[0] == 'company') {
        valided = false;
        $('#company_button').prop('disabled', true)
      }
  });
    if (valided) $('#company_button').prop('disabled', false)
  } else {
    valided = true;
    inputs.forEach(function(element) {
      if (element.classList.contains('errorClass') && element.id.split('_')[0] == 'user') {
        valided = false;
        $('#student_button').prop('disabled', true)
      }
  });
    if (valided) $('#student_button').prop('disabled', false)
  }

}

main = function() {
    $('#student_button').prop('disabled', true);
    $('#company_button').prop('disabled', true);
    inputs = [];
    inputs.push($('#user_password')[0]);
    inputs.push($('#user_email')[0]);
    inputs.push($('#company_email')[0]);
    inputs.push($('#company_password')[0]);
    inputs.push($('#company_name')[0]);

    inputs.forEach(function(element, index) {
        if (element) {
            element.addEventListener('input', function (event) {
                validate(event.target);
            })
        }
    })

};

$(document).ready(main);
$(document).on('page:load', main);