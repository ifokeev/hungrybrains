class Response < ActiveRecord::Base
  belongs_to :student
  belongs_to :vacancy
  validates :vacancy_id, uniqueness: { scope: :student_id }
  enum status: [:unreviewed, :accepted, :rejected]
end
