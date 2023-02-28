# frozen_string_literal: true

module Vulnami
  module Actions
    module TalkToAnya
      class Index < Vulnami::Action

        def handle(request, response)
          if request.params[:anya]
            data = request.params[:anya]
            if data =~ /\A[\d<>(){}|+-=*\/%\s\'\"]+$/
              begin
                if eval(data)&.match(/\A.*(hello).*$/i)
                  response.body = "hello anya! here's your flag!"
                else
                  response.body = "you just gotta send an anya saying hello"
                end
              rescue Exception => e
                response.body = "that's not a hello"
              end
            else
              response.body = "i don't understand what anya is saying"
            end
          else
            response.body = "no anya detected! send an anya over!"
          end
        end
      end
    end
  end
end
