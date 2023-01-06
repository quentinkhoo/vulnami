# frozen_string_literal: true

module Vulnami
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/animes", to: "animes.index"
    get "/animes/:id", to: "animes.show"
    post "/animes", to: "animes.create"
  end
end
