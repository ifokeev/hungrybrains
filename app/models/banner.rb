class Banner < ActiveRecord::Base
  enum position: [ :main_page, :vacancies_page ]
end
