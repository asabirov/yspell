module WebHelpers
  def stub_response(text, body, status = 200)
    stub_request(:post, "http://speller.yandex.net/services/spellservice.json/checkText").
        with(:body => {'text' => text},
             :headers => {'Content-Type' => 'application/x-www-form-urlencoded'}).
        to_return(:status => status, :body => body)
  end
end