#encoding: utf-8
module CompaniesHelper
  def company_count_russian(count)
    [
        Russian::pluralize(count, "Найдена", "Найдено", "Найдено"),
        count,
        Russian::pluralize(count, "компания", "компании", "компаний")
    ].join(" ")
  end

  def vacancies_count_russian(count)
    Russian::pluralize(count, "вакансия", 
                              "вакансии", 
                              "вакансий")
  end
end