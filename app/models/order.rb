class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :start_date, type: Date
  field :end_date, type: Date
  field :status, type: String
  field :reason, type: String

  belongs_to :item
  belongs_to :user

  attr_accessible :start_date, :end_date, :reason, :item_id
  validates_presence_of :start_date, :end_date, :reason
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
    if in_range(start_date, end_date, item_id)
      errors.add(:base, "This item has already been booked at this range of time, please choose another day")
      return false
    end
    return true
  end

  def in_range(start_time, end_time, item_id)
    Order.where(:start_date.gte => start_time, :start_date.lte => end_time, :item_id => item_id).first || Order.where(:end_date.gte => start_time, :end_date.lte => end_time, :item_id => item_id ).first
  end

  def as_json
    {
      title: reason,
      start: start_date.to_datetime,
      end: end_date
    }
  end
end