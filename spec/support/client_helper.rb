# frozen_string_literal: true
require 'logger'

module ClientHelper
  def create_client(options = {})
    options[:logger] = Logger.new(STDOUT) if ENV['VERBOSE']
    options = {
      username: 'zendesk2@example.org',
      url: 'https://www.zendesk.com',
    }.merge(Zendesk2.defaults).merge(options)

    Zendesk2.new(options)
  end
end

RSpec.configure do |config|
  config.include(ClientHelper)
end
