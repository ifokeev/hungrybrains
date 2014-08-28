class Student < ActiveRecord::Base

  enum language:   [:basic, :intermediate, :advanced, :fluent]
  enum experiense: [:no, :oneless, :onetotwo, :twomore]

  belongs_to :user
  has_many   :responses
  has_many   :vacancies, through: :responses, dependent: :destroy
  has_many   :relationships
  has_many   :companies, through: :relationships, dependent: :destroy
  has_many   :categories, as: :owner
  
  has_attached_file :avatar, styles: { medium: "200x200>", 
                                       thumb:  "75x75>" }, 
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_from_url(url)
    self.avatar = URI.parse(url)
  end

  def feed
    Vacancy.from_company_followed_by(self)
  end

  def responded?(vacancy)
    responses.find_by(vacancy_id: vacancy.id)
  end

  def respond(vacancy)
    responses.create(vacancy_id: vacancy.id)
  end  

  def revoke(vacancy)
    responses.find_by(vacancy: vacancy.id).destroy
  end  
  

  def following?(company)
    relationships.find_by(company_id: company.id)
  end

  def follow(company)
    relationships.create(company_id: company.id)
  end  

  def unfollow(company)
    relationships.find_by(company: company.id).destroy
  end

  def university_with_graduation
    result = ""

    if self.university
      result += self.university + " '"
    end

    if self.graduation
      result += (self.graduation % 100).to_s
    end

    result
  end

end
