# frozen_string_literal: true

module Vulnami
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/animes", to: "animes.index"
    get "/animes/:id", to: "animes.show"
    post "/animes", to: "animes.create"
    delete "/animes/:id", to: "animes.destroy"
    patch "/animes/:id", to: "animes.update"
  end
end
