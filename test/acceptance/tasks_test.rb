require 'minitest_helper'

describe "TasksAcceptance" do

  it 'is created by submitting a form on index page' do
    visit tasks_path
    fill_in 'Name', with: 'Mown the lawn'
    fill_in 'Deadline', with: '15/05/2012'
    click_button 'Save'
    page.must_have_content('Mown the lawn')
  end

end
