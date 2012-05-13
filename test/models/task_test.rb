require "minitest_helper"

describe Task do

  subject { Task.new }

  # fixtures :all

  before do
    @task = Task.new
  end

  it "must be invalid" do
    @task.valid?.must_equal false
  end

end
