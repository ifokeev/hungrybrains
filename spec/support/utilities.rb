include ApplicationHelper

def sign_in(user)
  visit signin_path
  within(".auth-content.company") do
    fill_in "Email",    with: user.email
    fill_in "Пароль",   with: user.password
    click_button "Вход"
  end
end
