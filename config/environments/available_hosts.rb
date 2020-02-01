# frozen_string_literal: true

Rails.application.configure do
  config.hosts.push 'port-3000-pitaka.run.goorm.io', 'pitaka-jnclz.run.goorm.io',
                    'pitaka-web-page-edit-we5mit4np.herokuapp.com', 'pitaka-web-dev.herokuapp.com',
                    'pitaka-web.herokuapp.com',
                    config.web_console.whiny_requests = false
end
