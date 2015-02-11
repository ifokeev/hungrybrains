class News < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "200x200!",
                                       thumb:  "75x75!" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def self.by_month_and_year(date)
    if date
      where("published = ? AND strftime('%Y/%m', created_at) = ?", true, date.to_date.strftime('%Y/%m'))
    else
      where(:published => true)
    end
  end
end
