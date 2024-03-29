require "minitest_helper"

describe Task do


  before(:each) do
    Task.destroy_all
  end

  it "must be invalid if name and deadline are blank" do
    @task = Fabricate.build(:task, name: '', deadline: '')
    @task.valid?.must_equal false
  end

  it 'must be valid' do
    @task = Fabricate(:task)
    @task.completed.must_equal false
    @task.created_at.is_a?(Time).must_equal true
  end

  it 'must be sorted in right order (last created last and unfinished first)' do
    @first_task = Fabricate(:task, created_at: Time.now.utc.beginning_of_week)
    @second_task = Fabricate(:task, created_at: Time.now.utc.end_of_week)
    @unfinished_task = Fabricate(:task, created_at: Time.now.utc.end_of_week)
    @finished_task = Fabricate(:task, created_at: Time.now.utc.end_of_week, completed: true)
    Task.all.first.must_equal @first_task
    Task.all.second.must_equal @second_task
    Task.all.third.must_equal @unfinished_task
    Task.all.fourth.must_equal @finished_task
  end

  it 'must search_and_filter completed task' do
    @completed_task = Fabricate(:task, completed: true)
    params = {completed: true}
    Task.search_and_filter(params).must_include @completed_task
  end

  it 'must search_and_filter uncompleted task' do
    @uncompleted_task = Fabricate(:task)
    params = {completed: true}
    Task.search_and_filter(params).wont_include @uncompleted_task
  end

  it 'must search_and_filter after deadline' do
    @after_deadline = Fabricate(:task)
    @after_deadline.update_attribute(:deadline, Time.now.utc.beginning_of_month)
    @before_deadline = Fabricate(:task, deadline: Time.now.utc.next_week)
    params = {deadline: true}
    Task.search_and_filter(params).must_include @after_deadline
    Task.search_and_filter(params).wont_include @before_deadline
  end

  it 'must search_and_filter completed and after deadline tasks' do
    @completed_after_deadline_task = Fabricate(:task, completed: true)
    @completed_after_deadline_task.update_attribute(:deadline, Time.now.utc.beginning_of_week)
    @completed_before_deadline_task = Fabricate(:task, completed: true, deadline: Time.now.utc.next_week)
    @uncompleted_task = Fabricate(:task)
    params = {deadline: true, completed: true}
    Task.search_and_filter(params).wont_include @uncompleted_task
    Task.search_and_filter(params).wont_include @completed_before_deadline
    Task.search_and_filter(params).must_include @completed_after_deadline_task
  end

  it 'wont search_and_filter any task' do
    @task = Fabricate(:task)
    @completed_after_deadline_task = Fabricate(:task, completed: true)
    @completed_after_deadline_task.update_attribute(:deadline, Time.now.utc.beginning_of_week)
    params = {completed: false, deadline: false}
    Task.search_and_filter(params).must_include @completed_after_deadline_task
    Task.search_and_filter(params).must_include @task
  end

  it 'must validate deadline date (it should not be possible to add date which is older than date today)' do
    @task = Fabricate.build(:task, :deadline => '29/02/2001')
    @task.valid?.must_equal false
  end

  it 'must have simple statistics for all users' do
    @task = Fabricate(:task)
    @completed_after_deadline_task = Fabricate(:task, completed: true)
    @completed_after_deadline_task.update_attribute(:deadline, Time.now.utc.beginning_of_week)
    stats = Task.statistics
    stats[:all].must_equal 2
    stats[:completed].must_equal 1
    stats[:uncompleted].must_equal 1
    stats[:after_deadline].must_equal 1
    stats[:active].must_equal 1
  end

  it 'must be searchable' do
    Fabricate(:task)
    Fabricate(:task, name: 'Wow')
    Task.text_search('ow').count.must_equal 1
  end
end
