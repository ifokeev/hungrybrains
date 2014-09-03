module Avatar
  extend ActiveSupport::Concern

  included do
    has_attached_file :avatar, styles: { medium: "200x200!",
                                         thumb:  "75x75!" },
                      default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  end


  def avatar_from_url(url)
    self.avatar = URI.parse(url)
  end
end