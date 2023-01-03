module Vulnami
  module Persistence
    module Relations
      class Animes < ROM::Relation[:sql]
        schema(:animes, infer: true)
      end
    end
  end
end