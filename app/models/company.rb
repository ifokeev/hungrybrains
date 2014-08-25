class Company < ActiveRecord::Base
  belongs_to :user
  has_many   :vacancies, dependent: :destroy
  has_many   :relationships
  has_many   :students, through: :relationships, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "200x200>", 
                                       thumb:  "75x75>" }, 
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_from_url(url)
    self.avatar = URI.parse(url)
  end

end
