# frozen_string_literal: true

module Wakuwaku
  module Actions
    module Home
      class Show < Wakuwaku::Action
        def handle(*, response)
          response.body = "Welcome weebs!"
        end
      end
    end
  end
end
