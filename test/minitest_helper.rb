ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "capybara/rails"
require "minitest/rails"
require "minitest/pride"

class MiniTest::Rails::Spec
  # Uncomment if you want to support fixtures for all specs
  # or
  # place within spec class you want to support fixtures for
  # include MiniTest::Rails::Fixtures

  # Add methods to be used by all specs here...

end

class MiniTest::Rails::Model

  # Add methods to be used by model specs here...

end

MiniTest::Spec.register_spec_type(MiniTest::Rails::Model) do |desc|
  desc.superclass == Mongoid::Document
end

class MiniTest::Rails::Controller
  include ActionController::TestCase::Behavior
  before do
    @request  = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @routes   = Rails.application.routes
  end

  # Add methods to be used by controller specs here...

end
MiniTest::Spec.register_spec_type(/Controller$/, MiniTest::Rails::Controller)

class AcceptanceSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end
MiniTest::Spec.register_spec_type /Acceptance$/, AcceptanceSpec

class MiniTest::Rails::Helper

  # Add methods to be used by helper specs here...

end

MiniTest::Spec.register_spec_type(/Helper$/, MiniTest::Rails::Helper)

class MiniTest::Rails::Mailer

  # Add methods to be used by mailer specs here...

end

MiniTest::Spec.register_spec_type(MiniTest::Rails::Mailer) do |desc|
  #desc.superclass == ActionMailer::Base
end

