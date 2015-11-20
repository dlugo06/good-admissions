class Student < ActiveRecord::Base
  has_many :loans
  has_many :checks
  has_many :wires
  has_many :stripes


  def payments
     loans + checks + stripes + wires
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
