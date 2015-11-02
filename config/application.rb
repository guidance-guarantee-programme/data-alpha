require_relative './boot'

require 'rails'

require 'active_job/railtie'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module PensionWise
  module Data
    class Application < Rails::Application
      # Do not swallow errors in after_commit/after_rollback callbacks.
      config.active_record.raise_in_transactional_callbacks = true
    end
  end
end
