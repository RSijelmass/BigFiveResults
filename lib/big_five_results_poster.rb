require 'net/http'
require 'net/https'
require 'json'

class BigFiveResultsPoster
  attr_reader :response_code, :token

  def initialize(results_hash, email)
    @results_hash = results_hash.merge({'EMAIL' => email })  
  end

  def post
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = @results_hash.to_json

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    @response = res
    res&.code == "201"
  end

  def response_code
    return 'no post request yet made' unless @response
    @response.code
  end 

  def token
    return 'no post request yet made' unless @response
    @response.body
  end

  private

  def uri
    URI('https://recruitbot.trikeapps.com/api/v1/roles/senior-team-lead/big_five_profile_submissions')
  end
end
