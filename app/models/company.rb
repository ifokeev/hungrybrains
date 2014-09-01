class Company < ActiveRecord::Base
  include Avatar, Search

  scoped_search :on => [:name, :description, :location]

  belongs_to :user
  has_many   :vacancies, dependent: :destroy
  has_many   :relationships
  has_many   :students, through: :relationships, dependent: :destroy
  has_many   :categories, as: :owner
end
