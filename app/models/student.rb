class Student < ActiveRecord::Base
  include Avatar

  enum language:   [:basic, :intermediate, :advanced, :fluent]
  enum experiense: [:no, :oneless, :onetotwo, :twomore]

  belongs_to :user
  has_many   :responses
  has_many   :vacancies, through: :responses, dependent: :destroy
  has_many   :relationships
  has_many   :companies, through: :relationships, dependent: :destroy
  has_many   :categories, as: :owner

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


  def full_name
    [name, surname].join(" ")
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

  def response_to_vacancy(vacancy)
    self.responses.each do |response|
      response if response.vacancy == vacancy
    end
  end

end
