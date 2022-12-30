# frozen_string_literal: true

module Wakuwaku
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/anime", to: "anime.index"
  end
end