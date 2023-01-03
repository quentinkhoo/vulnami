# frozen_string_literal: true

module Vulnami
  module Actions
    module Home
      class Show < Vulnami::Action
        def handle(*, response)
          vulnami = "weebs"
          response.body = "<h1>Welcome #{vulnami}!</h1>"
        end
      end
    end
  end
end
