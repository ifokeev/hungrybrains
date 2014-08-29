FactoryGirl.define do
  factory :company_user, class: User do
    sequence(:email) { |n| "qweqwe#{n}@gmail.com"}
    password "qweqwe"
    after(:build) do |user|
      user.company ||= FactoryGirl.build(:company, user: user)
    end
  end

  factory :student_user, class: User do
    sequence(:email) { |n| "qweqwe0#{n}@gmail.com"}
    password "qweqwe"
    after(:build) do |user|
      user.student ||= FactoryGirl.build(:student, user: user)
    end
  end

  factory :company, class: Company do
    name = "Mail.Ru Group"
    after(:build) do |company|
      company.user ||= FactoryGirl.build(:company_user, company: company)
    end
  end

  factory :student, class: Student do
    name = "Bob"
    after(:build) do |student|
      student.user ||= FactoryGirl.build(:student_user, student: student)
    end
  end

end