class Zype
  include HTTParty

  BASE_URL = "https://api.zype.com"

  def initialize()
    @api_key = Rails.application.credentials.zype[:api_key]
  end

  def get_access_token(email, password)
    url = "https://login.zype.com/oauth/token/"
    response = HTTParty.post(url, body: {
      client_id: Rails.application.credentials.zype[:client_id],
      client_secret: Rails.application.credentials.zype[:client_secret],
      username: email, password: password, grant_type: 'password'
    })
    JSON.parse(response.body)['access_token']
  end

  def get_videos
    uri = URI.parse("#{BASE_URL}/videos?app_key=#{@api_key}")
    response = HTTParty.get(uri)
    parse_response(response)
  end

  def get_video(id)
    uri = URI.parse("#{BASE_URL}/videos/#{id}?app_key=#{@api_key}")
    response = HTTParty.get(uri)
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body)["response"]
  end
end
