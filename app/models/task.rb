class Task
  include Mongoid::Document
  field :name, :type => String
  field :deadline, :type => DateTime
end
