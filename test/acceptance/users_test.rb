require 'minitest_helper'

describe "UsersAcceptance" do

  it 'is created by submitting a form' do
    visit new_user_path
    fill_in 'Name', with: 'John Smith'
    fill_in 'Email', with: 'john.smith@example.com'
    click_button 'Save'
    page.must_have_content('John Smith')
  end

end
