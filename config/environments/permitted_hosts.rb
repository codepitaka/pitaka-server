# frozen_string_literal: true

# gives out permitted hosts for each environments
module PermittedHosts
  def self.development
    Rails.application.configure do
      host_dev = server_host_for_app
      config.hosts.push host_dev
    end
  end

  def self.production
    Rails.application.configure do
      host_prd = server_host_for_app
      config.hosts.push host_prd
    end
  end

  def self.test
    Rails.application.configure do
      host_rspec = server_host_for_rspec
      config.hosts.push host_rspec

      host_review = server_host_for_review_app
      config.hosts.push host_review
    end
  end
end

def server_host_for_app
  raise 'Environment variable PITAKA_SERVER_HOST not found.' if ENV['PITAKA_SERVER_HOST'].nil?

  host = ENV['PITAKA_SERVER_HOST']
  host
rescue StandardError => e
  warn "[Environment Variable Warning] : #{e.message}!"
end

def server_host_for_review_app
  raise 'Environment variable HEROKU_PR_NUMBER not found.' if ENV['HEROKU_PR_NUMBER'].nil?

  ENV['PITAKA_SERVER_HOST'] = ENV['HEROKU_APP_NAME'] + '.herokuapp.com'
  host = ENV['PITAKA_SERVER_HOST']
  host
rescue StandardError => e
  warn "[Environment Variable Warning] : #{e.message}"
end

def server_host_for_rspec
  'www.example.com'
end
