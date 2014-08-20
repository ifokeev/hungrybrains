class Vacancy < ActiveRecord::Base
  belongs_to :profile
  validates :brief_description, length: { maximum: 140 }
end
