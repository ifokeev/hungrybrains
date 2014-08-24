class Company < ActiveRecord::Base
  belongs_to :user
  has_many   :vacancies, :dependent => :destroy
  has_many   :relationships
  has_many   :students, through: :relationships, :dependent => :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", 
                                       thumb:  "100x100>" }, 
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
   
  def following?(student)
    relationships.find_by(student_id: student.id)
  end

  def follow(student)
    relationships.create(student_id: student.id)
  end  

  def unfollow!(student)
    relationships.find_by(student: student.id).destroy
  end  
 
end
