# frozen_string_literal: true

require 'delayed_job_web'

unless Rails.env.development?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    delayed_job_cred = Rails.application.credentials.dig(:delayed_job)
    # Protect against timing attacks:
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking
    user = delayed_job_cred.dig(:user_name)
    pass = delayed_job_cred.dig(:password)
    Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(username),
                               ::Digest::SHA256.hexdigest(user)) &
      Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password),
                                 ::Digest::SHA256.hexdigest(pass))
  end
end
