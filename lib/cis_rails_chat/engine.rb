require "cis_rails_chat/view_helpers"

module CisRailsChat
  class Engine < Rails::Engine
    # Loads the cis_rails_chat.yml file if it exists.
    initializer "cis_rails_chat.config" do
      path = Rails.root.join("config/cis_rails_chat.yml")
      CisRailsChat.load_config(path, Rails.env) if path.exist?
    end

    # Adds the ViewHelpers into ActionView::Base
    initializer "cis_rails_chat.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
