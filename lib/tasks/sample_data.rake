namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users_and_profiles
    make_vacancies
  end
end

def make_users_and_profiles
  100.times do |n|
    email = "qweqwe#{n+1}@gmail.com"
    password  = "qweqwe"
    name = Faker::Company.name

    user = User.new
    user.email = email
    user.password = password


    user.build_profile(name: name)

    user.save
  end
end


def make_vacancies
  200.times do |n|
    profile_id = rand(Profile.count) + 1
    title = [Faker::Hacker.adjective, Faker::Hacker.abbreviation, Faker::Hacker.noun].join(" ")
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

