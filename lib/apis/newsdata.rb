require 'httparty'
require 'json'

      response = HTTParty.get("https://newsdata.io/api/1/news?apikey=pub_97288f1a2f44a1c380a3ddcac683ad3a377f&language=en&country=us&q=ukraine")

      body = JSON.parse(response.body) if response.code == 200

      puts body


