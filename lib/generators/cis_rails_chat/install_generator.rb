module CisRailsChat
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def self.source_root
        File.dirname(__FILE__) + "/templates"
      end

      def copy_files
        template "cis_rails_chat.yml", "config/cis_rails_chat.yml"
        if ::Rails.version < "3.1"
          copy_file "../../../../app/assets/javascripts/cis_rails_chat.js", "public/javascripts/cis_rails_chat.js"
          copy_file "../../../../app/assets/javascripts/emoticons_defination.js", "public/javascripts/emoticons_defination.js"
          copy_file "../../../../app/assets/javascripts/emoticons.js", "public/javascripts/emoticons.js"
          copy_file "../../../../app/assets/stylesheets/emoticons.css", "public/stylesheets/emoticons.css"
          copy_file "../../../../app/assets/images/emoticons.png", "public/images/emoticons.png"
        else
          copy_file "../../../../app/assets/javascripts/cis_rails_chat.js", "app/assets/javascripts/cis_rails_chat.js"
          copy_file "../../../../app/assets/javascripts/emoticons_defination.js", "app/assets/javascripts/emoticons_defination.js"
          copy_file "../../../../app/assets/javascripts/emoticons.js", "app/assets/javascripts/emoticons.js"
          copy_file "../../../../app/assets/stylesheets/emoticons.css", "app/assets/stylesheets/emoticons.css"
          copy_file "../../../../app/assets/images/emoticons.png", "app/assets/images/emoticons.png"
        end
        copy_file "cis_rails_chat.ru", "cis_rails_chat.ru"
      end
    end
  end
end
