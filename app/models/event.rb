require "babosa"

class Event < ActiveRecord::Base
  extend FriendlyId
  by_star_field :release_at
  friendly_id :title, :use => :slugged
  acts_as_taggable

  has_attached_file :image, styles: { medium: "200x200!",
                                      thumb:  "75x75!" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  scope :sort_by_sort_index, -> { order('sort DESC') }
  scope :latest, -> { order('release_at DESC') }
  scope :published, -> { where(:published => true) }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def self.by_date(date)
    if date
      where("published = ? AND strftime('%Y/%m/%d', release_at) = ?", true, date.to_date.strftime('%Y/%m/%d'))
    else
      published
    end
  end

  rails_admin do
    list do
      fields :id, :image, :title, :preview, :txt, :published
      field :tag_list
      field :created_at do
        date_format :short
      end
    end
    edit do
      field :release_at
      field :image
      field :title do
        required true
      end
      field :preview do
        required true
      end
      field :txt do
        required true
      end
      field :tag_list do
        html_attributes do
          {:style => "width:90%"}
        end
      end
      field :published do
        default_value do
          true
        end
      end
      field :created_at do
        date_format :short
        read_only true
      end
      field :sort
    end
  end

end
