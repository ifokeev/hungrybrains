namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_profiles
    make_vacancies
  end
end

def make_users
  100.times do |n|
    email = "qweqwe#{n+1}@gmail.com"
    password  = "qweqwe"
    User.create!(email:    email,
                 password: password)
  end
end

def make_profiles
  100.times do |n|
    user_id = n;
    name = Faker::Company.name
    Profile.create!(user_id: user_id,
                    name:    name)
  end
end

def make_vacancies
  200.times do |n|
    profile_id = rand(Profile.count) + 1;
    title = Faker::Company.name
    brief_description = Faker::Hacker.say_something_smart
    description = Faker::Lorem.paragraph(5)
    salaryfrom = rand(10..30) * 1000
    salaryto = salaryfrom
    Vacancy.create!(profile_id:        profile_id,
                    title:             title,
                    brief_description: brief_description,
                    description:       description,
                    salaryfrom:        salaryfrom,
                    salaryto:          salaryto)
  end
end

