require 'rubygems'
require 'role_model'

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include RoleModel
  has_one :company

  validates :password, presence: true, length: { minimum: 5 }, confirmation: false
  validates :email,    presence: true, email: true, uniqueness: true

  roles :admin, :student, :company

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
