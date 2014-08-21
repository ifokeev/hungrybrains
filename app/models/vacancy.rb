class Vacancy < ActiveRecord::Base
  
  enum status: [:draft, :open, :closed]
  enum worktype: [:internship, :fulltime, :parttime]

  belongs_to :profile
  validates :brief_description, length: { maximum: 140 }
end
