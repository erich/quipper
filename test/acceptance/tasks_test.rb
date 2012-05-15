require 'minitest_helper'

describe "TasksAcceptance" do

  it 'is created by submitting a form on index page' do
    user = Fabricate(:user)
    visit user_tasks_path(user)
    fill_in 'Name', with: 'Mown the lawn'
    fill_in 'Deadline', with: '15/05/2012'
    click_button 'Save'
    page.must_have_content('John Smith')
    page.must_have_content('Mown the lawn')
  end

  it 'is filtered' do
    user = Fabricate(:user)
    visit user_tasks_path(user)
    Fabricate(:task, name: 'Completed task', completed: true)
    visit user_tasks_path(user)
    check 'Completed'
    click_button 'Filter'
    page.must_have_content('Completed task')
  end

  it 'is deleted' do
    user = Fabricate(:user)
    task = Fabricate(:task, name: 'Completed task', completed: true)
    visit edit_user_task_path(user, task)
    click_link 'Delete'
    page.must_have_content('Task was deleted')
  end
end
