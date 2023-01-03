module Vulnami
  module Persistence
    module Relations
      class Anime < ROM::Relation[:sql]
        schema(:anime, infer: true)
      end
    end
  end
end