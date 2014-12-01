require 'rails/commands/server'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

module DefaultOptions
  def default_options
    super.merge!(Port: 3001)
  end
end

Rails::Server.send(:prepend, DefaultOptions)