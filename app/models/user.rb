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
end
