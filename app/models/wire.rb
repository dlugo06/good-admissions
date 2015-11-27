class Wire < ActiveRecord::Base
  belongs_to :student
  before_create :set_sender

  def set_sender
    if sender.blank?
      self.sender = self.student.full_name
    end
  end
end
