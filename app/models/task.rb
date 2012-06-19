class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Searchable

  searchable :name

  field :name, type: String
  field :deadline, type: DateTime
  field :completed, type: Boolean, default: false

  validates :name, presence: true
  validates :deadline, presence: true, :date => {:after => Date.today}

  def self.default_scope
    order('created_at ASC').order('completed')
  end

  def self.completed
    where(completed: true)
  end

  def self.uncompleted
    where(completed: false)
  end

  def self.count_completed
    self.completed.count
  end

  def self.count_not_completed
    self.uncompleted.count
  end

  def self.after_deadline
    where(:deadline.lte => Time.now.utc.beginning_of_day)
  end

  def self.before_deadline
    where(:deadline.gt => Time.now.utc.beginning_of_day)
  end

  def self.count_after_deadline
    self.after_deadline.count
  end

  def self.count_before_deadline
    self.before_deadline.count
  end

  def self.active
    uncompleted.before_deadline.count
  end

  def self.active
    self.active.count
  end

  def self.search_and_filter(params)
    if params[:completed] and params[:deadline]
      self.completed.after_deadline.search_text(params[:search])
    elsif params[:completed]
      self.completed.search_text(params[:search])
    elsif params[:deadline]
      self.after_deadline.search_text(params[:search])
    else 
      all.search_text(params[:search])
    end
  end

  def self.statistics
    {
      all: count, 
      completed: count_completed, 
      uncompleted: count_not_completed, 
      after_deadline: count_after_deadline,
      active: count_before_deadline
    }
  end
end
