require 'big_five_results_text_serializer'

RSpec.describe BigFiveResultsTextSerializer do
  let(:text) { "test" }
  let(:instance) { BigFiveResultsTextSerializer.new(text) }

  it "" do
    instance.to_h
  end
end
