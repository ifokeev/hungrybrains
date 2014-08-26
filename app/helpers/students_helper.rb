module StudentsHelper

  def full_name(collection)
    if collection.present?
        link_to([collection.name, collection.surname].join(" "), collection)
    end
  end

  def full_university(collection)
    if collection.present? && collection.university
        link_to([collection.university, collection.graduation % 100].join(" '"), collection)
    end
  end

  def student_responses_count(collection)
  [
    "Вы откликнулись на",
    collection.count, 
    Russian::pluralize(collection.count, "вакансию", 
                                         "вакансии", 
                                         "вакансий")
  ].join(" ")     
  end

  def student_following_count(collection)
  [
    "Вы подписаны на",
    collection.count, 
    Russian::pluralize(collection.count, "компанию", 
                                         "компании", 
                                         "компаний")
  ].join(" ")     
  end

end