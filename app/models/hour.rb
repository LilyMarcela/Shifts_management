class Hour < ApplicationRecord
  belongs_to :user

  scope :filter_by_date, -> (date) { where(date_start: date) }

  def self.hours_summary
    Hour.all
  end
end
