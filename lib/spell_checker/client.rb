require 'httpclient'
require 'multi_json'

module SpellChecker
  class Client

    API_PATH_SINGLE_CHECK = 'http://speller.yandex.net/services/spellservice.json/checkText'

    API_PATH_MULTIPLE_MULTIPLE = 'http://speller.yandex.net/services/spellservice.json/checkTexts'

    def check(text, options = {})
      params = options.merge('text' => text)
      request(params)
    end


    def request(params)
      http = HTTPClient.new
      raw_response = http.post(API_PATH_SINGLE_CHECK, params)

      response = MultiJson.load(raw_response.body).first

      Container.new(response)
    end
  end
end