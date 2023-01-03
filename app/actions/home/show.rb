# frozen_string_literal: true

module Vulnami
  module Actions
    module Home
      class Show < Vulnami::Action
        def handle(*, response)
          response.body = "Welcome weebs!"
        end
      end
    end
  end
end
