require 'minitest_helper'

describe "TasksAcceptance" do

  it 'is created by submitting a form on index page' do
    visit tasks_path
    fill_in 'Name', with: 'Mown the lawn'
    fill_in 'Deadline', with: '15/05/2012'
    click_button 'Save'
    page.must_have_content('Mown the lawn')
  end

  it 'is filtered' do
    Fabricate(:task, name: 'Completed task', completed: true)
    visit tasks_path
    check 'Completed'
    click_button 'Filter'
    page.must_have_content('Completed task')
  end
end
