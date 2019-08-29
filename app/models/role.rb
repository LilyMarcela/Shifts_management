class Role < ApplicationRecord

  def admin?
    self.role.name == "Admin"
  end

  def regular_employee?
    self.role.name == "Regular"
  end
end
