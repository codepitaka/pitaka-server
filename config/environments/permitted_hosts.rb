# frozen_string_literal: true

# gives out permitted hosts for each environments
module PermittedHosts
  def self.development
    Rails.application.configure do
      # local/heroku's pitaka-server develop environment hosts
	  if !ENV['PITAKA_SERVER_HOST']=='':
        config.hosts.push ENV['PITAKA_SERVER_HOST']
      # heroku's pitaka review app hosts
      if !ENV['HEROKU_PR_NUMBER'] == ''
        review_app_name = ENV['HEROKU_APP_NAME']
        review_app_host = review_app_name + '.herokuapp.com'
        config.hosts.push review_app_host
      end
    end
  end

  def self.production
    Rails.application.configure do
      # heroku's pitaka-server production environment hosts
	  if !ENV['PITAKA_SERVER_HOST']=='':
      config.hosts.push ENV['PITAKA_SERVER_HOST']
    end
  end

  def self.test
    Rails.application.configure do
      # test environment hosts: necessary for rspec
      config.hosts.push 'www.example.com'
    end
  end
end
