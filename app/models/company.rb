class Company < ActiveRecord::Base
  belongs_to :user
  has_many   :vacancies, dependent: :destroy
  has_many   :relationships
  has_many   :students, through: :relationships, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", 
                                       thumb:  "100x100>" }, 
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
