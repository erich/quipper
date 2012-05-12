require "minitest_helper"

describe User do

  subject { User.new }

  # fixtures :all

  before do
    @john = User.new
  end

  it 'must be invalid if blank' do
    @john.valid?.must_equal false
  end


  it 'must invalid with invalid email' do
    @john.email = 'asasdfas'
    @john.name = 'John Smith'
    @john.valid?.must_equal false
  end

  it 'must be valid with name and valid email' do
    @john.email = 'john@example.com'
    @john.name = 'John Smith'
    @john.valid?.must_equal true
  end
end
