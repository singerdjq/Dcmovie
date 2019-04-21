require 'spec_helper'
require 'rails_helper'

feature 'user login' do
scenario "can login" do
visit'/admin/index'
fill_in 'Name',:with=>'sakura'
fill_in 'Password',:with=>'sakura'
click_button 'Login'
end
scenario "can login error" do
        visit'/admin/index'
        click_button'Login'
    end
end