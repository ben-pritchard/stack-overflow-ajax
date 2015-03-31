require 'rails_helper'

def sign_in(user)
  visit '/'
  click_on "Sign in"
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Log in"
end
