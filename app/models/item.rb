class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  # field :status, type: String, default: "Available" # Available, N/A
  # field :item_type
  # field :quantity, type: Integer
  field :item_image_uid
  field :code, type: String
  image_accessor :item_image

  attr_accessible :name, :description, :status, :item_type_id, :quantity, :item_image

  has_many :orders
  belongs_to :item_type
  belongs_to :borrower, class_name: "User"

  validates_presence_of :name, :item_type_id

  def available_in
    unless orders.blank?
      return orders.map(&:end_date).max > Date.today ? orders.map(&:end_date).max + 1.day : Date.today
    end
    return Date.today
  end
end