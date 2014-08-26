module VacanciesHelper

  def vacancy_title(collection)
    raw [
            link_to(
                (collection.company.name if collection.company),
                collection.company
            ),
            link_to(
                collection.title,
                collection
            )
        ].join(" : ")
  end

  def vacancy_description(collection)
    ["Описание", collection.brief_description].join(": ")
  end

  def vacancies_search_count(collection)
  [
    Russian::pluralize(collection.count, "Найдена", 
                                         "Найдено", 
                                         "Найдено"), 
                      collection.count, 
                      Russian::pluralize(collection.count, "вакансия", 
                                                           "вакансии", 
                                                           "вакансий")
  ].join(" ") 
  end

  def all_responses_link(collection)
    link_to([ "Все отклики (", 
              collection.responses.count,
              ")"
            ].join(""),
            responses_vacancy_path(collection))
  end

  def unreviewed_responses_link(collection)
    link_to([ "Непросмотренные (", 
              collection.responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/unreviewed")
  end

  def accepted_responses_link(collection)
    link_to([ "Принятые (", 
              collection.responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/accepted")
  end

  def rejected_responses_link(collection)
    link_to([ "Отклоненные (", 
              collection.responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/rejected")
  end

end