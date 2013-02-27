class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :start_date, type: Date
  field :end_date, type: Date
  field :status, type: String
  field :reason, type: String

  belongs_to :item
  belongs_to :user

  attr_accessible :start_date, :end_date
  validates_presence_of :start_date, :end_date
  validate :valid_input_dates?

  def valid_input_dates?
    if start_date && end_date
      if start_date > end_date
        return true
      end
    end
    return false
  end
end