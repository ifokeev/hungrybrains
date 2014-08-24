class Student < ActiveRecord::Base
  belongs_to :user
  has_many   :responses
  has_many   :vacancies, through: :responses
  has_many   :relationships  
  has_many   :companies, through: :relationships

  def responded?(vacancy)
    responses.find_by(vacancy_id: vacancy.id)
  end

  def respond(vacancy)
    responses.create(vacancy_id: vacancy.id)
  end  

  def revoke(vacancy)
    responses.find_by(vacancy: vacancy.id).destroy
  end  

end
