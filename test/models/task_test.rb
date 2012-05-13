require "minitest_helper"

describe Task do


  before do
    @task = Fabricate(:task)
  end

  it "must be invalid" do
    @task = Fabricate.build(:task, name: '', deadline: '')
    @task.valid?.must_equal false
    @task.done.must_equal false
  end

end
