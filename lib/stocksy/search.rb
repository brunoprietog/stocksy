# frozen_string_literal: true

class Stocksy::Search
  attr_reader :results

  def initialize(keywords)
    @results = Stocksy::AlphaVantage.search(keywords)
  end
end
