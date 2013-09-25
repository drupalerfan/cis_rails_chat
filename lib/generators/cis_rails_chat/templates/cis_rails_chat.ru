# Run with: rackup cis_rails_chat.ru -s thin -E production
require "bundler/setup"
require "yaml"
require "faye"
require "cis_rails_chat"

Faye::WebSocket.load_adapter('thin')

CisRailsChat.load_config(File.expand_path("../config/cis_rails_chat.yml", __FILE__), ENV["RAILS_ENV"] || "development")
run CisRailsChat.faye_app
