# frozen_string_literal: true

module Vulnami
  module Actions
    module Animes
      class Show < Vulnami::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          anime = rom.relations[:animes].by_pk(
            request.params[:id]
          ).one

          response.format = :json
          response.body = anime.to_json
          
        end
      end
    end
  end
end
