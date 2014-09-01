#encoding: utf-8
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

  def all_responses_link(collection, responses)
    link_to([ "Все отклики (", 
              responses.count,
              ")"
            ].join(""),
            responses_vacancy_path(collection))
  end

  def unreviewed_responses_link(collection, responses)
    link_to([ "Непросмотренные (", 
              responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/unreviewed")
  end

  def accepted_responses_link(collection, responses)
    link_to([ "Принятые (", 
              responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/accepted")
  end

  def rejected_responses_link(collection, responses)
    link_to([ "Отклоненные (", 
              responses.count,
              ")"
            ].join(""),
            "/vacancies/#{collection.id}/responses/rejected")
  end


  def duration_in_months(duration)
    [ duration,
      Russian::pluralize(duration, "месяц", 
                                   "месяца", 
                                   "месяцев")
    ].join(" ")
  end

  def deadline_from_date(date)
    date0 = Date.today
    result = (date - date0).to_i
    if result < 7
      [ result,
        Russian::pluralize(result, "день", 
                                   "дня", 
                                   "дней")
      ].join(" ")
    else
      result /= 7
      [ result,
        Russian::pluralize(result, "неделя", 
                                   "недели", 
                                   "недель")
      ].join(" ")    
    end
  end

  def from_grade(min_grade)
    [ "от", min_grade, "курса" ].join(" ")
  end

end