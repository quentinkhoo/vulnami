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
                if eval(data)&.match(/\A.*(wakuwaku).*$/i)
                  response.body = "wakuwaku anya! here's your flag: " + ENV['TALK_TO_ANYA_FLAG']
                else
                  response.body = "you just gotta send a wakuwaku back!"
                end
              rescue Exception => e
                response.body = "that's not a wakuwaku"
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
