# require 'rubygems'
# require 'httparty'

# class NewsResty
#   include httparty
#   base_uri "newsdata.io/"

#   def posts
#     self.class.get('api/1/news?apikey=pub_97288f1a2f44a1c380a3ddcac683ad3a377f&q=russia')
#   end
# end

# news_resty = NewsResty.new
# puts news_resty.posts
