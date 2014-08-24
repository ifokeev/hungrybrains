class Student < ActiveRecord::Base
  belongs_to :user
  has_many   :responses
  has_many   :vacancies, through: :responses
  has_many   :relationships  
  has_many   :companies, through: :relationships
end
