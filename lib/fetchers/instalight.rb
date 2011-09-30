module Fetchers::Instalight
  BASE_URL = "https://api.instagram.com/v1/"
  VERBOSE = true
  FORMAT = "json"

  class User
    attr_accessor :access_token
    def initialize(access_token)
      self.access_token = access_token
    end

    def call_method(method, params=[])
      built_url = "#{BASE_URL}users/#{method}?access_token=#{access_token}&#{params.join("&")}"
      puts "CALLING INSTAGRAM: #{built_url}" if VERBOSE
      res = Curl::Easy.http_get(built_url).body_str
      res = JSON.parse(res)
      raise "Problem with Instagram, code #{res["meta"]["code"]}" unless res["meta"]["code"] == 200
      res["data"]
    end
  end

end
