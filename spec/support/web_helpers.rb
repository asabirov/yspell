module WebHelpers
  def stub_api_response(body, text = nil, status = 200)
    st = stub_request(:post, "http://speller.yandex.net/services/spellservice.json/checkText")

    unless text.nil?
      st.with(:body => {'text' => text})
    end

    st.to_return(:status => status, :body => body)
  end
end