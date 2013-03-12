class ItemType
  include Mongoid::Document

  field :name, type: String

  attr_accessible :name

  has_many :items
end