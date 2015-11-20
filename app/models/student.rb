class Student < ActiveRecord::Base
  has_many :loans
  has_many :checks
  has_many :wires
  has_many :stripes


  def payments
    raise
  end
end
