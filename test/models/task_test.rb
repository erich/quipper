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
    @task.done.must_equal false
    @task.created_at.is_a?(Time).must_equal true
  end

  it 'must be sorted in right order (last created last and unfinished first)' do
    @first_task = Fabricate(:task, created_at: Time.now.utc.beginning_of_week)
    @second_task = Fabricate(:task, created_at: Time.now.utc.end_of_week)
    @unfinished_task = Fabricate(:task, created_at: Time.now.utc.end_of_week)
    @finished_task = Fabricate(:task, created_at: Time.now.utc.end_of_week, done: true)
    Task.all.first.must_equal @first_task
    Task.all.second.must_equal @second_task
    Task.all.third.must_equal @unfinished_task
    Task.all.fourth.must_equal @finished_task
  end
  it 'must filter done tasks'
end
