class Vacancy < ActiveRecord::Base
  
  enum status: [:draft, :open, :closed]
  enum worktype: [:internship, :fulltime, :parttime]

  belongs_to :profile
  validates :title, :brief_description, :description, presence: true
  validates :description, length: { minimum: 50, maximum: 2000 }
  validates :brief_description, length: { maximum: 140 }
end
