# frozen_string_literal: true

module Wakuwaku
  module Actions
    module Anime
      class Index < Wakuwaku::Action
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
