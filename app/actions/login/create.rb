# frozen_string_literal: true

module Vulnami
  module Actions
    module Login

      class User
        attr_accessor :username, :is_admin

        def to_json(*args)
          {
            username: @username,
            is_admin: @is_admin
          }.to_json(*args)
        end

        def self.from_json(json)
          user = User.new
          user.username = json['username'].nil? ? 'loid' : json['username']
          user.is_admin = false ## nobody can be an admin now muahahah
          user
        end
      end
      
      class Create < Vulnami::Action

        def handle(request, response)
          if request.content_type == "application/json"
            begin

              default_user = JSON.parse('{"username": "loid", "is_admin": false}')
              default_preferences = JSON.parse('{"remember_me": false, "send_newsletter": false, "want_flag": false}')

              data = request.body.read
              obj = JSON.parse(data)

              # our checks
              if obj['user'].nil?
                response.body = "user is missing"
                return
              end
              user = default_user.merge(obj['user'])

              if obj['preferences'].nil?
                response.body = "preferences is missing"
                return
              end
              preferences = default_preferences.merge(obj['preferences'])

              userobj = User.from_json(user)

              userjson = JSON.parse(userobj.to_json)
              fulljson = userjson.merge(preferences)

              response.format = :json
              if fulljson['want_flag']
                if fulljson['is_admin']
                  response.body = "here is ur flag: " +  ENV['LOGIN_FLAG']
                else
                  response.body = "only admins can get the flag!"
                end
              else
                response.body = json
              end

            rescue Exception => e
              response.body = e
            end
          else
            response.status = 415
            response.body = "Invalid mime type!"
          end
        end
      end
    end
  end
end
