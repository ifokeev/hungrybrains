#encoding: utf-8
module Banners
  extend ActiveSupport::Concern

  private

    def load_grouped_banners
      @banners = Banner.where(:active => true).group_by(&:position)
    end
end