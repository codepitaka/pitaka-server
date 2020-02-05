# frozen_string_literal: true

# gives out permitted hosts for each environments
module PermittedHosts
  def self.development
    Rails.application.configure do
      # local/heroku's pitaka-server develop environment hosts
      config.hosts.push ENV['PITAKA_SERVER_HOST']
	  puts "Hello, logs!"
      # heroku's pitaka review app hosts
      if !(ENV['HEROKU_PR_NUMBER'] == '')
        ENV['PITAKA_SERVER_HOST'] = ENV['HEROKU_APP_NAME'] + '.herokuapp.com'
        config.hosts.push ENV['PITAKA_SERVER_HOST']
      end
    end
  end

  def self.production
    Rails.application.configure do
      # heroku's pitaka-server production environment hosts
      config.hosts.push ENV['PITAKA_SERVER_HOST']
	  puts "Hello, logs prd!"
      # heroku's pitaka review app hosts
      if !(ENV['HEROKU_PR_NUMBER'] == '')
        ENV['PITAKA_SERVER_HOST'] = ENV['HEROKU_APP_NAME'] + '.herokuapp.com'
        config.hosts.push ENV['PITAKA_SERVER_HOST']
      end
    end
  end

  def self.test
    Rails.application.configure do
      # test environment hosts: necessary for rspec
      config.hosts.push 'www.example.com'
	  puts "Hello, logs test!"
      # heroku's pitaka review app hosts
      if !(ENV['HEROKU_PR_NUMBER'] == '')
        ENV['PITAKA_SERVER_HOST'] = ENV['HEROKU_APP_NAME'] + '.herokuapp.com'
        config.hosts.push ENV['PITAKA_SERVER_HOST']
      end
    end
  end
end
