# frozen_string_literal: true

module Vulnami
  module Actions
    module Animes
      class Destroy < Vulnami::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          anime = rom.relations[:animes].by_pk(
            request.params[:id]
          ).destroy
          response.body = self.class.name
        end
      end
    end
  end
end
