# frozen_string_literal: true

module Vulnami
  module Actions
    module Animes
      class Index < Vulnami::Action
        include Deps["persistence.rom"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          halt 422 unless request.params.valid?
          
          animes = rom.relations[:animes]
            .select(:title, :genre)
            .order(:title)
            .page(request.params[:page] || 1)
            .per_page(request.params[:per_page] || 5)
            .to_a

          response.format = :json
          response.body = animes.to_json
        end
      end
    end
  end
end
