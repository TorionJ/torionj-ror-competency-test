ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  # Add more helper methods to be used by all tests here...
  def log_in(user)
    if integration_test?
      login_as(user, scope: user)
    else
      sign_in(user)
    end
  end

  def assert_belongs_to(model, other)
    assert_association(model, :belongs_to, other)
  end

  def assert_has_many(model, other)
    assert_association(model, :has_many, other)
  end

  def assert_association(model, type, other)
    assert model.reflect_on_all_associations(type).any? { |a| a.name.to_s == other.to_s }
  end
end
