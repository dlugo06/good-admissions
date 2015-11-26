class Student < ActiveRecord::Base
  belongs_to :cohort
  has_many :loans
  has_many :checks
  has_many :wires
  has_many :stripes
  before_create :calculate_balance
  before_destroy :destroy_payments


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :phone_num, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def payments
     loans + checks + stripes + wires
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def calculate_balance(deposit=1000)
    self.balance -= discount
    self.balance -= deposit
  end

  def discount_difference(params)
    self.discount - params["discount"].to_i
  end

  private
  def destroy_payments
    loans.destroy_all
    checks.destroy_all
    stripes.destroy_all
    wires.destroy_all
  end
end
