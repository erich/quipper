class Task
  include Mongoid::Document
  field :name, type: String
  field :deadline, type: DateTime
  field :done, type: Boolean, default: false

  validates :name, presence: true
  validates :deadline, presence: true
end
