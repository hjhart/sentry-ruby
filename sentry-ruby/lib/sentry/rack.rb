require 'time'
require 'rack'

require 'sentry/rack/interface'

module Sentry
  module Rack
    class << self
      def capture_exception(exception, env, **options)
        Sentry.capture_exception(exception, **options) do |evt|
          evt.interface :http do |int|
            int.from_rack(env)
          end
        end
      end
    end
  end
end

require 'sentry/rack/capture_exception'