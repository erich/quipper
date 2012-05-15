class Task
  include Mongoid::Document
  include Mongoid::Timestamps

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

  def self.after_deadline
    where(:deadline.lte => Time.now.utc.beginning_of_day)
  end

  def self.filter(params)
    if params[:completed]
      self.completed
    elsif params[:deadline]
      self.after_deadline
    else 
      all
    end
  end
end
