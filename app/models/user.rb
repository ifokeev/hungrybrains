require 'rubygems'
require 'role_model'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include RoleModel
  has_one :profile

  validates :password, presence: true, length: { minimum: 6 }, confirmation: false
  validates :email,    presence: true, email: true, uniqueness: true

  roles :admin, :user, :company

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
