class Relationship < ActiveRecord::Base
  belongs_to :student
  belongs_to :company
  validates :student_id, uniqueness: { scope: :company_id }  
end
