class Event
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  embedded_in :user, :inverse_of => :events

  attr_accessible :name, :description
  validates :user, :name, :presence => true
end
