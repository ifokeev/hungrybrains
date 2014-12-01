class Vacancy < ActiveRecord::Base
  include Search

  scoped_search :on => [:title, :description, :brief_description, :location]

  enum status: [:draft, :open, :closed]
  enum worktype: [:internship, :fulltime, :parttime]

  belongs_to :company, counter_cache: true
  has_many   :responses
  has_many   :students, through: :responses, dependent: :destroy
  has_many   :categories, as: :owner

  validates :title, :brief_description, :description, presence: true
  validates :description, length: { maximum: 2000 }
  validates :brief_description, length: { maximum: 140 }

  scope :latest, -> { order('id DESC') }

  def self.from_company_followed_by(student)
    followed_company_ids = "SELECT company_id FROM relationships
                            WHERE student_id = :student_id"
    where("company_id IN (#{followed_company_ids})", student_id: student.id)
  end
end
