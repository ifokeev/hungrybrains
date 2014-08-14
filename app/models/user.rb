require 'rubygems'
require 'role_model'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include RoleModel

  validates :password,                presence: true, length: { minimum: 3}, confirmation: false
  #validates :password_confirmation,   presence: true
  validates :email,                   presence: true, uniqueness: true


  roles :admin, :user

  def role
    role_symbols.join(',').gsub('_', ' ')
  end

  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
end
