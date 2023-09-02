# frozen_string_literal: true

require "active_support/concern"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/numeric/time"
require "active_support/core_ext/integer/time"

class Stocksy::Asset
  include Overview
  include Profitability

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def last_traded_date
    @last_traded_date ||= closest_traded_date_from(Date.today)
  end

  private

  def closest_traded_date_from(date)
    10.times do |days|
      next_date = date - days.days
      return next_date if time_series_dayly[next_date.to_s]
    end
    raise Stocksy::Error, "No trading date found in the last 10 days from #{date}"
  end

  def time_series_dayly
    @time_series_dayly ||= Stocksy::AlphaVantage.get_time_series_dayly(symbol)
  end
end
