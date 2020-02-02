# frozen_string_literal: true

# gives out permitted hosts for each environments
module PermittedHosts
  def self.development
    Rails.application.configure do
      config.hosts.push 'port-3000-pitaka.run.goorm.io', 'pitaka-jnclz.run.goorm.io' # local environment hosts
      config.hosts.push 'pitaka-web-page-edit-we5mit4np.herokuapp.com',
                        'pitaka-serve-publish-ap-qc2c9q.herokuapp.com' # heroku review app hosts
      config.hosts.push 'pitaka-web-dev.herokuapp.com', 'pitaka-server-dev.herokuapp.com' # heroku dev app hosts
    end
  end

  def self.production
    Rails.application.configure do
      config.hosts.push 'pitaka-web.herokuapp.com', 'pitaka-server.herokuapp.com'         # heroku prd app hosts
    end
  end

  def self.test
    Rails.application.configure do
      config.hosts.push 'www.example.com'                                                 # test environment hosts
    end
  end
end
