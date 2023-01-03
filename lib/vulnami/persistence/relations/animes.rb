module Vulnami
  module Persistence
    module Relations
      class Animes < ROM::Relation[:sql]
        schema(:animes, infer: true)
        
        use :pagination
        per_page 5
      end
    end
  end
end