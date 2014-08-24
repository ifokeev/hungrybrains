class Student < ActiveRecord::Base
  belongs_to :user
  has_many   :responses
  has_many   :vacancies, through: :responses, :dependent => :destroy
  has_many   :relationships
  has_many   :companies, through: :relationships, :dependent => :destroy

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

end
