require 'big_five_results_text_serializer'

RSpec.describe BigFiveResultsTextSerializer do
  let(:text) do 
    File.read('spec/fixtures/big_five_profile.txt')
  end
  let(:instance) { BigFiveResultsTextSerializer }
  subject { instance.new(text) }

  describe '.to_h' do
    it 'contains personal details' do
      expect(subject.to_h['NAME']).to eq 'Rita Sijelmass'
    end

    it 'contains topic names as keys' do
      expect(subject.to_h.keys).to include(
        'EXTRAVERSION',
        'AGREEABLENESS',  
        'CONSCIENTIOUSNESS',
        'NEUROTICISM',
        'OPENNESS TO EXPERIENCE'
      )
    end

    it 'contains "Overall Score" and "Facets" in the topics' do
      expect(subject.to_h['EXTRAVERSION']).to include(
        'Overall Score',
        'Facets'
      )
      pp subject.to_h
    end
  end
end
