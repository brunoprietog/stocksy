# frozen_string_literal: true

require "net/http"
require "json"
require "active_support/inflector"
require "active_support/ordered_options"

module Stocksy::AlphaVantage
  extend self
  URL = "https://www.alphavantage.co/query"

  def overview(symbol)
    response = get(function: "OVERVIEW", symbol:)
    optionize(response)
  end

  def get_time_series_dayly(symbol)
    response = get(function: "TIME_SERIES_DAILY", symbol:, outputsize: "full")
    normalize_response(response["Time Series (Daily)"])
  end

  def search(keywords)
    response = get(function: "SYMBOL_SEARCH", keywords:)
    normalize_response(response["bestMatches"])
  end

  private

  def get(params)
    uri = URI.parse(URL)
    uri.query = URI.encode_www_form(params.merge(apikey: api_key))
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def api_key
    ApiKey.fetch
  end

  def normalize_response(response)
    if response.is_a?(Array)
      response.map! { |hash| optionize(hash) }
    elsif response.is_a?(Hash)
      response.transform_values! { |hash| optionize(hash) }
    end
  end

  def optionize(hash)
    hash.transform_keys! { |key| key.split.last.underscore.to_sym }
    ActiveSupport::InheritableOptions.new(hash)
  end
end
