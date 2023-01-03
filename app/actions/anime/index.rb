# frozen_string_literal: true

module Vulnami
  module Actions
    module Anime
      class Index < Vulnami::Action
      include Deps["persistence.rom"]

        def handle(*, response)
          animes = rom.relations[:anime]
            .select(:title, :genre, :episodes)
            .order(:title)
            .to_a

          response.format = :json
          response.body = animes.to_json
        end
      end
    end
  end
end
