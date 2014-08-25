require 'rubygems'
require 'role_model'
require 'securerandom'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include RoleModel
  has_one :company, dependent: :destroy
  has_one :student, dependent: :destroy

  validates :password, presence: true, length: { minimum: 5 }, confirmation: false
  validates :email,    presence: true, email: true, uniqueness: true

  roles :admin, :student, :company

  TEMP_EMAIL_PREFIX = 'change@me'

  def self.find_or_create_by_oauth(auth, profile_type = 'student', current_user = nil)

    if auth.nil? || auth.uid.nil?
      return nil
    end

    identity = Identity.find_for_oauth(auth)

    user = current_user ? current_user : identity.user

    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user_name = auth.extra.raw_info.name
      user = User.where(:email => email).first if email


      if user.nil?
        user = User.new
        user.email = email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
        user.password = SecureRandom.hex(8)

        if profile_type == 'student'
          user.roles = [:student]
          user.build_student(name = user_name)
        else
          user.roles = [:company]
          user.build_company(name = user_name)
        end

        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def role
    role_symbols.join(',').gsub('_', ' ')
  end
end
