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

  attr_accessible :name, :description, :status, :item_type_id, :quantity, :item_image, :code

  has_many :orders
  belongs_to :item_type
  # belongs_to :borrower, class_name: "User"

  validates_presence_of :name, :item_type_id, :code

  def last_order
    orders.blank? ? nil : orders.sort{ |x,y| y.end_date <=> x.end_date }.first
  end

  def available_in
    # unless orders.blank?
    #   return orders.map(&:end_date).max > Date.today ? orders.map(&:end_date).max + 1.day : Date.today
    # end
    # return Date.today
    if last_order.nil?
      return Date.today
    else
      if last_order.start_date > Date.today
        return Date.today
      else
        return last_order.end_date
      end
    end
  end

  def current_order
    # binding.pry
    orders.where(:start_date.lte => Time.now, :end_date.gte => Time.now).first
  end
end