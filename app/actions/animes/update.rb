# frozen_string_literal: true

module Vulnami
  module Actions
    module Animes
      class Update < Vulnami::Action
        def handle(*, response)
          response.body = self.class.name
        end
      end
    end
  end
end
