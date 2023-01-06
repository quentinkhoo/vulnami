# frozen_string_literal: true

module Vulnami
  module Actions
    module Animes
      class Create < Vulnami::Action
      include Deps["persistence.rom"]

      params do
        required(:anime).hash do
          required(:title).filled(:string)
          required(:genre).filled(:string) 
        end
      end

        def handle(*, response)
          if request.params.valid?
            anime = rom.relations[:animes].changeset(:create, request.params[:anime]).commit

            response.status = 201
            response.body = book.to_json
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
        end
      end
    end
  end
end
