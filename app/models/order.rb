class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :start_date, type: Date
  field :end_date, type: Date
  field :status, type: String

  has_one :item
  belongs_to :user
end