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
    Russian::pluralize(@vacancies.count, "Найдена", 
                                         "Найдено", 
                                         "Найдено"), 
                      @vacancies.count, 
                      Russian::pluralize(@vacancies.count, "вакансия", 
                                                           "вакансии", 
                                                           "вакансий")
  ].join(" ") 
  end
end