class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :status, type: String, default: "Available" # Available, N/A
  field :item_type
  field :quantity, type: Integer
  field :item_image_uid
  image_accessor :item_image

  attr_accessible :name, :description, :status, :item_type, :quantity, :item_image

  belongs_to :order
  belongs_to :borrower, inverse_of: User
end