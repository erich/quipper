class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :deadline, type: DateTime
  field :done, type: Boolean, default: false

  validates :name, presence: true
  validates :deadline, presence: true

  def self.default_scope
    order('created_at ASC').order('done')
  end
end
