ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "database_cleaner"

DatabaseCleaner.orm      = :mongoid
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.logger   = Rails.logger

class UnitTest < MiniTest::Unit::TestCase
  include Mongoid::Matchers

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
