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
      expect(subject.to_h['EMAIL']).to eq 'R.Sijelmass@gmail.com'
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

    it 'contains "OVERALL_SCORE" and "FACETS" in the topics' do
      expect(subject.to_h['EXTRAVERSION']).to include(
        'OVERALL_SCORE',
        'FACETS'
      )
    end
  end
end
