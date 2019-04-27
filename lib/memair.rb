require 'httparty'

class Memair
  def initialize(access_token)
    validate(access_token)
    @access_token = access_token
  end

  def query(query)
    raise KeyError, "query is not a string." unless query.is_a? String
    attempts = 0
    begin
      sleep(attempts * 2)
      response = HTTParty.post("https://memair.com/graphql", body: query, headers: {access_token: @access_token}, timeout: 180)
    rescue
      retry if (attempts += 1) < 8
      raise StandardError, "Can not connect to Memair"
    end
    response.to_h
  end

  private
    def validate(access_token)
      raise KeyError, "access_token is not a string." unless access_token.is_a? String
      raise KeyError, "access_token should be a 43 character base64 string or a 64 character hex string." unless [64, 43].include?(access_token.length)
    end
end
