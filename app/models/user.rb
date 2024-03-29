class User
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  validates_presence_of :name
  validates :email, email: true
end
