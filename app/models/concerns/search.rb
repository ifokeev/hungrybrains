module Search
  extend ActiveSupport::Concern

  module ClassMethods
    def search(search)
      if search
        search_for(search)
      else
        all
      end
    end
  end
end