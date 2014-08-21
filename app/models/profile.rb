class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :vacancies
  validates :name, uniqueness: true
end
