require 'spec_helper'
require 'rails_helper'

feature 'create user' do
scenario "can create user" do
visit'/users/new'
expect(page).to have_content('New User')

fill_in 'Name',:with=>'sakura'
fill_in 'Password',:with=>'sakura'
fill_in 'Confirm', :with=>'sakura'
click_button 'Create User'

end
scenario "can create user error" do
        visit'/users/new'
       expect(page).to have_content('New User')
        click_button'Create User'
       expect(page).to have_content('errors')
    end
end