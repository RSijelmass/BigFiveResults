class BigFiveResultsTextSerializer
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def to_h
    hash = {}
    categories = category_maps_from_text(text)

    categories.each { |category| hash.merge! category_to_hash(category) }
    hash.merge personal_details
  end

  private

  def personal_details
    { 
      'NAME' => 'Rita Sijelmass',
    }
  end

  def category_maps_from_text(text)
    categories = text.split("\n\n")
    categories.map { |category| category.split("\n") }
  end

  def category_to_hash(category)
    category.map! do |line|
      line = line.split('.').reject { |x| x.empty? }
    end

    title = category.first[0]
    score = category.first[1]
    facets = category[1..-1]

    hash = {}
    hash.tap do
      hash[title] = {
      'Overall Score' => score,
      'Facets' => facets.to_h
    }
    end
  end
end
