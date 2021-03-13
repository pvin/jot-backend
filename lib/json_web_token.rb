class JsonWebToken
	def self.encode(payload, expire = 2.hours.from_now)
     payload[:expire] = expire.to_i
     JWT.encode(payload, Rails.application.secrets.secret_key_base)
   end

   def self.decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
end