# frozen_string_literal: true

require "hanami"
require "rack"
require "rack/cors"

module Vulnami
  class App < Hanami::App
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :patch, :put, :options]
      end
    end
  end
end
