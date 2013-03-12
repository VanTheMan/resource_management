class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :start_date, type: Date
  field :end_date, type: Date
  field :status, type: String
  field :title, type: String

  belongs_to :item
  belongs_to :user

  attr_accessible :start_date, :end_date, :title, :item_id
  validates_presence_of :start_date, :end_date
  validate :valid_input_dates?

  def valid_input_dates?
    unless start_date < end_date
      errors.add(:base, "Start date must be before end date")
      return false
    end

    unless start_date >= Date.today
      errors.add(:base, "Start date cannot be in the past")
      return false
    end

    if is_booked_in?(start_date, end_date)
      errors.add(:base, "This item has already been booked at this range of time, please choose another day")
      return false
    end

    return true
  end

  def in_range?(start_time, end_time)
    (start_date > end_time) || (end_date < start_time)
  end

  def is_booked_in?(start_time, end_time)
    Order.all.each do |o|
      return true if o.in_range?(start_time, end_time) == true
    end
    return false
  end
end