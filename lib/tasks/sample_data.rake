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


  20.times do |n|
    email = "qweqwe#{n+1}@gmail.com"
    password  = "qweqwe"
    name = Faker::Company.name
    description = Faker::Lorem.paragraph(5)
    site = Faker::Internet.url
    employees = rand(1..100) * 10

    user = User.new
    user.email = email
    user.password = password
    user.roles = [:company]

    user.build_company(name: name,
                       description: description,
                       site: site,
                       employees: employees)

    user.save
  end

  40.times do |n|
    email = "qweqwe0#{n+1}@gmail.com"
    password  = "qweqwe"
    name = Faker::Name.name

    user = User.new
    user.email = email
    user.password = password
    user.roles = [:student]

    user.build_student(name: name)

    user.save
  end

end

def make_vacancies
  40.times do |n|
    company_id = rand(Company.count) + 1
    title = [Faker::Hacker.adjective, Faker::Hacker.abbreviation, Faker::Hacker.noun].join(" ")
    brief_description = Faker::Hacker.say_something_smart
    description = Faker::Lorem.paragraph(5)
    salaryfrom = rand(10..30) * 1000
    salaryto = salaryfrom
    Vacancy.create(company_id:        company_id,
                    title:             title,
                    brief_description: brief_description,
                    description:       description,
                    salaryfrom:        salaryfrom,
                    salaryto:          salaryto)
  end
end

def make_responses
  200.times do |n|
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
