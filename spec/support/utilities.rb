include ApplicationHelper

def sign_in(user, type)
  visit signin_path
  within(".auth-content." + type) do
    fill_in "Email",    with: user.email
    fill_in "Пароль",   with: user.password
    click_button "Вход"
  end
end
