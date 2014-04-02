require 'httpclient'
require 'multi_json'

module SpellChecker
  class Client

    API_PATH_SINGLE_CHECK = 'http://speller.yandex.net/services/spellservice.json/checkText'

    API_PATH_MULTIPLE_MULTIPLE = 'http://speller.yandex.net/services/spellservice.json/checkTexts'

    def check(text)
      request(text)
    end


    def request(text)
      http = HTTPClient.new
      raw_response = http.post(API_PATH_SINGLE_CHECK, "text" => text)

      response = MultiJson.load(raw_response.body).first

      Container.new(response)
    end
  end
end