require "minitest_helper"

describe Task do

  subject { Task.new }

  # fixtures :all

  before do
    @task = Task.new
  end

  it "must be valid" do
    @task.valid?.must_equal true
  end

  it "must be a real test" do
    flunk "Need real tests"
  end

  # describe "when doing its thing" do
  #   it "must be interesting" do
  #     @task.blow_minds!
  #     @task.interesting?.must_equal true
  #   end
  # end

end
