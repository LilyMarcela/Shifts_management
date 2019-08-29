class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

  validates_presence_of :name, :email

  belongs_to :role
  has_many :hours, :dependent => :destroy

  before_save :assign_role

  def assign_role
    self.role_id ||= 1
  end

  def admin?
    self.role_id == 2
  end

  def total_worked_hours
    self.hours.map do |hour|
      hour.date_end.to_f - hour.date_start.to_f
    end.reduce(&:+)/3600
  end
end
