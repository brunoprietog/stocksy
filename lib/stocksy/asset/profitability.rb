# frozen_string_literal: true

module Stocksy::Asset::Profitability
  def profitability_summary
    {
      "1D" => profitability_ago(1.day),
      "5D" => profitability_ago(5.days),
      "1M" => profitability_ago(1.month),
      "6M" => profitability_ago(6.months),
      "YTD" => profitability_from(Date.today.beginning_of_year),
      "1Y" => profitability_ago(1.year),
      "5Y" => profitability_ago(5.years)
    }
  end

  private

  def profitability_ago(time_ago)
    initial_date = time_ago == 1.day ? last_traded_date - 1.day : Date.today - time_ago
    profitability_from(initial_date)
  end

  def profitability_from(date)
    profitability_between(date, last_traded_date)
  end

  def profitability_between(initial_date, final_date)
    initial_date = closest_traded_date_from(initial_date)
    final_date = closest_traded_date_from(final_date)
    initial_price = time_series_dayly[initial_date.to_s].close.to_f
    final_price = time_series_dayly[final_date.to_s].close.to_f
    profitability = ((final_price - initial_price) / initial_price) * 100
    profitability.round(2)
  end
end
