class Cohort < ActiveRecord::Base
  has_many :students
  before_destroy :clear_cohort_on_students

  private
  def clear_cohort_on_students
    students.each do |s|
      s.cohort_id = nil
      s.save
    end
  end
end
