module Fetchers::Flickr
  BASE_URL = "http://api.flickr.com/services/rest/"
  VERBOSE = true
  FORMAT = "json"

  module Request
    def self.call_method(method, params=[])
      built_url = "#{BASE_URL}?method=flickr.#{method}&format=#{FORMAT}&api_key=#{FLICKR_APPLICATION_API_KEY}&#{params.collect{|k,v| k.to_s+"="+v}.join("&")}"
      puts "CALLING FLICKR: #{built_url}" if VERBOSE
      res = Curl::Easy.http_get(built_url).body_str
      JSON.parse(res.gsub("jsonFlickrApi(","").chop)
    end
  end
end
