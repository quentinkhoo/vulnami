# frozen_string_literal: true

module Vulnami
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/anime", to: "anime.index"
  end
end
