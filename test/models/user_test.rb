require "minitest_helper"

describe User do

  subject { User.new }

  # fixtures :all

  before do
    @user = User.new
  end

  it "must be valid" do
    @user.valid?.must_equal true
  end

end
