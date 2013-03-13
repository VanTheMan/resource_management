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
  before_save :valid_range?

  def valid_input_dates?
    unless start_date <= end_date
      errors.add(:base, "Start date must be before end date")
      return false
    end

    unless start_date >= Date.today
      errors.add(:base, "Start date cannot be in the past")
      return false
    end

    return true
  end

  def valid_range?
    if in_range(start_date, end_date)
      errors.add(:base, "This item has already been booked at this range of time, please choose another day")
      return false
    end
    return true
  end

  def in_range(start_time, end_time)
    Order.where(:start_date.gte => start_time, :start_date.lte => end_time).first || Order.where(:end_date.gte => start_time, :end_date.lte => end_time ).first
  end

  def as_json
    {
      title: title,
      start: start_date,
      end: end_date
    }
  end
end