class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :stats

  private 
  def stats
    @stats = Task.statistics
  end
end
