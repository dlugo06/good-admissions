class Student < ActiveRecord::Base
  has_many :loans
  has_many :checks
  has_many :wires
  has_many :stripes


  def payments
    @payments = []
    loans.each do |loan|
      @payments << loan
    end
    checks.each do |check|
      @payments << check
    end
    stripes.each do |stripe|
      @payments << stripe
    end
    wires.each do |wire|
      @payments << wire
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
