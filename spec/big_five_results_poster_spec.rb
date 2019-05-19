require 'spec_helper'
require 'big_five_results_poster'

RSpec.describe BigFiveResultsPoster do
  include WebMock::API

  let(:email) { 'R.Sijelmass@gmail.com' }
  let(:results_hash) do 
    json = File.read('spec/fixtures/big_five_profile.json')
    JSON.parse(json)
  end
  let(:instance) { described_class.new(results_hash, email) }
  let(:url) { "https://recruitbot.trikeapps.com/api/v1/roles/senior-team-lead/big_five_profile_submissions" }

  before do
    stub_request(:post, url)
      .with(body: results_hash.to_json,
            headers: {
              'Accept'=>'*/*',
              'Content-Type'=>'application/json',
              'Host'=>'recruitbot.trikeapps.com',
              'User-Agent'=>'Ruby'
             })
      .to_return(status: 201, body: "some-token", headers: {})
  end

  describe '.post' do
    it 'makes a post call through Net::HTTP' do 
      instance.post
      expect(WebMock).to have_requested(:post, url)
        .with { |req| req.body == results_hash.to_json }
    end
     
    it 'returns a response code and token' do
      instance.post
      expect(instance.response_code).to eq "201"
      expect(instance.token).to eq "some-token"
    end
  end
end
