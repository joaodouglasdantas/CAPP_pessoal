ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # parallelize(workers: :number_of_processors, with: :threads)
    parallelize(workers: 1)
    # isso faz meus testes rodarem em sequência, evitando os conflitos de transação
    fixtures :all
    include Devise::Test::IntegrationHelpers
    # para o sign_in funcionar nos testes vou adicionar o helper do Devise
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
