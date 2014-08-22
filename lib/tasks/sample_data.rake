namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users_and_profiles
    make_vacancies
  end
end

def make_users_and_profiles

  user = User.new
  user.email = "admin@hungrybrains.ru"
  user.password = "admin"
  user.roles = [:admin]
  user.build_company(name: "Admin User")
  user.save


  100.times do |n|
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
end


def make_vacancies
  200.times do |n|
    company_id = rand(Company.count) + 1
    title = [Faker::Hacker.adjective, Faker::Hacker.abbreviation, Faker::Hacker.noun].join(" ")
    brief_description = Faker::Hacker.say_something_smart
    description = Faker::Lorem.paragraph(5)
    salaryfrom = rand(10..30) * 1000
    salaryto = salaryfrom
    Vacancy.create!(company_id:        company_id,
                    title:             title,
                    brief_description: brief_description,
                    description:       description,
                    salaryfrom:        salaryfrom,
                    salaryto:          salaryto)
  end
end

