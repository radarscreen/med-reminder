require 'clockwork'
require 'clockwork/database_events'
require_relative './config/boot'
require_relative './config/environment'
require_relative './app/workers/SendSMS'

module Clockwork

  # required to enable database syncing support
  Clockwork.manager = DatabaseEvents::Manager.new

  sync_database_events model: Medicine, every: 1.minute do |model_instance|
    # performing some work with Sidekiq
    SendSMS.perform_async model_instance.id
  end

end