namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users_and_profiles    
    make_vacancies
    make_responses
    make_relationships
  end
end

def make_users_and_profiles

  user = User.new
  user.email = "admin@hungrybrains.ru"
  user.password = "admin"
  user.roles = [:admin]
  user.build_student(name: "Admin User")
  user.save


  10.times do |n|
    email = "qweqwe#{n+1}@gmail.com"
    password  = "qweqwe"

    user = User.new
    user.email = email
    user.password = password
    user.roles = [:company]

    company = Company.new
    company.name = Faker::Company.name
    company.description = Faker::Lorem.paragraph(5)
    company.site = Faker::Internet.url
    company.employees = rand(1..100) * 10
    company.agency = [true, false].sample
    company.phone = Faker::PhoneNumber.cell_phone
    company.avatar_from_url(Faker::Company.logo)
    company.categories << Category.new(name: "IT")

    company.save
    user.company = company
    user.save
  end

  10.times do |n|
    email = "qweqwe0#{n+1}@gmail.com"
    password  = "qweqwe"
    
    user = User.new
    user.email = email
    user.password = password
    user.roles = [:student]
    
    student = Student.new
    student.name = Faker::Name.first_name
    student.surname = Faker::Name.last_name
    student.location = Faker::Address.city
    student.university = Faker::Hacker.abbreviation
    student.grade = rand(1..6)
    student.graduation = rand(2010..2020)
    student.experience = rand(0..3)
    student.work = Faker::Name.title
    student.language = rand(0..3)
    student.description = Faker::Lorem.paragraph(5)
    student.brief_description = Faker::Hacker.say_something_smart
    student.avatar_from_url(Faker::Company.logo)
    student.categories << Category.new(name: "IT")

    student.save
    user.student = student
    user.save
  end

end

def make_vacancies
  20.times do |n|
    vacancy = Vacancy.new
    vacancy.company_id = rand(Company.count) + 1
    vacancy.title = [Faker::Hacker.adjective, Faker::Hacker.abbreviation, Faker::Hacker.noun].join(" ")
    vacancy.brief_description = Faker::Hacker.say_something_smart
    vacancy.description = Faker::Lorem.paragraph(5)
    vacancy.salaryfrom = rand(10..30) * 1000
    vacancy.salaryto = vacancy.salaryfrom
    vacancy.paid = [true, false].sample
    vacancy.min_grade = rand(2..5)
    vacancy.instruction = Faker::Lorem.paragraph(2)
    vacancy.categories << Category.new(name: "IT")

    vacancy.save
  end
end

def make_responses
  100.times do |n|
    vacancy_id = rand(Vacancy.count) + 1
    student_id = rand(Student.count) + 1
    status = rand(3)

    Response.create(vacancy_id: vacancy_id,
                    student_id: student_id,
                    status: status)
  end  
end

def make_relationships
  40.times do |n|
    company_id = rand(Company.count) + 1
    student_id = rand(Student.count) + 1
    company = Company.find_by(id: company_id)
    student = Student.find_by(id: student_id)
    student.follow(company)
  end
end
