module ScopeLatest
  extend ActiveSupport::Concern

  included do
    scope :latest, -> { order('id DESC') }
  end
end