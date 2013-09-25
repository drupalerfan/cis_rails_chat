module CisRailsChat
  # This class is an extension for the Faye::RackAdapter.
  # It is used inside of CisRailsChat.faye_app.
  class FayeExtension
    # Callback to handle incoming Faye messages. This authenticates both
    # subscribe and publish calls.
    def incoming(message, callback)
      if message["channel"] == "/meta/subscribe"
        authenticate_subscribe(message)
      elsif message["channel"] !~ %r{^/meta/}
        authenticate_publish(message)
      end
      callback.call(message)
    end

  private

    # Ensure the subscription signature is correct and that it has not expired.
    def authenticate_subscribe(message)
      subscription = CisRailsChat.subscription(:channel => message["subscription"], :timestamp => message["ext"]["cis_rails_chat_timestamp"])
      if message["ext"]["cis_rails_chat_signature"] != subscription[:signature]
        message["error"] = "Incorrect signature."
      elsif CisRailsChat.signature_expired? message["ext"]["cis_rails_chat_timestamp"].to_i
        message["error"] = "Signature has expired."
      end
    end

    # Ensures the secret token is correct before publishing.
    def authenticate_publish(message)
      if CisRailsChat.config[:secret_token].nil?
        raise Error, "No secret_token config set, ensure cis_rails_chat.yml is loaded properly."
      elsif message["ext"]["cis_rails_chat_token"] != CisRailsChat.config[:secret_token]
        message["error"] = "Incorrect token."
      else
        message["ext"]["cis_rails_chat_token"] = nil
      end
    end
  end
end
