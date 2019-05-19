class BigFiveResultsTextSerializer
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def to_h
    p text
  end
end
